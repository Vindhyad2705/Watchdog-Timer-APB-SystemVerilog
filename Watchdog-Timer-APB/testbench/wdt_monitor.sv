class wdt_monitor;

    virtual wdt_if vif;

    mailbox wdt2scb;


    function new(mailbox m);

        wdt2scb = m;

    endfunction


    task run();

        bit previous_int;
        bit previous_reset;


        previous_int   = 0;
        previous_reset = 0;


        forever begin

            @(posedge vif.WDOGCLK);


            // Detect rising edge of interrupt
            if (vif.WDOGINT && !previous_int)
                wdt2scb.put("INT");


            // Detect rising edge of reset
            if (vif.WDOGRES && !previous_reset)
                wdt2scb.put("RESET");


            previous_int   = vif.WDOGINT;
            previous_reset = vif.WDOGRES;

        end

    endtask

endclass