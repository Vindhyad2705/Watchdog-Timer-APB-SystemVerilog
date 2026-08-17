class wdt_generator;

    mailbox ref_mbx;


    function new(mailbox m);

        ref_mbx = m;

    endfunction


    task run();

        // Expected interrupt
        #150;
        ref_mbx.put("EXPECT_INT");


        // Expected reset
        #100;
        ref_mbx.put("EXPECT_RESET");

    endtask

endclass