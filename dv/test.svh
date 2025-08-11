class test;
environment env;
inital begin
env =new(i_inf);

env.gen.repeat_count=6;

env.run();
end
    
endclass