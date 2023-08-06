library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity main_tb is
end main_tb;

architecture Behavioral of main_tb is
    -- Component declaration for the main entity
    component main
        Port (
            clock       : in std_logic;
            start       : in std_logic;
            reset       : in std_logic;
            userProg    : in std_logic_vector(4 downto 0);
            SevSegData  : out std_logic_vector(6 downto 0);
            SevSegDriver: out std_logic_vector(7 downto 0);
            state       : out std_logic_vector(1 downto 0)
        );
    end component;

    -- Signal declarations
    signal clock_tb       : std_logic := '0';
    signal start_tb       : std_logic := '0';
    signal reset_tb       : std_logic := '0';
    signal userProg_tb    : std_logic_vector(4 downto 0) := "00000";
    signal SevSegData_tb  : std_logic_vector(6 downto 0);
    signal SevSegDriver_tb: std_logic_vector(7 downto 0);
    signal state_tb       : std_logic_vector(1 downto 0);

begin
    -- Instantiate the main entity
    uut: main
        port map (
            clock        => clock_tb,
            start        => start_tb,
            reset        => reset_tb,
            userProg     => userProg_tb,
            SevSegData   => SevSegData_tb,
            SevSegDriver => SevSegDriver_tb,
            state        => state_tb
        );

    -- Clock process
    process
    begin
        clock_tb <= '0';
        wait for 5 ns;
        while now < 1000 ns loop  -- Simulate for 1000 ns
            clock_tb <= not clock_tb;
            wait for 5 ns;
        end loop;
        wait;
    end process;

    -- Stimulus process
    process
    begin
        reset_tb <= '1';
        wait for 10 ns;
        reset_tb <= '0';
        wait for 20 ns;
        
        -- Test case 1
        start_tb <= '1';
        userProg_tb <= "10000";  -- Set user program
        wait for 100 ns;
        start_tb <= '0';
        wait for 200 ns;
        assert state_tb = "00" report "State should be 00 for test case 1";
        
        -- Test case 2
        start_tb <= '1';
        userProg_tb <= "01000";  -- Set user program
        wait for 100 ns;
        start_tb <= '0';
        wait for 200 ns;
        assert state_tb = "01" report "State should be 01 for test case 2";
        
        -- Test case 3
        start_tb <= '1';
        userProg_tb <= "00100";  -- Set user program
        wait for 100 ns;
        start_tb <= '0';
        wait for 200 ns;
        assert state_tb = "10" report "State should be 10 for test case 3";
        
        -- Test case 4
        start_tb <= '1';
        userProg_tb <= "00010";  -- Set user program
        wait for 100 ns;
        start_tb <= '0';
        wait for 200 ns;
        assert state_tb = "10" report "State should be 10 for test case 4";
        
        -- Test case 5
        start_tb <= '1';
        userProg_tb <= "00001";  -- Set user program
        wait for 100 ns;
        start_tb <= '0';
        wait for 200 ns;
        assert state_tb = "11" report "State should be 11 for test case 5";
        
        wait;
    end process;

end Behavioral;
