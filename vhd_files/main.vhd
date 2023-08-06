library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity main is

Port (
	clock : in std_logic;
	start : in std_logic;
	reset : in std_logic;
	userProg : in std_logic_vector(4 downto 0);
	SevSegData : out std_logic_vector(6 downto 0);
	SevSegDriver : out std_logic_vector(7 downto 0);	
	state : out std_logic_vector (1 downto 0)
	);

end main;

architecture Behavioral of main is

signal SevSegdata_input : std_logic_vector(4 downto 0);
signal clock_100h : std_logic;

	Component wash_machine 
		Port (
			clk : in std_logic;
			start : in std_logic;
			reset : in std_logic;
			userProg : in std_logic_vector(4 downto 0);
			state : out std_logic_vector(1 downto 0)
			);
		end Component;
	
	Component clock_divider
	PORT(
		clk,reset: in std_logic;
		clock_out: out std_logic
		);
	END Component;
	
	COMPONENT sevseg_decoder
	PORT(
		input_data : IN std_logic_vector(4 downto 0);          
		sevseg_bus : OUT std_logic_vector(6 downto 0)
		);
	END COMPONENT;
	
	COMPONENT sevseg_driver
	PORT(
		userProg : IN STD_LOGIC_VECTOR(4 downto 0);
		clk : IN std_logic; 
		start : IN STD_LOGIC;
		SEV_SEG_DATA : OUT std_logic_vector(4 downto 0);
		SEV_SEG_DRIVER : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;

begin

	clock_d : clock_divider Port Map(clock,reset, clock_100h);
	wsh : wash_machine Port Map(clock_100h, start, reset, userProg, state);
	driver : SevSeg_Driver PORT MAP( userProg, clock_100h, start, SevSegdata_input, SevSegDriver);
	decoder : SevSeg_Decoder PORT MAP(SevSegdata_input, SevSegData);
	
	
end Behavioral;