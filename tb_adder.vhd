library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_adder is
end tb_adder;

architecture sim of tb_adder is
    signal a, b: unsigned(2 downto 0);
    signal s: unsigned(3 downto 0);
begin
    uut: entity work.adder
        port map (
            a => a,
            b => b,
            s => s
        );

    a <= "011", "110" after 10 ns,"111" after 20 ns,"101" after 30 ns;
    b <= "100", "110" after 10 ns,"111" after 20 ns , "001" after 30 ns;

end sim;
