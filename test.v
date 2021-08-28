module tb();
  reg [15:0]b,q;
  reg clk;
  wire [15:0]a,Q;
  wire s,e;
  wire [32:0] out;
  assign out={s,a,Q};
  mult i1(e,a,q,s,b,clk,Q);
  always #1 clk=~clk;
  initial begin
    clk=0;
    $dumpfile("tb.vcd");
    $dumpvars;
    $monitor("A=%b Q=%b Output=%b",a,Q,out);

    b=16'b1111111111111111;
    q=16'b1111000011110000;
    #50 $finish;
  end
endmodule
