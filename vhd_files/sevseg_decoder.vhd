library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sevseg_decoder is
    port (
        input_data : in std_logic_vector(4 downto 0);
        sevseg_bus : out std_logic_vector(6 downto 0)
    );
end entity sevseg_decoder;

architecture behavioral of sevseg_decoder is
begin
    process (input_data)
    begin
        case input_data is
		  
            when "00000" => sevseg_bus <= "0000001"; -- 0
            when "00001" => sevseg_bus <= "1001111"; -- 1
            when "00010" => sevseg_bus <= "0010010"; -- 2
            when "00011" => sevseg_bus <= "0000110"; -- 3
            when "00100" => sevseg_bus <= "1001100"; -- 4
            when "00101" => sevseg_bus <= "0100100"; -- 5
            when "00110" => sevseg_bus <= "0100000"; -- 6
            when "00111" => sevseg_bus <= "0001111"; -- 7
            when "01000" => sevseg_bus <= "0000000"; -- 8
            when "01001" => sevseg_bus <= "0000100"; -- 9
				
            when "01010" => sevseg_bus <= "0001000"; -- A
            when "01011" => sevseg_bus <= "1100000"; -- B
            when "01100" => sevseg_bus <= "0110001"; -- C
            when "01101" => sevseg_bus <= "1000010"; -- D
            when "01110" => sevseg_bus <= "0110000"; -- E
            when "01111" => sevseg_bus <= "0111000"; -- F
            when "10000" => sevseg_bus <= "1100001"; -- W Part 1
            when "10001" => sevseg_bus <= "1000011"; -- W Part 2
            when "10010" => sevseg_bus <= "0001001"; -- N
            when "10011" => sevseg_bus <= "0011000"; -- P
            when "10100" => sevseg_bus <= "0111001"; -- R
            when "10101" => sevseg_bus <= "0100100"; -- S
            when "10110" => sevseg_bus <= "1110000"; -- T
            when "10111" => sevseg_bus <= "1001000"; -- H
            when "11000" => sevseg_bus <= "0000000"; -- K
            when "11001" => sevseg_bus <= "0011000"; -- P
            when "11011" => sevseg_bus <= "1111001"; -- I
            when "11100" => sevseg_bus <= "1110001"; -- L
            when "11101" => sevseg_bus <= "0000001"; -- O
		when "11010" => sevseg_bus <= "1111111"; -- Blank
            when "11110" => sevseg_bus <= "0110000"; --
            when "11111" => sevseg_bus <= "1110001"; --
            when others => sevseg_bus <= "1111111"; -- Invalid input
				
        end case;
    end process;
end architecture behavioral;
