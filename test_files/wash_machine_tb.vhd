library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity wash_machine_tb is
end wash_machine_tb;

architecture Behavioral of wash_machine_tb is
    -- Component declaration for the wash_machine entity
    component wash_machine
        Port (
            clk      : in std_logic;
            start    : in std_logic;
            reset    : in std_logic;
            userProg : in std_logic_vector(4 downto 0);
            state    : out std_logic_vector(1 downto 0)
        );
    end component;

    -- Signal declarations
    signal clk_tb      : std_logic := '0';
    signal start_tb    : std_logic := '0';
    signal reset_tb    : std_logic := '0';
    signal userProg_tb : std_logic_vector(4 downto 0) := "00000";
    signal state_tb    : std_logic_vector(1 downto 0);
    signal internalState_tb : std_logic_vector(1 downto 0);

begin
    -- Instantiate the wash_machine entity
    uut: wash_machine
        port map (
            clk      => clk_tb,
            start    => start_tb,
            reset    => reset_tb,
            userProg => userProg_tb,
            state    => state_tb
        );

    -- Monitor process for internalState
    process(clk_tb)
    begin
        if rising_edge(clk_tb) then
            internalState_tb <= state_tb; -- Capture the value of state signal
        end if;
    end process;

    -- Clock process
    process
    begin
        clk_tb <= '0';
        wait for 5 ns;
        while now < 1000 ns loop  -- Simulate for 1000 ns
            clk_tb <= not clk_tb;
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
        
        -- Test case 1: COTTON program
        start_tb <= '1';
        userProg_tb <= "10000";  -- COTTON
        wait for 100 ns;
        start_tb <= '0';
        wait for 50 ns;
        
        -- Assertion check for COTTON program
        assert internalState_tb = "00" report "ERROR: Incorrect internalState for COTTON program" severity error;
        wait for 200 ns;

        -- Test case 2: RAPID program
        start_tb <= '1';
        userProg_tb <= "01000";  -- RAPID
        wait for 100 ns;
        start_tb <= '0';
        wait for 50 ns;
        
        -- Assertion check for RAPID program
        assert internalState_tb = "01" report "ERROR: Incorrect internalState for RAPID program" severity error;
        wait for 200 ns;

        -- Test case 3: SLOW program
        start_tb <= '1';
        userProg_tb <= "00100";  -- SLOW
        wait for 100 ns;
        start_tb <= '0';
        wait for 50 ns;
        
        -- Assertion check for SLOW program
        assert internalState_tb = "10" report "ERROR: Incorrect internalState for SLOW program" severity error;
        wait for 200 ns;

        -- Test case 4: DRAIN program
        start_tb <= '1';
        userProg_tb <= "00010";  -- DRAIN
        wait for 100 ns;
        start_tb <= '0';
        wait for 50 ns;
        
        -- Assertion check for DRAIN program
        assert internalState_tb = "00" report "ERROR: Incorrect internalState for DRAIN program" severity error;
        wait for 200 ns;

        -- Test case 5: WHITE program
        start_tb <= '1';
        userProg_tb <= "00001";  -- WHITE
        wait for 100 ns;
        start_tb <= '0';
        wait for 50 ns;
        
        -- Assertion check for WHITE program
        assert internalState_tb = "01" report "ERROR: Incorrect internalState for WHITE program" severity error;
        wait for 200 ns;

        -- Test case 6: Invalid program
        start_tb <= '1';
        userProg_tb <= "11111";  -- Invalid program
        wait for 100 ns;
        start_tb <= '0';
        wait for 50 ns;
        
        -- Assertion check for Invalid program
        assert internalState_tb = "00" report "ERROR: Incorrect internalState for Invalid program" severity error;
        wait for 200 ns;

        reset_tb <= '1';
        wait for 10 ns;
        reset_tb <= '0';
        wait;
    end process;

end Behavioral;
