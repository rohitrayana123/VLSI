module and2 ( output Y, input A, B );

  timeunit 1ns;
  timeprecision 10ps;

  parameter delay=1ns;

  assign #delay Y = &{A, B};

endmodule
module buffer ( output Y, input A );

  timeunit 1ns;
  timeprecision 10ps;

  parameter delay=1ns;

  assign #delay Y = A;

endmodule
module fulladder ( output S, Cout, input A, B, Cin );

  timeunit 1ns;
  timeprecision 10ps;

  parameter delay=1ns;

  assign #delay {Cout,S} = A + B + Cin;

endmodule
module halfadder ( output S, C, input A, B );

  timeunit 1ns;
  timeprecision 10ps;

  parameter delay=1ns;

  assign #delay S = ^{A, B};
  assign #delay C = &{A, B};

endmodule
module inv ( output Y, input A );

  timeunit 1ns;
  timeprecision 10ps;

  parameter delay=1ns;

  assign #delay Y = !A;

endmodule
module mux2 ( output Y, input I0, I1, S );

  timeunit 1ns;
  timeprecision 10ps;

  parameter delay=1ns;

  assign #delay Y = (!S && I0) || (S && I1);

endmodule
module nand2 ( output Y, input A, B );

  timeunit 1ns;
  timeprecision 10ps;

  parameter delay=1ns;

  assign #delay Y = ! ( &{A, B} );

endmodule
module nand3 ( output Y, input A, B, C );

  timeunit 1ns;
  timeprecision 10ps;

  parameter delay=1ns;

  assign #delay Y = ! ( &{A, B, C} );

endmodule
module nand4 ( output Y, input A, B, C, D );

  timeunit 1ns;
  timeprecision 10ps;

  parameter delay=1ns;

  assign #delay Y = ! ( &{A, B, C, D} );

endmodule
module nor2 ( output Y, input A, B );

  timeunit 1ns;
  timeprecision 10ps;

  parameter delay=1ns;

  assign #delay Y = ! ( |{A, B} );

endmodule
module nor3 ( output Y, input A, B, C );

  timeunit 1ns;
  timeprecision 10ps;

  parameter delay=1ns;

  assign #delay Y = ! ( |{A, B, C} );

endmodule
module or2 ( output Y, input A, B );

  timeunit 1ns;
  timeprecision 10ps;

  parameter delay=1ns;

  assign #delay Y = |{A, B};

endmodule
module scandtype ( output logic Q, nQ, input D, Clock, nReset );

  timeunit 1ns;
  timeprecision 10ps;

  parameter delay=20ns;

  specify
    // T_setup = 25x100ps
    // T_hold  =  2x100ps
    $setuphold(posedge Clock, D, 25, 2);
  endspecify

  always @(posedge Clock or negedge nReset)
    if (!nReset)
      Q = 0;
    else
      Q = #delay D;

  assign nQ = !Q;

endmodule
module scanreg ( output logic Q, nQ, input D, Load, Clock, nReset );

  timeunit 1ns;
  timeprecision 10ps;

  parameter delay=20ns;

  specify
    // T_setup = 25x100ps
    // T_hold  =  2x100ps
    $setuphold(posedge Clock, D, 25, 2);
  endspecify

  always @(posedge Clock or negedge nReset)
    if (!nReset)
      Q = 0;
    else
      if (Load) Q = #delay D;

  assign nQ = !Q;

endmodule
module trisbuf ( output Y, input A, Enable );

  timeunit 1ns;
  timeprecision 10ps;

  parameter delay=1ns;

  assign #delay Y = (Enable) ? A : 1'bz;

endmodule
module xor2 ( output Y, input A, B );

  timeunit 1ns;
  timeprecision 10ps;

  parameter delay=1ns;
  
  assign #delay Y = ^{A, B};

endmodule
