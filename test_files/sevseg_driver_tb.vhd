library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity sevseg_driver_tb is
end sevseg_driver_tb;

architecture tb_arch of sevseg_driver_tb is
    component sevseg_driver is
        port (
            userProg : in std_logic_vector(4 downto 0);
            clk : in std_logic;
            start : in std_logic;
            SEV_SEG_DATA : out std_logic_vector(4 downto 0);
            SEV_SEG_DRIVER : out std_logic_vector(7 downto 0)
        );
    end component;

    signal userProg_tb : std_logic_vector(4 downto 0) := (others => '0');
    signal clk_tb : std_logic := '0';
    signal start_tb : std_logic := '0';
    signal SEV_SEG_DATA_tb : std_logic_vector(4 downto 0);
    signal SEV_SEG_DRIVER_tb : std_logic_vector(7 downto 0);
begin
    -- Instantiate the DUT
    uut: sevseg_driver
        port map (
            userProg => userProg_tb,
            clk => clk_tb,
            start => start_tb,
            SEV_SEG_DATA => SEV_SEG_DATA_tb,
            SEV_SEG_DRIVER => SEV_SEG_DRIVER_tb
        );

    -- Clock process
    process
    begin
        while now < 1000 ns loop
            clk_tb <= '0';
            wait for 5 ns;
            clk_tb <= '1';
            wait for 5 ns;
        end loop;
        wait;
    end process;

    -- Stimulus process
    process
    begin
        -- Test program "COTTON"
        userProg_tb <= "10000";
        start_tb <= '1';
        wait for 100 ns;
        start_tb <= '0';
        wait for 800 ns;

        -- Test program "RAPID"
        userProg_tb <= "01000";
        start_tb <= '1';
        wait for 100 ns;
        start_tb <= '0';
        wait for 800 ns;

        -- Test program "SLOW"
        userProg_tb <= "00100";
        start_tb <= '1';
        wait for 100 ns;
        start_tb <= '0';
        wait for 800 ns;

        -- Test program "DRAIN"
        userProg_tb <= "00010";
        start_tb <= '1';
        wait for 100 ns;
        start_tb <= '0';
        wait for 800 ns;

        -- Test program "WHITE"
        userProg_tb <= "00001";
        start_tb <= '1';
        wait for 100 ns;
        start_tb <= '0';
        wait for 800 ns;

        -- Test invalid program
        userProg_tb <= "11111";
        start_tb <= '1';
        wait for 100 ns;
        start_tb <= '0';
        wait for 800 ns;

        -- End simulation
        wait;
    end process;

end tb_arch;