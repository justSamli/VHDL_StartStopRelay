----------------------------------------------------------------------------------
-- Company: 		ESIGELEC
-- Engineer: 		Samira ALI, David HERNANDEZ
-- 
-- Create Date:    19:47:49 05/26/2019 
-- Design Name: 
-- Module Name:    start_stop_relay - relay 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity start_stop_relay is
	generic ( make_level : std_logic := '0' );
    Port ( rst : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           ena : in  STD_LOGIC := '1';
           pulse_in : in  STD_LOGIC;
           start_stop : out  STD_LOGIC);
end start_stop_relay;

architecture relay_behavior of start_stop_relay is
	type state_relay is (
		stStart, stMakeA, stMakeB, stBreakA, stBreakB );
	signal state: state_relay;	
begin

	relay_storage: process (clk) is
	begin
		if rising_edge(clk) and (ena = '1') then
		if (rst = '1') then
			state <= stStart;
		else
		case state is
			when stStart =>
			if (pulse_in = make_level) then
			state <= stMakeA; 
			else
			state <= stBreakA; end if;
			
			when stMakeA =>
			if ( pulse_in = not make_level) then
			state <= stBreakA; end if;
			
			when stBreakA =>
			if (pulse_in = make_level) then
			state <= stMakeB; end if;
			
			when stMakeB =>
			if (pulse_in = not make_level) then
			state <= stBreakB; end if;
			
			when stBreakB =>
			if (pulse_in = make_level) then
			state <= stMakeA; end if;
			
		end case;
		end if;
		end if;
	end process relay_storage;
	
		with  state select start_stop <=
		'1' when  stMakeB,
		'1' when  stBreakB,
		'0' when others;
	
end relay_behavior;

