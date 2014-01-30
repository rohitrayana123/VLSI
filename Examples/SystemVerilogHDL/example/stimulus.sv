// This special stimulus file merely performs a simple scan-path test

initial
  begin
     Clock = 0;
     nReset = 0;
    #250
     nReset = 1;
    #500
     while ( 1 )
        begin
           Clock = 0;
          #250
           Clock = 1;
          #500
           Clock = 0;
          #250
           Clock = 0;
        end
  end

initial
  begin
     switches = 0;
     Test = 1;
     SDI = 0;
    #5000
     SDI = 1;
    #1000
     SDI = 0;
    #2000
     SDI = 1;
    #1000
     SDI = 0;
    #5000
     $stop;
    #200000
     Test = 0;
  end

