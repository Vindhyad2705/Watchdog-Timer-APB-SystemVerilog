class wdt_coverage;

    virtual apb_if apb_vif;
    virtual wdt_if wdt_vif;


    covergroup wdt_cg @(posedge wdt_vif.WDOGCLK);

        INT_COV : coverpoint wdt_vif.WDOGINT {

            bins no_interrupt = {0};
            bins interrupt    = {1};

        }


        RESET_COV : coverpoint wdt_vif.WDOGRES {

            bins no_reset = {0};
            bins reset    = {1};

        }


        ENABLE_COV : coverpoint wdt_vif.WDOGCLKEN {

            bins disabled = {0};
            bins enabled  = {1};

        }

    endgroup


    covergroup apb_cg @(posedge apb_vif.PCLK);

        APB_ADDR : coverpoint apb_vif.PADDR {

            bins LOAD  = {8'h00};
            bins CTRL  = {8'h04};
            bins COUNT = {8'h08};
            bins CLEAR = {8'h0C};

        }

    endgroup


    function new(
        virtual apb_if a,
        virtual wdt_if w
    );

        apb_vif = a;
        wdt_vif = w;

        wdt_cg = new();
        apb_cg = new();

    endfunction


    task run();

        forever begin

            #1000;

        end

    endtask


    function void report();

        $display("");
        $display("======================================");
        $display("       WATCHDOG FUNCTIONAL COVERAGE");
        $display("======================================");

        $display(
            "WDT Coverage = %0.2f%%",
            wdt_cg.get_coverage()
        );

        $display(
            "APB Coverage = %0.2f%%",
            apb_cg.get_coverage()
        );

        $display("======================================");

    endfunction

endclass