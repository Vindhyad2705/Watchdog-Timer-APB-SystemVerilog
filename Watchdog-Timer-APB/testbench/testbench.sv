`include "apb_if.sv"
`include "wdt_if.sv"

`include "apb_txn.sv"
`include "wdt_txn.sv"

`include "apb_generator.sv"
`include "wdt_generator.sv"

`include "apb_driver.sv"
`include "wdt_driver.sv"

`include "apb_monitor.sv"
`include "wdt_monitor.sv"

`include "ref_model.sv"
`include "scoreboard.sv"

`include "coverage.sv"

`include "environment.sv"
`include "test.sv"


module top;


    apb_if apb();
    wdt_if wdt();


    // DUT
    wdt_apb dut(

        .PCLK      (apb.PCLK),
        .PRESETn   (apb.PRESETn),

        .PSEL      (apb.PSEL),
        .PENABLE   (apb.PENABLE),
        .PWRITE    (apb.PWRITE),

        .PADDR     (apb.PADDR),
        .PWDATA    (apb.PWDATA),
        .PRDATA    (apb.PRDATA),

        .WDOGCLK   (wdt.WDOGCLK),
        .WDOGCLKEN (wdt.WDOGCLKEN),

        .WDOGINT   (wdt.WDOGINT),
        .WDOGRES   (wdt.WDOGRES)

    );


    environment env;
    test t;


    // APB clock = 10 ns
    always #5 apb.PCLK = ~apb.PCLK;


    // Watchdog clock = 20 ns
    always #10 wdt.WDOGCLK = ~wdt.WDOGCLK;


    initial begin


        // Waveform
        $dumpfile("wave.vcd");
        $dumpvars(0, top);


        // Initial values
        apb.PCLK       = 0;
        apb.PRESETn    = 0;

        apb.PSEL       = 0;
        apb.PENABLE    = 0;
        apb.PWRITE     = 0;

        apb.PADDR      = 0;
        apb.PWDATA     = 0;


        wdt.WDOGCLK    = 0;
        wdt.WDOGCLKEN  = 1;


        // Reset
        #20;

        apb.PRESETn = 1;


        // Create environment
        env = new(apb, wdt);

        t = new(env);


        // Start test
        t.run();


        // Allow simulation to run
        #500;


        // Coverage report
        env.cov.report();


        $finish;

    end

endmodule