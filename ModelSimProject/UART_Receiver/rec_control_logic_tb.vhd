-- rec_control_logic_tb.vhd

library IEEE;
use IEEE.std_logic_1164.all;
use work.all;

entity rec_control_logic_tb is
end entity rec_control_logic_tb;

architecture test of rec_control_logic_tb is
  
  component rec_control_logic
	port(d :in boolean;
			 clk :in std_logic;
			 en :in boolean;
			 h :in boolean;
			 f :in boolean;
			 s :out bit;
			 l :out bit;
			 r :out bit);
  end component;
  
  signal d, en, h, f : boolean;
  signal s, l, r : bit;
  signal clk : std_logic;
  
begin
  
  U1: rec_control_logic 
    port map(d => d,
             clk => clk,
             en => en,
             h => h,
             f => f,
             s => s,
             l => l,
             r => r);
             

  process
  begin
    
    -- Cycle the clock
    -- Send the letter 'a' 01100001
    clk <= '0';               wait for 5 ns; 
    d   <= FALSE; en <= TRUE; wait for 5 ns;
    clk <= '1';               wait for 5 ns; -- 1 count
    clk <= '0';               wait for 5 ns; 
    d   <= TRUE;              wait for 5 ns;
    clk <= '1';               wait for 5 ns; -- 2 count
    clk <= '0';               wait for 5 ns; 
    d   <= TRUE;              wait for 5 ns;
    clk <= '1';               wait for 5 ns; -- 3 count
    clk <= '0';               wait for 5 ns; 
    d   <= FALSE; h <= TRUE;  wait for 5 ns;
    clk <= '1';               wait for 5 ns; -- 4 count
    clk <= '0';               wait for 5 ns; 
    d   <= FALSE; h <= false; wait for 5 ns;
    clk <= '1';               wait for 5 ns; -- 5 count
    clk <= '0';               wait for 5 ns; 
    d   <= FALSE;             wait for 5 ns;
    clk <= '1';               wait for 5 ns; -- 6 count
    clk <= '0';               wait for 5 ns; 
    d   <= FALSE;             wait for 5 ns;
    clk <= '1';               wait for 5 ns; -- 7 count
    clk <= '0';               wait for 5 ns; 
    d   <= TRUE; f <= TRUE;   wait for 5 ns;
    clk <= '1';               wait for 5 ns; -- 8 count

    
    wait;
    
  end process;
end architecture test;