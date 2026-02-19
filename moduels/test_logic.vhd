library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity test_logic is
    port (
        sum   : in  unsigned(3 downto 0);
        d7    : out std_logic;
        d711  : out std_logic;
        d2312 : out std_logic
    );
end test_logic;

architecture behavioral of test_logic is
begin
    d7    <= '1' when sum = 7  else '0';
    d711  <= '1' when sum = 7 or sum = 11 else '0';
    d2312 <= '1' when sum = 2 or sum = 3 or sum = 12 else '0';
end behavioral;
