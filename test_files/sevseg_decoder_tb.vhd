library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sevseg_decoder_tb is
end entity sevseg_decoder_tb;

architecture tb_arch of sevseg_decoder_tb is
    -- Constants
    constant CLK_PERIOD : time := 10 ns;
    
    -- Signals
    signal input_data : std_logic_vector(4 downto 0);
    signal sevseg_bus : std_logic_vector(6 downto 0);
    
    -- Clock signal
    signal clk : std_logic := '0';
    
begin

    -- Instantiate the DUT
    uut : entity work.sevseg_decoder
        port map (
            input_data => input_data,
            sevseg_bus => sevseg_bus
        );
    
    -- Clock process
    clk_process : process
    begin
        while now < 1000 ns loop
            clk <= '0';
            wait for CLK_PERIOD / 2;
            clk <= '1';
            wait for CLK_PERIOD / 2;
        end loop;
        wait;
    end process clk_process;
    
    -- Stimulus process
    stimulus_process : process
    begin
        input_data <= "00000"; -- 0
        wait for 10 ns;
        
        input_data <= "00001"; -- 1
        wait for 10 ns;
        
        input_data <= "00010"; -- 2
        wait for 10 ns;
        
        input_data <= "00011"; -- 3
        wait for 10 ns;
        
        input_data <= "00100"; -- 4
        wait for 10 ns;
        
        input_data <= "00101"; -- 5
        wait for 10 ns;
        
        input_data <= "00110"; -- 6
        wait for 10 ns;
        
        input_data <= "00111"; -- 7
        wait for 10 ns;
        
        input_data <= "01000"; -- 8
        wait for 10 ns;
        
        input_data <= "01001"; -- 9
        wait for 10 ns;
        
        input_data <= "01010"; -- A
        wait for 10 ns;
        
        input_data <= "01011"; -- B
        wait for 10 ns;
        
        input_data <= "01100"; -- C
        wait for 10 ns;
        
        input_data <= "01101"; -- D
        wait for 10 ns;
        
        input_data <= "01110"; -- E
        wait for 10 ns;
        
        input_data <= "01111"; -- F
        wait for 10 ns;
        
        input_data <= "10000"; --W Part 1
        wait for 10 ns;
        
        input_data <= "10001"; --W Part 2
        wait for 10 ns;
        
        input_data <= "10010"; --N
        wait for 10 ns;
        
        input_data <= "10011"; -- P
        wait for 10 ns;
        
        input_data <= "10100"; -- R
        wait for 10 ns;
        
        input_data <= "10101"; -- S
        wait for 10 ns;
        
        input_data <= "10110"; -- T
        wait for 10 ns;
        
        input_data <= "10111"; -- H
        wait for 10 ns;
        
        input_data <= "11000"; -- K
        wait for 10 ns;
        
        input_data <= "11001"; -- P
        wait for 10 ns;
        
        input_data <= "11010"; --  Blank
        wait for 10 ns;
        
        input_data <= "11011"; -- I
        wait for 10 ns;
        
        input_data <= "11100"; -- L
        wait for 10 ns;
        
        input_data <= "11101"; -- O
        wait for 10 ns;
        
        input_data <= "11110"; 
        wait for 10 ns;
        
        input_data <= "11111"; 
        wait for 10 ns;
        
        input_data <= "10111"; 
        wait for 10 ns;
                
        wait;
    end process stimulus_process;

end architecture tb_arch;
