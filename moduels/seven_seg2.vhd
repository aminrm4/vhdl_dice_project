library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity two_seven_seg is
    port(
        d: in unsigned(3 downto 0);            
        first_part: out std_logic_vector(6 downto 0); 
        second_part: out std_logic_vector(6 downto 0)  
    );
end two_seven_seg;

architecture behavioral of two_seven_seg is
begin
    first_part <= 
        "0000110" when d >= "1010" else
        "0111111";
    second_part <=
        "0111111" when d = "0000" else
        "0000110" when d = "0001" else
        "1011011" when d = "0010" else
        "1001111" when d = "0011" else
        "1100110" when d = "0100" else
        "1101101" when d = "0101" else
        "1111101" when d = "0110" else
        "0000111" when d = "0111" else
        "1111111" when d = "1000" else
        "1101111" when d = "1001" else
        "0111111" when d = "1010" else
        "0000110" when d = "1011" else
        "1011011" when d = "1100" else
        "0000000";    

end behavioral;