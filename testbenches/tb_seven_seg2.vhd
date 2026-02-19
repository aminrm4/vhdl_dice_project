library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_seven_seg is
end tb_seven_seg;

architecture sim of tb_seven_seg is
    signal d   : unsigned(2 downto 0);
    signal seg : std_logic_vector(6 downto 0);
begin
    uut : entity work.seven_seg
        port map ( d => d, seg => seg );

    d <= "000" after  0 ns,
         "001" after 10 ns,
         "010" after 20 ns,
         "011" after 30 ns,
         "100" after 40 ns,
         "101" after 50 ns,
         "110" after 60 ns;
end sim;
