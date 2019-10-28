--------------------------------------------------------------------------------
-- Company: 		ESIGELEC
-- Engineer:		Samira ALI, David HERNANDEZ
--
-- Create Date:   05:59:00 05/28/2019
-- Design Name:   
-- Module Name:   /home/ise/Desktop/VHDL/start_stop_relay/start_stop_relay_tb.vhd
-- Project Name:  start_stop_relay
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: start_stop_relay
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY start_stop_relay_tb IS
	generic ( make_level : std_logic := '0' );
END start_stop_relay_tb;
 
ARCHITECTURE behavior OF start_stop_relay_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT start_stop_relay
	generic ( make_level : std_logic := '0' );
    Port ( rst : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           ena : in  STD_LOGIC := '1';
           pulse_in : in  STD_LOGIC;
           start_stop : out  STD_LOGIC);
    END COMPONENT;
    

   --Inputs
   signal rst : std_logic := '0';
   signal clk : std_logic := '0';
   signal ena : std_logic := '0';
   signal pulse_in : std_logic := '0';

 	--Outputs
   signal start_stop : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: start_stop_relay PORT MAP (
          rst => rst,
          clk => clk,
          ena => ena,
          pulse_in => pulse_in,
          start_stop => start_stop
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
		rst <= '1';
		ena <= '0';
		wait for clk_period*50;
		
		rst <= '1';
		ena <= '1';
		wait for clk_period*50;
		
		rst <= '0';
		ena <= '0';
		wait for clk_period*50;
		
		rst <= '0';
		ena <= '1';
		wait for clk_period*50;
	end process stim_proc;
	
stim2: process 
	begin
	for i in 1 to 5 loop
		pulse_in <= not make_level;
		wait for clk_period*2;
		pulse_in <= make_level;
		wait for clk_period*3;
		pulse_in <= not make_level;
		wait for clk_period*3;
		pulse_in <= make_level;
		wait for clk_period*2;
	end loop;	
 
	for i in 1 to 5 loop
		pulse_in <= not make_level;
		wait for clk_period*2;
		pulse_in <= make_level;
		wait for clk_period*3;
		pulse_in <= not make_level;
		wait for clk_period*3;
		pulse_in <= make_level;
		wait for clk_period*2;	
	end loop;
	
	for i in 1 to 5 loop
		pulse_in <= not make_level;
		wait for clk_period*2;
		pulse_in <= make_level;
		wait for clk_period*3;
		pulse_in <= not make_level;
		wait for clk_period*3;
		pulse_in <= make_level;
		wait for clk_period*2;		
	end loop;
	
	for i in 1 to 5 loop
		pulse_in <= not make_level;
		wait for clk_period*2;
		pulse_in <= make_level;
		wait for clk_period*3;
		pulse_in <= not make_level;
		wait for clk_period*3;
		pulse_in <= make_level;
		wait for clk_period*2;
	end loop;
	
      -- insert stimulus here 

      wait;
	
   end process stim2;

END;
