///////////////////////////////////////////////////////////////////////
//
// timer module
//              4 words   (8800-8803)
//
// Visible Registers:
//
//  Read
//    8800  status
//    8801  milliseconds
//    8802  down_counter
//    8803  constant identifier (=16'hA5A5)
//
//  Write
//    8800  control
//    8801  count_from
//
// Bits within status/control register
//
//  Bits within status register only
//    Bit 15  IRQ
//    Bit 7   MSIRQ  (milliseconds interrupt request)
//    Bit 6   DCIRQ  (down counter interrupt request)
//
//  Bits within status register and control register
//    Bit 5   MSIE  (milliseconds interrupt enable)
//    Bit 4   DCIE  (down counter interrupt enable)
//    Bit 3   PERIODIC
//    Bit 2   RESTART
//    Bit 1   RUN
//
//  Bits within control register only
//    Bit 0   START
//
//
// Operation of the Milliseconds Counter
//
//  The milliseconds counter counts up every millisecond
//
//  The MSIRQ bit within the status register goes high each time the
//  milliseconds counter increments. If the MSIE bit is high then an
//  interrupt will also be generated (the IRQ bit in the status
//  register will also go high and the nIRQ output of the module
//  will go active).
//
//  Reading from the status register will automatically clear
//  the MSIRQ and IRQ bits leaving the nIRQ output inactive.
//
// Operation of the Down Counter
//
//  The down counter counts down every millisecond provided that the
//  RUN bit of the control/status register is high.
//
//  The DCIRQ bit within the status register goes high each time the
//  down counter reaches zero. If the DCIE bit is high then an
//  interrupt will also be generated (the IRQ bit in the status
//  register will also go high and the nIRQ output of the module
//  will go active).
//
//  Reading from the status register will automatically clear
//  the DCIRQ and IRQ bits leaving the nIRQ output inactive.
//
//  Having reached zero, the down counter will restart automatically
//  if the RESTART bit is high. If the PERIODIC bit is high then the
//  value in the count_from register will be loaded into the down
//  counter. If the PERIODIC bit is low then -1 will be loaded into the
//  down counter. (If the RESTART bit is low, the down counter will
//  remain at zero until it is explicity started.)
//
//  Writing a high value to the START bit in the control register will
//  cause the down counter to be loaded from the down_counter register. 
//
//
///////////////////////////////////////////////////////////////////////

`ifdef timer_access_time
  // already defined - do nothing
`else
  `define timer_access_time 500ns
`endif


module io_timer(
  demux_bus.Slave Bus,
  input nCE,
  input Clock, nReset
  );

timeunit 1ns;
timeprecision 100ps;

localparam ID=16'hA5A5;
localparam START=0;
localparam RUN=1;
localparam RESTART=2;
localparam PERIODIC=3;
localparam DCIE=4;
localparam MSIE=5;

wire [1:0] Address=Bus.Address[1:0];  


  logic [15:0] count;
  logic [15:0] milliseconds;
  logic [15:0] count_from;
  logic [15:0] down_counter;
  logic [15:0] read_data;
  logic [15:0] write_data;
  logic [1:0] write_address;
  logic [5:0] control;
  logic ms_irq, dc_irq;
  logic reset_ms_irq, reset_dc_irq;
  logic irq;
  logic [15:0] status;
  logic w1, w2;

  wire ms_event, dc_event;
  wire sync_write_event;
  
  logic delay;

  initial
    delay = 0;

  always @(negedge nCE or Address)
    if (! nCE)
      begin
        delay = 1;
        #`timer_access_time
        delay = 0;
      end 

  // The #20 delay here ensures that the data is available before nWait goes high
  assign #20 Bus.nWait = (delay && !nCE && (!Bus.nOE || !Bus.RnW)) ? 0 : 1'bz;

  assign #20 Bus.nIRQ = (irq) ? 0 : 1'bz;

  assign irq = (ms_irq && control[MSIE]) || (dc_irq && control[DCIE]);
    
  assign status = { irq, 7'b0000000, ms_irq, dc_irq, control };

  wire max_count, read_enable, write_enable;
  
  //assign max_count = (count >= 42);
  assign max_count = (count >= 23999);

  // synchronize data for read via read_data register
  //
  assign read_enable = Bus.RnW && !Bus.nOE && !nCE;

  always_ff @(posedge read_enable, negedge nReset)
    if (!nReset)
      read_data <= 0;
    else
      case( Address )
      
        0: read_data <= status;
        1: read_data <= milliseconds;
        2: read_data <= down_counter;
        default: read_data <= ID;
        
      endcase

  assign Bus.Data = ( read_enable ) ? read_data : 16'bz;
  

  // synchronize data for write via write_data and write_address registers
  //
  assign write_enable = !Bus.RnW && !nCE;

  always_ff @(negedge write_enable, negedge nReset)
    if (!nReset)
      begin
        write_data <= 0;
        write_address <= 0;
      end
    else
      begin
        write_data <= Bus.Data;
        write_address <= Address;
      end

  always_ff @(posedge Clock, negedge nReset)
    if (!nReset)
      begin
        w1 <=0;
        w2 <=0;
      end
    else
      begin
        w1 <= write_enable;
        w2 <= w1;
      end

  assign sync_write_event = w2 && !w1;
  

  always_ff @(posedge Clock, negedge nReset)
    if (!nReset)
      begin
        milliseconds <= 0;
        count <= 0;
        down_counter <= 0;
        count_from <= 0;
        control <=0;
      end
    else
      begin

        if ( max_count )
          begin
            count <= 0;
            milliseconds <= milliseconds + 1;
          end
        else
          begin
            count <= count + 1;
          end


        if (sync_write_event)
          case (write_address)
            0: control <= write_data;
            1: count_from <= write_data;
          endcase
        else
          control[START] <= 0; // guarantees single cycle only on this signal

        if ( control[START] )
          begin
            down_counter <= count_from;
          end
        else if ( max_count && control[RUN] )
          begin
            if ( down_counter == 0 )
              begin
                if ( control[RESTART] )
                  if ( control[PERIODIC] )
                    down_counter <= count_from;
                  else
                    down_counter <= -1;
              end
            else
              begin
                down_counter <= down_counter - 1;
              end
          end

      end

  assign ms_event = max_count;
  assign dc_event = max_count && ( down_counter == 1 ) && control[RUN];

  // read from status register clears both interrupts
  assign reset_ms_irq = (read_enable  && (Address == 0))  || !nReset;
  assign reset_dc_irq = (read_enable  && (Address == 0))  || !nReset;
  
  always_ff @(posedge Clock, posedge reset_ms_irq)
    if ( reset_ms_irq )
      ms_irq <=0;
    else
      begin
        if (ms_event) ms_irq <=1;
      end

  always_ff @(posedge Clock, posedge reset_dc_irq)
    if ( reset_dc_irq )
      dc_irq <=0;
    else
      begin
        if (dc_event) dc_irq <=1;
      end


endmodule

