library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.NUMERIC_STD.all;

entity sevseg_driver is
    port (
        userProg : in std_logic_vector(4 downto 0);
        clk : in std_logic;
        start : in std_logic;
        SEV_SEG_DATA : out std_logic_vector(4 downto 0);
        SEV_SEG_DRIVER : out std_logic_vector(7 downto 0)
    );
end sevseg_driver;

architecture BEHAVIORAL of sevseg_driver is
    signal A, B, C, D, E, F, G, L, W1, W2, N, P, R, S, T, H, K, O, I, Blank : std_logic_vector(4 downto 0);
    signal COUNTER : std_logic_vector(2 downto 0) := "000";
begin
    -- Character definitions
    A <= "01010";   -- A
    B <= "01011";   -- B
    C <= "01100";   -- C
    D <= "01101";   -- D
    E <= "01110";   -- E
    F <= "01111";   -- F
    L <= "11100";   -- L
    W1 <= "10000";  -- W (part 1)
    W2 <= "10001";  -- W (part 2)
    N <= "10010";   -- N
    P <= "10011";   -- P
    R <= "10100";   -- R
    S <= "10101";   -- S
    T <= "10110";   -- T
    H <= "10111";   -- H
    O <= "11101";   -- O
    I <= "11011";   -- I
    Blank <= "11010";  -- Blank

    -- Counter process
    process (clk)
    begin
        if rising_edge(clk) then
            if COUNTER = "111" then
                COUNTER <= "000";
            else
                COUNTER <= COUNTER + 1;
            end if;
        end if;
    end process;

    -- Seven-segment display process
    process (COUNTER, userProg, start)
    begin
        if start = '1' then -- Check if start signal is high
            case userProg is
                when "10000" =>
                    -- Display "COTTON"
                    case COUNTER is
                        when "000" =>
                            SEV_SEG_DATA <= C;
                            SEV_SEG_DRIVER <= "01111111";
                        when "001" =>
                            SEV_SEG_DATA <= O;
                            SEV_SEG_DRIVER <= "10111111";
                        when "010" =>
                            SEV_SEG_DATA <= T;
                            SEV_SEG_DRIVER <= "11011111";
                        when "011" =>
                            SEV_SEG_DATA <= T;
                            SEV_SEG_DRIVER <= "11101111";
                        when "100" =>
                            SEV_SEG_DATA <= O;
                            SEV_SEG_DRIVER <= "11110111";
                        when "101" =>
                            SEV_SEG_DATA <= N;
                            SEV_SEG_DRIVER <= "11111011";
                        when "110" =>
                            SEV_SEG_DATA <= Blank;
                            SEV_SEG_DRIVER <= "11111101";
                        when others =>
                            SEV_SEG_DATA <= Blank;
                            SEV_SEG_DRIVER <= "11111110";
                    end case;

                when "01000" =>
                    -- Display "RAPID"
                    case COUNTER is
                        when "000" =>
                            SEV_SEG_DATA <= R;
                            SEV_SEG_DRIVER <= "01111111";
                        when "001" =>
                            SEV_SEG_DATA <= A;
                            SEV_SEG_DRIVER <= "10111111";
                        when "010" =>
                            SEV_SEG_DATA <= P;
                            SEV_SEG_DRIVER <= "11011111";
                        when "011" =>
                            SEV_SEG_DATA <= I;
                            SEV_SEG_DRIVER <= "11101111";
                        when "100" =>
                            SEV_SEG_DATA <= D;
                            SEV_SEG_DRIVER <= "11110111";
                        when "101" =>
                            SEV_SEG_DATA <= Blank;
                            SEV_SEG_DRIVER <= "11111011";
                        when "110" =>
                            SEV_SEG_DATA <= Blank;
                            SEV_SEG_DRIVER <= "11111101";
                        when others =>
                            SEV_SEG_DATA <= Blank;
                            SEV_SEG_DRIVER <= "11111110";
                    end case;

                when "00100" =>
                    -- Display "SLOW"
                    case COUNTER is
                        when "000" =>
                            SEV_SEG_DATA <= S;
                            SEV_SEG_DRIVER <= "01111111";
                        when "001" =>
                            SEV_SEG_DATA <= L;
                            SEV_SEG_DRIVER <= "10111111";
                        when "010" =>
                            SEV_SEG_DATA <= O;
                            SEV_SEG_DRIVER <= "11011111";
                        when "011" =>
                            SEV_SEG_DATA <= W1;
                            SEV_SEG_DRIVER <= "11101111";
                        when "100" =>
                            SEV_SEG_DATA <= W2;
                            SEV_SEG_DRIVER <= "11110111";
                        when "101" =>
                            SEV_SEG_DATA <= Blank;
                            SEV_SEG_DRIVER <= "11111011";
                        when "110" =>
                            SEV_SEG_DATA <= Blank;
                            SEV_SEG_DRIVER <= "11111101";
                        when others =>
                            SEV_SEG_DATA <= Blank;
                            SEV_SEG_DRIVER <= "11111110";
                    end case;

                when "00010" =>
                    -- Display "DRAIN"
                    case COUNTER is
                        when "000" =>
                            SEV_SEG_DATA <= D;
                            SEV_SEG_DRIVER <= "01111111";
                        when "001" =>
                            SEV_SEG_DATA <= R;
                            SEV_SEG_DRIVER <= "10111111";
                        when "010" =>
                            SEV_SEG_DATA <= A;
                            SEV_SEG_DRIVER <= "11011111";
                        when "011" =>
                            SEV_SEG_DATA <= I;
                            SEV_SEG_DRIVER <= "11101111";
                        when "100" =>
                            SEV_SEG_DATA <= N;
                            SEV_SEG_DRIVER <= "11110111";
                        when "101" =>
                            SEV_SEG_DATA <= Blank;
                            SEV_SEG_DRIVER <= "11111011";
                        when "110" =>
                            SEV_SEG_DATA <= Blank;
                            SEV_SEG_DRIVER <= "11111101";
                        when others =>
                            SEV_SEG_DATA <= Blank;
                            SEV_SEG_DRIVER <= "11111110";
                    end case;

                when "00001" =>
                    -- Display "WHITE"
                    case COUNTER is
                        when "000" =>
                            SEV_SEG_DATA <= W1;
                            SEV_SEG_DRIVER <= "01111111";
                        when "001" =>
                            SEV_SEG_DATA <= W2;
                            SEV_SEG_DRIVER <= "10111111";
                        when "010" =>
                            SEV_SEG_DATA <= H;
                            SEV_SEG_DRIVER <= "11011111";
                        when "011" =>
                            SEV_SEG_DATA <= I;
                            SEV_SEG_DRIVER <= "11101111";
                        when "100" =>
                            SEV_SEG_DATA <= T;
                            SEV_SEG_DRIVER <= "11110111";
                        when "101" =>
                            SEV_SEG_DATA <= E;
                            SEV_SEG_DRIVER <= "11111011";
                        when "110" =>
                            SEV_SEG_DATA <= Blank;
                            SEV_SEG_DRIVER <= "11111101";
                        when others =>
                            SEV_SEG_DATA <= Blank;
                            SEV_SEG_DRIVER <= "11111110";
                    end case;

                when others =>
                    SEV_SEG_DATA <= Blank;
                    SEV_SEG_DRIVER <= "11111110";
            end case;
        else
            SEV_SEG_DATA <= Blank;
            SEV_SEG_DRIVER <= "11111110";
        end if;
    end process;

end BEHAVIORAL;
