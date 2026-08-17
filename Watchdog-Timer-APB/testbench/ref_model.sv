class ref_model;

    mailbox ref_in;
    mailbox ref_out;


    function new(mailbox i, mailbox o);

        ref_in  = i;
        ref_out = o;

    endfunction


    task run();

        string expected;


        forever begin

            ref_in.get(expected);

            ref_out.put(expected);

        end

    endtask

endclass