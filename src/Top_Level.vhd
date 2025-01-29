-----------------------------------------------------------------------------------------------------------------------
--! @file   Top_Level.vhd
--! @brief  Le script Top_Level.vhd rassemble le compteur/décompteur cpt_dcpt et les six instances de l’Afficheur_7_seg
--! @author DBIBIH OUSSAMA : oussama.dbibih@viacesi.fr
-----------------------------------------------------------------------------------------------------------------------

--! standard library
library IEEE;
--! Use logic elements
use IEEE.STD_LOGIC_1164.ALL;

--! Debut de l'entity Top_Level
entity Top_Level is
    Port (
        --! Pram in
        clk     : in std_logic;
        reset   : in std_logic;
        enable  : in std_logic;
        start   : in std_logic;
        mode    : in std_logic;
        dh, uh, dm, um : in std_logic_vector(3 downto 0);

        --! Pram out
        seg_h1, seg_h2, seg_m1, seg_m2, seg_s1, seg_s2 : out std_logic_vector(6 downto 0); -- Sorties vers les afficheurs
		alarme : out std_logic
    );
end Top_Level;

--! Debut de l'architecture Top_Level
architecture Behavioral of Top_Level is

    -- Signaux internes pour les valeurs binaires du compteur
    signal h1_bin, h2_bin, m1_bin, m2_bin, s1_bin, s2_bin : std_logic_vector(3 downto 0);
	 signal signal_alarme : std_logic;

begin

    -- Instanciation du compteur
    Counter_Inst : entity work.cpt_dcpt
        port map (
            clk    => clk,
            reset  => reset,
            enable => enable,
            start  => start,
            mode   => mode,
            dh     => dh,
            uh     => uh,
            dm     => dm,
            um     => um,
            alarme => signal_alarme,
            h1     => h1_bin,
            h2     => h2_bin,
            m1     => m1_bin,
            m2     => m2_bin,
            s1     => s1_bin,
            s2     => s2_bin
        );
		  
	 alarme <= signal_alarme;

    -- Instanciation des décodeurs 7 segments
    Decoder_H1 : entity work.Afficheur_7_seg
        port map (
            digit    => h1_bin,
            segments => seg_h1
        );

    Decoder_H2 : entity work.Afficheur_7_seg
        port map (
            digit    => h2_bin,
            segments => seg_h2
        );

    Decoder_M1 : entity work.Afficheur_7_seg
        port map (
            digit    => m1_bin,
            segments => seg_m1
        );

    Decoder_M2 : entity work.Afficheur_7_seg
        port map (
            digit    => m2_bin,
            segments => seg_m2
        );

    Decoder_S1 : entity work.Afficheur_7_seg
        port map (
            digit    => s1_bin,
            segments => seg_s1
        );

    Decoder_S2 : entity work.Afficheur_7_seg
        port map (
            digit    => s2_bin,
            segments => seg_s2
        );

end Behavioral;
