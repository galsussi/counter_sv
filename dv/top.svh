`include "counter_inf.svh"
`include "test.svh"
module top();
   bit clk;
   bit rstN;

always #5 clk=~clk;
inital begin
rstN=0;
#15 rstN=1;
end

inf i_inf(clk,rstN);
counter mut(i_inf);
test t1(i_inf);
endmodule