`include "counter_inf.svh"

module counter(counter_inf.DUT inf_i
);

always @(posedge inf_i.clk, negedge inf_i.rstN) begin
    if(!inf_i.rstN) begin
    inf_i.enable<=1'b0;
    inf_i.load<=1'b0;
    inf_i.Data_in<=inf_i.DATA_WIDTH'h00;
    inf_i.count <=inf.DATA_WIDTH'h00;
    end
else if(inf_i.load&&inf_i.enable)
inf_i.count<=inf_i.Data_in;
else if(inf_i.enable)
inf_i.count<=inf_i.count+1;
else
inf_i.count<= inf_i.cont;
    
end
    
endmodule