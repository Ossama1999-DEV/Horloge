------------------------------------------------------------------------------------------
--! @file   Afficheur_7_seg.vhd
--! @brief  Afficheur_7_seg est basé sur le fonctionnement d'un décodeur 7segments standard
--! @author DBIBIH OUSSAMA : oussama.dbibih@viacesi.fr
------------------------------------------------------------------------------------------

--! standard library
library IEEE;
--! Use logic elements
use IEEE.STD_LOGIC_1164.ALL;

--! Debut de l'entity Afficheur_7_seg
entity Afficheur_7_seg is
    Port (
        --! digit
        digit       : in STD_LOGIC_VECTOR(3 downto 0);
        --! segments: a b c d e f g
        segments    : out STD_LOGIC_VECTOR(6 downto 0) 
    );
end Afficheur_7_seg;

--! Debut de l'architecture Afficheur_7_seg
architecture Behavioral of Afficheur_7_seg is
begin
    --! Process pour le dec 7 segments
    process(digit)
    begin
        case digit is
            when "0000" => segments <= "0000001"; -- 0
            when "0001" => segments <= "1001111"; -- 1
            when "0010" => segments <= "0010010"; -- 2
            when "0011" => segments <= "0000110"; -- 3
            when "0100" => segments <= "1001100"; -- 4
            when "0101" => segments <= "0100100"; -- 5
            when "0110" => segments <= "0100000"; -- 6
            when "0111" => segments <= "0001111"; -- 7
            when "1000" => segments <= "0000000"; -- 8
            when "1001" => segments <= "0000100"; -- 9
            when others => segments <= "1111111"; -- Off
        end case;
    end process;
end Behavioral;