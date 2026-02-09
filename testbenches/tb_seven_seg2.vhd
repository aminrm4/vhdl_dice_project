library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_two_seven_seg is
end tb_two_seven_seg;

architecture sim of tb_two_seven_seg is
    signal d: unsigned(3 downto 0) := "0000";
    signal first_part, second_part: std_logic_vector(6 downto 0);
begin

    -- Unit Under Test
    uut: entity work.two_seven_seg
        port map(
            d => d,
            first_part => first_part,
            second_part => second_part
        );
    d <= "0000" after 0 ns,
         "0001" after 10 ns,
         "0010" after 20 ns,
         "0011" after 30 ns,
         "0100" after 40 ns,
         "0101" after 50 ns,
         "0110" after 60 ns,
         "0111" after 70 ns,
         "1000" after 80 ns,
         "1001" after 90 ns,
         "1010" after 100 ns,
         "1011" after 110 ns,
         "1100" after 120 ns, 
         "0000" after 140 ns;

end sim;
