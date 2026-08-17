class scoreboard;

    mailbox exp_mbx;
    mailbox act_mbx;


    function new(mailbox e, mailbox a);

        exp_mbx = e;
        act_mbx = a;

    endfunction


    task run();

        string expected;
        string actual;


        forever begin

            exp_mbx.get(expected);
            act_mbx.get(actual);


            if ((expected == "EXPECT_INT") &&
                (actual   == "INT")) begin

                $display("PASS: INTERRUPT DETECTED");

            end


            else if ((expected == "EXPECT_RESET") &&
                     (actual   == "RESET")) begin

                $display("PASS: RESET DETECTED");

            end


            else begin

                $display("FAIL");
                $display("Expected = %s", expected);
                $display("Actual   = %s", actual);

            end

        end

    endtask

endclass