# wash-machine
simple wash machine project vhdl 
# Introduction:
  design and implement a washing machine controller using VHDL. The controller will receive user 
  inputs, such as the selected program, and control the washing machine's operation accordingly. 
  The project involves designing and implementing several entities, including the main controller 
  entity, a clock divider, a seven-segment decoder, and a seven-segment driver.

# Entities and Architectures:
  1. Main Entity:
      The "main" entity serves as the top-level entity for the washing machine controller. It 
      receives inputs such as clock, start, reset, and user program from the system. The main 
      entity instantiates other components and connects their ports accordingly.
  2. Wash Machine Entity:
      The "wash_machine" entity represents the internal state machine of the washing machine 
      controller. It takes inputs such as clock, start, reset, and user program to control the 
      washing machine's state transitions. The wash_machine entity has an output signal named 
      "state" that represents the current state of the washing machine.
  3. Clock Divider Entity:
      The "clock_divider" entity divides the system clock to generate a slower clock signal. It 
      takes inputs such as clock and reset and provides the divided clock signal as an output.
  4. Seven-Segment Decoder Entity:
        The "sevseg_decoder" entity converts a binary input signal into the corresponding seven-segment
        display output. It takes a binary input signal named "input_data" and provides 
        the corresponding seven-segment display output as the "sevseg_bus" output signal.
  6. Seven-Segment Driver Entity:
      The "sevseg_driver" entity drives the seven-segment display based on the user program 
      input and the clock signal. It takes inputs such as userProg, clk, and start, and provides 
      the seven-segment display data and driver signals as outputs.
# Test Benches
    using modelsim 
