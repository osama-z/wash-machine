library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity wash_machine is
    Port (
        clk      : in std_logic;
        start    : in std_logic;
        reset    : in std_logic;
        userProg : in std_logic_vector(4 downto 0);
        state    : out std_logic_vector(1 downto 0)
    );
end wash_machine;

architecture Behavioral of wash_machine is
    -- Signal declarations
    signal washCounter  : integer range 0 to 15 := 0; -- Maximum of 15 cycles
    signal spinCounter  : integer range 0 to 15 := 0; -- Maximum of 15 cycles
    signal rinseCounter : integer range 0 to 15 := 0; -- Maximum of 15 cycles
    signal internalState: std_logic_vector(1 downto 0) := "00";
    signal zero         : std_logic := '0';

    -- State definitions
    constant WASH_STATE : std_logic_vector(1 downto 0) := "00";
    constant SPIN_STATE : std_logic_vector(1 downto 0) := "01";
    constant RINSE_STATE: std_logic_vector(1 downto 0) := "10";
    constant IDLE_STATE : std_logic_vector(1 downto 0) := "11";

begin
    -- Main process
    process (clk, reset)
    begin
        if reset = '1' then
            -- Reset the counters and state
            washCounter  <= 0;
            spinCounter  <= 0;	
            rinseCounter <= 0;
            internalState <= WASH_STATE;
            zero         <= '0';
        elsif rising_edge(clk) then
            if start = '1' then
                -- Determine the number of cycles based on userProg
                case userProg is
                    when "10000" =>   -- COTTON 
                        washCounter  <= 4;
                        spinCounter  <= 5;
                        rinseCounter <= 2;
                    when "01000" =>   -- RAPID
                        washCounter  <= 2;
                        spinCounter  <= 2;
                        rinseCounter <= 1;
                    when "00100" =>   -- SLOW
                        washCounter  <= 7;
                        spinCounter  <= 5;
                        rinseCounter <= 3;
                    when "00010" =>   -- DRAIN
                        washCounter  <= 0;
                        spinCounter  <= 3;
                        rinseCounter <= 2;
                    when "00001" =>   -- WHITE
                        washCounter  <= 3;
                        spinCounter  <= 4;
                        rinseCounter <= 2;
                    when others =>  
                        washCounter  <= 0;
                        spinCounter  <= 0;
                        rinseCounter <= 0;
                end case;

                -- Update the state based on the counters
                case internalState is
                    when WASH_STATE =>
                        if washCounter > 0 then
                            washCounter  <= washCounter - 1;
                        else
                            internalState <= SPIN_STATE;
                            zero         <= '1';
                        end if;
                    when SPIN_STATE =>
                        if spinCounter > 0 then
                            spinCounter  <= spinCounter - 1;
                        else
                            internalState <= RINSE_STATE;
                            zero         <= '1';
                        end if;
                    when RINSE_STATE =>
                        if rinseCounter > 0 then
                            rinseCounter <= rinseCounter - 1;
                        else
                            internalState <= IDLE_STATE;
                            zero         <= '1';
                        end if;
                    when IDLE_STATE =>
                        internalState <= WASH_STATE;
                        zero         <= '0';
                    when others =>
                        internalState <= WASH_STATE;
                        zero         <= '0';
                end case;
            end if;
				state <= internalState; 
        end if;
    end process;


end Behavioral;
