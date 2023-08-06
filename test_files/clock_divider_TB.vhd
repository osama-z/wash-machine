LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY clock_divider_TB IS
END clock_divider_TB;
 
ARCHITECTURE behavior OF clock_divider_TB IS
 
  COMPONENT clock_divider
    PORT (
      clk : IN std_logic;
      reset : IN std_logic;
      clock_out : OUT std_logic
    );
  END COMPONENT;
 
  SIGNAL clk : std_logic := '0';
  SIGNAL reset : std_logic := '0';
  SIGNAL clock_out : std_logic;
  CONSTANT clk_period : TIME := 10 ms;
 
BEGIN
 
  uut: clock_divider PORT MAP ( clk => clk, reset => reset, clock_out => clock_out );
  -- Clock process definitions
  clk_process: PROCESS
  BEGIN
    clk <= '0';
    WAIT FOR clk_period/2;
    clk <= '1';
    WAIT FOR clk_period/2;
  END PROCESS;
 
  -- Stimulus process
  stim_proc: PROCESS
  BEGIN
    WAIT FOR 1 ms;  
    reset <= '1';
    WAIT FOR 1 ms;  -- Reset duration
    reset <= '0';
    WAIT;
  END PROCESS;
 
END;
