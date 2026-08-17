WATCHDOG TIMER WITH APB INTERFACE – SYSTEMVERILOG

PROJECT OVERVIEW

This project implements a Watchdog Timer (WDT) with an AMBA APB interface using SystemVerilog.

The Watchdog Timer is designed to monitor system activity and generate an interrupt and reset when the timer expires without receiving a refresh. An end-to-end SystemVerilog verification environment is developed to verify the functionality of the design.

KEY FEATURES

• AMBA APB interface
• Watchdog timer countdown
• Watchdog refresh mechanism
• Timeout detection
• Interrupt generation
• Reset generation
• APB read/write transactions
• Reference model
• Scoreboard-based verification
• Functional coverage
• SystemVerilog class-based testbench
• Waveform analysis using EPWave

VERIFICATION ENVIRONMENT

The testbench is organized into modular verification components:

```
                TEST
                 |
            ENVIRONMENT
                 |
      +----------+----------+
      |                     |
APB GENERATOR         WDT GENERATOR
      |                     |
 APB DRIVER            WDT DRIVER
      |                     |
      +-------- DUT --------+
                 |
      +----------+----------+
      |                     |
 APB MONITOR           WDT MONITOR
      |                     |
      +----------+----------+
                 |
          REFERENCE MODEL
                 |
             SCOREBOARD
                 |
             COVERAGE
```

VERIFICATION COMPONENTS

The project includes:

• APB Interface – Provides APB signals for communication with the DUT.
• WDT Interface – Provides watchdog-related signals.
• APB Transaction – Represents APB read/write transactions.
• WDT Transaction – Represents watchdog transactions.
• APB Generator – Generates APB stimulus.
• WDT Generator – Generates watchdog stimulus.
• APB Driver – Drives APB transactions to the DUT.
• WDT Driver – Drives watchdog-related stimulus.
• APB Monitor – Monitors APB transactions.
• WDT Monitor – Monitors watchdog activity.
• Reference Model – Predicts expected DUT behavior.
• Scoreboard – Compares expected and actual results.
• Coverage – Measures functional coverage.
• Environment – Connects and coordinates the verification components.
• Test – Controls the overall verification flow.

VERIFICATION SCENARIOS

The following functionality was verified:

1. INTERRUPT DETECTION

The testbench verifies that the Watchdog Timer generates an interrupt when the watchdog timer expires.

RESULT: PASS

2. RESET DETECTION

The testbench verifies that the Watchdog Timer generates the required reset after timeout.

RESULT: PASS

3. APB TRANSACTIONS

APB read and write transactions are generated and monitored during simulation.

APB COVERAGE: 100.00%

4. WATCHDOG FUNCTIONALITY

Watchdog timer behavior, including timeout and control operations, is verified through the SystemVerilog testbench.

WDT COVERAGE: 83.33%

SIMULATION RESULTS

The design was compiled and simulated using Synopsys VCS X-2025.06-SP1.

RESULTS

PASS: INTERRUPT DETECTED
PASS: RESET DETECTED

WATCHDOG FUNCTIONAL COVERAGE
WDT Coverage = 83.33%
APB Coverage = 100.00%

Simulation Time = 520 ns

The simulation completed successfully and generated a VCD waveform file for analysis using EPWave.

WAVEFORM

The waveform demonstrates important APB and watchdog signals including:

• PCLK
• PSEL
• PENABLE
• PWRITE
• PADDR
• PWDATA
• PRDATA
• PRESETn
• WDOGCLK
• WDOGCLKEN
• WDOGINT
• WDOGRES
• load
• counter

The waveform was analyzed using EPWave to verify the timing and behavior of the Watchdog Timer.

TOOLS AND TECHNOLOGIES

• SystemVerilog
• Synopsys VCS
• EDA Playground
• EPWave
• AMBA APB Protocol

PROJECT STRUCTURE

Watchdog-Timer-APB-SystemVerilog/
│
├── rtl/
│   └── design.sv
│
├── testbench/
│   ├── testbench.sv
│   ├── apb_if.sv
│   ├── wdt_if.sv
│   ├── apb_txn.sv
│   ├── wdt_txn.sv
│   ├── apb_generator.sv
│   ├── wdt_generator.sv
│   ├── apb_driver.sv
│   ├── wdt_driver.sv
│   ├── apb_monitor.sv
│   ├── wdt_monitor.sv
│   ├── ref_model.sv
│   ├── scoreboard.sv
│   ├── coverage.sv
│   ├── environment.sv
│   └── test.sv
│
├── simulation/
│   ├── waveform.png
│   └── simulation_result.png
│
└── README.md

HOW TO RUN

1. Open the project in EDA Playground or another SystemVerilog-compatible simulator.
2. Compile design.sv and testbench.sv.
3. Run the simulation using Synopsys VCS.
4. Observe the simulation log for PASS/FAIL results.
5. Open the generated VCD waveform in EPWave.
6. Analyze the APB transactions and watchdog behavior.

AUTHOR

Vindhya D

Electronics and Communication Engineering
Cambridge Institute of Technology, Bengaluru

PROJECT HIGHLIGHTS

• Designed a Watchdog Timer with APB interface.
• Developed an end-to-end SystemVerilog verification environment.
• Verified interrupt and reset generation.
• Achieved 100% APB functional coverage.
• Achieved 83.33% Watchdog functional coverage.
• Performed waveform-based verification using EPWave.
