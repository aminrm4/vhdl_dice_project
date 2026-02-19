library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity seven_seg is
    port(
        d   : in  unsigned(2 downto 0);
        seg : out std_logic_vector(6 downto 0)
    );
end seven_seg;

architecture behavioral of seven_seg is
begin
    seg <=
        "0111111" when d = "000" else
        "0000110" when d = "001" else
        "1011011" when d = "010" else
        "1001111" when d = "011" else
        "1100110" when d = "100" else
        "1101101" when d = "101" else
        "1111101" when d = "110" else
        "0000000";
end behavioral;
