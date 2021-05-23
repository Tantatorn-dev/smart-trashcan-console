library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;
  
entity controller is
	port ( button_in: in std_logic;
				mode_display: out std_logic_vector (3 downto 0)
    );
end controller;
  
architecture Behavioral of clock_divider is
  
	signal count: std_logic_vector(1 downto 0):= "00";
    signal update_clk: std_logic := '0';
  
begin
  
process(button_in)
begin
	if(button_in'event and button_in='1') then
		count <= count+'1';
        update_clk <= NOT update_clk;
	end if;
end process;

process(update_clk)
begin
	if(update_clk'event and update_clk='1') then
		if (count = "00") then
            mode_display <= "1000"
        elsif (count = "01") then
            mode_display <= "0100"
        elsif (count = "10") then
            mode_display <= "0010"
        elsif (count = "11") then
            mode_display <= "0001"
		end if;
	end if;
end process;

end Behavioral;
