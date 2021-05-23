library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity top is
    Port ( ToggleOpen : in  STD_LOGIC;
			  ChangeModeButton : in STD_LOGIC;
			  ModeDisplay : out STD_LOGIC_VECTOR (3 downto 0);
			  IsOpen : out STD_LOGIC := 0;
			  );
end top;

architecture Behavioral of top is

component controller is
	port ( button_in: in std_logic;
				mode_display: out std_logic_vector (3 downto 0)
    );
end component;

signal disp : std_logic_vector(3 downto 0);

begin

main_controller : controller 
port map (
	button_in => ChangeModeButton,
	mode_display => disp
);  

process(ToggleOpen)
begin
	if(ToggleOpen'event and ToggleOpen='1') then
		if (disp(3) = '1') then
			IsOpen <= NOT IsOpen;
        end if;
	end if;
end process; 

ModeDisplay <= disp;

end Behavioral;
