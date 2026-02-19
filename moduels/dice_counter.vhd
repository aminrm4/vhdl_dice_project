library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity dice_counter is
    port (
        clk : in  std_logic;
        rst : in  std_logic;
        en  : in  std_logic;
        q   : out unsigned(2 downto 0)
    );
end dice_counter;

architecture behavioral of dice_counter is
    signal count : unsigned(2 downto 0);
begin
    process(clk, rst)
    begin
        if rst = '1' then
            count <= "000";
        elsif rising_edge(clk) then
            if en = '1' then
                if count = "110" then
                    count <= "001";
                else
                    count <= count + 1;
                end if;
            end if;
        end if;
    end process;

    q <= count;
end behavioral;
