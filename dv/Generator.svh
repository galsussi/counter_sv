class generator;

rand transaction trans;

mailbox gen2drv;

event ended;

int repeat_count;


function new(mailbox gen2drv);
this.gen2drv= gen2drv;    
endfunction


task main();

repeat (repeat_count) begin
trans= new();
if(!trans.randomize()) $fatal("Gen:: trans randomization failed");
trans.display("[----Generator----]");
gen2drv.put(trans);
end

-> ended;

endtask
    
endclass