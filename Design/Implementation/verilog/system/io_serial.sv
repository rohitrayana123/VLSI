///////////////////////////////////////////////////////////////////////
//
// serial i/o module
//              2 words   (A000-A001)
//
// Visible Registers:
//
//  Read
//    A000  read_data
//    A001  status
//
//  Write
//    A000  write_data
//    A001  control
//
// Bits within status/control registers
//
//  Bits within status register
//    Bit 15  IRQ
//    Bit 5   TX_INT_REQ (transmit interrupt request)
//    Bit 4   RX_INT_REQ (receive interrupt request)
//    Bit 3   TX_INT_MASK (transmit interrupt enable)
//    Bit 2   RX_INT_MASK (receive interrupt enable)
//    Bit 1   nTXE (not transmit buffer empty)
//    Bit 0   nRXF (not receive buffer full)
//
//  Bits within control register
//    Bit 1   TX_INT_MASK (transmit interrupt enable)
//    Bit 0   RX_INT_MASK (receive interrupt enable)
//
//
// Operation of the Serial Input
//
//  nRXF goes low when data is received and available in the
//  read_data register. If the RX_INT_MASK bit is high then an interrupt
//  will also be generated (the RX_INT_REQ and IRQ bits in the
//  status register will go high and the nIRQ output of the
//  module will go low).
//
//  Reading from the read_data register will automatically clear the
//  RXF bit (nRXF goes high) and any associated interrupt if there is
//  no more data available.
//
// Operation of the Serial Output
//
//  nTXE goes low to indicate that there is space available in the
//  write_data register. If the TX_INT_MASK bit is high then an interrupt
//  will also be generated (the TX_INT_REQ and IRQ bits in the
//  status register will go high and the nIRQ output of the
//  module will go low).
//
//  Writing to the write_data register will automatically clear the
//  TXE bit (nTXE goes high) and any associated interrupt.
//
///////////////////////////////////////////////////////////////////////

`ifdef data_file
  // already defined - do nothing
`else
  `define data_file  "system/serial_data.hex"
`endif

`ifdef serial_access_time
  // already defined - do nothing
`else
  `define serial_access_time 500ns
`endif


module io_serial(
  demux_bus.Slave Bus,
  input nCE,
  input Clock, nReset
  );

timeunit 1ns;
timeprecision 100ps;

parameter max_vals=10;

wire [0:0] Address=Bus.Address[0];  

logic [15:0] received_data_value[0:max_vals-1];
integer received_data_cycle[0:max_vals-1];
integer received_data_cycle_and_value[0:(max_vals*2)-1];
integer count;

logic [15:0] read_data;
logic [15:0] write_data;
logic [0:0] write_address;

logic [15:0] status;

logic RX_INT_MASK, TX_INT_MASK;        //Interrupt masks (high to enable interupts)

logic RXF;
logic TXE;

logic RX_INT_REQ, TX_INT_REQ;
logic IRQ;

logic read_enable, write_enable;

logic delay;

  initial
    begin
      $readmemh(`data_file, received_data_cycle_and_value);
      for (count = 0; count < max_vals; count = count + 1)
        begin
          received_data_cycle[count]=received_data_cycle_and_value[2*count];
          received_data_value[count]=received_data_cycle_and_value[(2*count)+1];
        end
    end


  initial
    delay = 0;

  always @(negedge nCE or Address)
    if (! nCE)
      begin
        delay = 1;
        #`serial_access_time
        delay = 0;
      end 

  // The #20 delay here ensures that the data is available before nWait goes high
  assign #20 Bus.nWait = (delay && !nCE && (!Bus.nOE || !Bus.RnW)) ? 0 : 1'bz;

  assign #20 Bus.nIRQ = (IRQ) ? 0 : 1'bz;
  assign IRQ = RX_INT_REQ || TX_INT_REQ;
  assign RX_INT_REQ = (RXF && RX_INT_MASK);
  assign TX_INT_REQ = (TXE && TX_INT_MASK);
    
  assign status = { IRQ, 9'd0, TX_INT_REQ,RX_INT_REQ,
                    TX_INT_MASK,RX_INT_MASK, !TXE,!RXF};

  assign read_enable = Bus.RnW && !Bus.nOE && !nCE;

  assign Bus.Data = (!read_enable) ? 16'bz : (Address == 0) ? read_data : status;

  assign write_enable = !Bus.RnW && !nCE;

  always @(posedge nCE, negedge nReset)
    if (!nReset)
      begin
        write_data <= 0;
        RX_INT_MASK <= 0;
        TX_INT_MASK <= 0;
      end
    else
      if ((Address == 0) && !Bus.RnW) // Write data
        begin
          write_data <= Bus.Data;
          TXE <= 0;
          if ( TX_INT_MASK )
            $display( $time,  ":   Interrupt Cleared (Serial Data Output)" );
        end
      else if ((Address == 1) && !Bus.RnW) // Write control
        begin
          RX_INT_MASK <= Bus.Data[0];
          TX_INT_MASK <= Bus.Data[1];
        end
      else if ((Address == 0) && Bus.RnW) // Read data
        begin
          RXF <= 0;
          if ( RX_INT_MASK )
            $display( $time,  ":   Interrupt Cleared (Serial Data Input)" );
        end

  integer cycle_number, data_index;

  always @(posedge Clock, negedge nReset)
    if (!nReset)
      begin
        RXF <= 0;
        TXE <= 1;
        cycle_number <= 0;
        data_index <= 0;
      end
    else
      begin
        if ( received_data_cycle[data_index] == cycle_number)
          begin
            read_data <= received_data_value[data_index];
            $display( $time,  ":   Serial Data Input:", received_data_value[data_index] );
            RXF <= 1;
            if ( RX_INT_MASK )
              $display( $time,  ":   Interrupt Event (Serial Data Input)" );
            data_index <= data_index + 1;
          end
        if ( TXE == 0 )
          begin
            $display( $time,  ":   Serial Data Output", write_data );
            TXE <= 1;
            if ( TX_INT_MASK )
              $display( $time,  ":   Interrupt Event (Serial Data Output)" );
          end
        cycle_number <= cycle_number + 1;
      end

endmodule

