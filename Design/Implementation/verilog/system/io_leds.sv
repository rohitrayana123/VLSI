///////////////////////////////////////////////////////////////////////
//
// led module
//
//
///////////////////////////////////////////////////////////////////////

`ifdef led_access_time
  // already defined - do nothing
`else
  `define led_access_time 500ns
`endif


module io_leds (
  demux_bus.Slave Bus,
  output logic [15:0] LEDs,
  input nCE
  );

timeunit 1ns;
timeprecision 100ps;

logic delay;
integer count_writes;

initial
  begin
    delay = 0;
    count_writes = 0;
  end

always @(negedge nCE)
  begin
    delay = 1;
    #`led_access_time
    delay = 0;
  end 

// The #20 delay here ensures that the data is available before nWait goes high
assign #20 Bus.nWait = (delay && !nCE && !Bus.RnW) ? 0 : 1'bz;

always @(nCE or Bus.RnW)
  begin
    while ((nCE == 0) && (Bus.RnW == 0))
      begin
        LEDs = Bus.Data;

        @(nCE or Bus.RnW or Bus.Data);

        // Detect that LED update has just completed
        // This prevents spurious messages as LED value settles
        if ((nCE !== 0) || (Bus.RnW !== 0))
          begin
            $display( $time, ":   LED update: %d", LEDs );
            count_writes = count_writes + 1;
            `ifdef max_led_writes
              if ( count_writes == `max_led_writes )
                begin
                  $display("Terminating after %d LED writes\n", `max_led_writes);
                  #2000ns
                  $stop;
                  $finish;
                end
            `endif 
          end
      end

  end

endmodule

