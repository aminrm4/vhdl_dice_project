library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_comparator is
end tb_comparator;

architecture sim of tb_comparator is
    signal a, b : unsigned(3 downto 0);
    signal eq   : std_logic;
begin
    uut: entity work.comparator
        port map (
            a => a,
            b => b,
            eq => eq
        );

    a <= "0000", "0000" after 10 ns, "0010" after 20 ns, "1111" after 30 ns;
    b <= "0000", "0001" after 10 ns, "0110" after 20 ns, "0011" after 30 ns;

end sim;
