library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_test_logic is
end tb_test_logic;

architecture sim of tb_test_logic is
    signal sum   : unsigned(3 downto 0);
    signal d7    : std_logic;
    signal d711  : std_logic;
    signal d2312 : std_logic;
begin
    uut: entity work.test_logic
        port map (
            sum   => sum,
            d7    => d7,
            d711  => d711,
            d2312 => d2312
        );
    sum <= "0010" after  0 ns,
           "0011" after 10 ns,
           "0100" after 20 ns,
           "0101" after 30 ns,
           "0110" after 40 ns,
           "0111" after 50 ns,
           "1000" after 60 ns,
           "1001" after 70 ns,
           "1010" after 80 ns,
           "1011" after 90 ns,
           "1100" after 100 ns;

end sim;
