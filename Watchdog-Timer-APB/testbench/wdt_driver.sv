class wdt_driver;

    virtual wdt_if vif;


    function new();

    endfunction


    task run();

        vif.WDOGCLKEN = 1'b1;

    endtask

endclass