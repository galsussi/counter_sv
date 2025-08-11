class driver;

virtual inf vinf
mailbox gen2drv;
int num_transaction


function new(virtual inf vinf, mailbox gen2drv);
//get the interface from the top
this.vinf <=vinf
//get the mailbox from the env
this.gen2drv<=gen2drv;
    
endfunction

task reset;
wait(!vinf.rstN)
$display("[ ----Driver---- ] ---- Reset started ----");
vinf.enable <=0;
vinf.load<=0;
vinf.Data_in<=inf_i.DATA_WIDTH'h00;
wait(vinf.rstN);
$display("[ ----Driver---- ] ---- Reset ended ----");
    
endtask

task main();

forever begin
     transaction trans
     gen2drv.get(trans);
     @(posedge vinf.clk);
     vinf.enable <=trans.enable;
     vinf.load<= trans.load;
     vinf.Data_in<=trans.Data_in
     @(posedge vinf.clk);
     trans.sum<=vinf.sum;
    $display("----[DRIVER]----");
    num_transaction++;
end

endtask

    
endclass