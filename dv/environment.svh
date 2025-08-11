`include "Driver.svh"
`include "Generator.svh"
`include "transction.svh"
class environment;
generator gen;
driver drv;

mailbox gen2drv;

virtual inf vinf;

function new (virtual inf vinf);
this.vinf = vinf;
gen2drv=new();

gen =new(gen2drv);
drv=new(vinf, gen2drv);
    
endfunction
    ///pre test
    task pre_test();
    drv.reset();
    endtask

    task test();
    fork 
        gen.main();
        drv.main();
    join_any
    endtask

    task post_test();
    wait(gen.ended.triggered);
    wait(gen.repeat_count==drv.num_transaction);  
    endtask

    task run();
    pre_test();
    test();
    post_test();
    $finish;
        
    endtask

endclass