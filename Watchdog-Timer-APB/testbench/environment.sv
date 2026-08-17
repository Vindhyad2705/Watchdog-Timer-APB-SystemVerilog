class environment;

    mailbox gen2drv  = new();
    mailbox mon2scb  = new();
    mailbox wdt2scb  = new();

    mailbox ref_in   = new();
    mailbox ref_out  = new();


    apb_generator gen;
    apb_driver    drv;
    apb_monitor   mon;

    wdt_generator wgen;
    wdt_driver    wdrv;
    wdt_monitor   wmon;

    ref_model     refm;
    scoreboard    scb;

    wdt_coverage  cov;


    virtual apb_if apb_vif;
    virtual wdt_if wdt_vif;


    function new(
        virtual apb_if a,
        virtual wdt_if w
    );

        apb_vif = a;
        wdt_vif = w;


        // APB
        gen = new(gen2drv);

        drv = new(gen2drv);
        drv.vif = a;

        mon = new(mon2scb);
        mon.vif = a;


        // Watchdog
        wgen = new(ref_in);

        wdrv = new();
        wdrv.vif = w;

        wmon = new(wdt2scb);
        wmon.vif = w;


        // Reference model
        refm = new(ref_in, ref_out);


        // Scoreboard
        scb = new(ref_out, wdt2scb);


        // Coverage
        cov = new(a, w);

    endfunction


    task run();

        fork

            gen.run();

            drv.run();

            mon.run();

            wgen.run();

            wdrv.run();

            wmon.run();

            refm.run();

            scb.run();

            cov.run();

        join_none

    endtask

endclass