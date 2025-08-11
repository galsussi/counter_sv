interface inf #(parameter DATA_WIDTH =8)(logic clk,rstN);
    
    logic enable , load;
    logic [DATA_WIDTH-1: 0] Data_in ,count;
    modport DUT (input enable,load,Data_in , clk,rstN, output count);
endinterface