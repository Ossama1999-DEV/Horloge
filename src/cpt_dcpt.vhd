-----------------------------------------------------------------------------------
--! @file   cpt_dcpt.vhd
--! @brief  Un compteur pour le mode horloge et un décompteur pour le mode minuteur
--! @author DBIBIH OUSSAMA : oussama.dbibih@viacesi.fr
-----------------------------------------------------------------------------------

--! standard library
library IEEE;
--! Use logic elements
use IEEE.STD_LOGIC_1164.ALL;
--! Use numeric elements
use IEEE.NUMERIC_STD.all;

--! Debut de l'entity cpt_dcpt
entity cpt_dcpt is
    port (
        --! horloge
        clk   : in std_logic;
        --! reset
        reset : in std_logic;
        --! enable
        enable          : in std_logic;
        --! les dizaine d'heure et um(unité d'heure), dm (dizaine de minute) et um (unité minute) 
        dh, uh, dm, um  : in std_logic_vector(3 downto 0);
        --! start dh, uh, dm et um
        start           : in std_logic;
        --! mode 0 ou 1
        mode            : in std_logic;
        --! alarme si le minuteur arrive a 00:00:00
        alarme                  : out std_logic;
        --! affichage HH:MM:SS
        h1, h2, m1, m2, s1, s2  : out std_logic_vector(3 downto 0)
    );
end entity cpt_dcpt;

--! Debut de l'architecture cpt_dcpt
--! @details Register Transfer Level (RTL)
architecture rtl of cpt_dcpt is
    --! cpt: compteur
    signal cpt                                  : integer := 0;
    --! @details
    signal r_h1, r_h2, r_m1, r_m2, r_s1, r_s2   : unsigned(3 downto 0)  := "0000";

    --! @details
    signal r_alarme : std_logic := '0';
    signal enable_alarme : std_logic := '0';
    signal cpt_alarme : integer := 0;
    
begin

    h1 <= std_logic_vector(r_h1);
    h2 <= std_logic_vector(r_h2);
    m1 <= std_logic_vector(r_m1);
    m2 <= std_logic_vector(r_m2);
    s1 <= std_logic_vector(r_s1);
    s2 <= std_logic_vector(r_s2);
    alarme <= r_alarme;
    --! Process 1
    GESTION_CPT : process(clk)
    begin
        if rising_edge(clk) then
            if reset = '1' then
                -- Réinitialisation
                r_h1 <= unsigned(uh);
                r_h2 <= unsigned(dh);
                r_m1 <= unsigned(um);
                r_m2 <= unsigned(dm);
                r_s1 <= (others => '0');
                r_s2 <= (others => '0');
                enable_alarme <= '0';
            elsif enable = '1' then
                if start = '1' then
                    -- Chargement des valeurs initiales
                    r_h1 <= unsigned(uh);
                    r_h2 <= unsigned(dh);
                    r_m1 <= unsigned(um);
                    r_m2 <= unsigned(dm);
                    r_s1 <= (others => '0');
                    r_s2 <= (others => '0');
                    enable_alarme <= '0';
                else
                    if mode = '1' then
                        -- Mode horloge (incrémentation)
                        r_s1 <= r_s1 + 1;
                        if r_s1 = 9 then
                            r_s1 <= (others => '0');
                            r_s2 <= r_s2 + 1;
                            if r_s2 = 5 then
                                r_s2 <= (others => '0');
                                r_m1 <= r_m1 + 1;
                                if r_m1 = 9 then
                                    r_m1 <= (others => '0');
                                    r_m2 <= r_m2 + 1;
                                    if r_m2 = 5 then
                                        r_m2 <= (others => '0');
                                        r_h1 <= r_h1 + 1;
                                        if r_h2 = 2 and r_h1 <= 4 then
                                            -- Remise à zéro au dépassement de 24h
                                            r_h1 <= (others => '0');
                                            r_h2 <= (others => '0');
                                            r_m1 <= (others => '0');
                                            r_m2 <= (others => '0');
                                            r_s1 <= (others => '0');
                                            r_s2 <= (others => '0');
                                        else
                                            if r_h1 = 9 then
                                                r_h1 <= (others => '0');
                                                r_h2 <= r_h2 + 1;
                                            end if;
                                        end if;
                                    end if;
                                end if;
                            end if;
                        end if;
                    elsif mode = '0' and enable_alarme = '0' then
                        -- Mode minuteur (décrémentation)
                        if r_s1 = 0 then
                            r_s1 <= to_unsigned(9, r_s1'length);
                            if r_s2 = 0 then
                                r_s2 <= to_unsigned(5, r_s2'length);
                                if r_m1 = 0 then
                                    r_m1 <= to_unsigned(9, r_m1'length);
                                    if r_m2 = 0 then
                                        r_m2 <= to_unsigned(5, r_m2'length);
                                        if r_h1 = 0 then
                                            r_h1 <= to_unsigned(9, r_h1'length);
                                            if r_h2 = 0 then
                                                -- Minuteur atteint 00:00:00
                                                enable_alarme <= '1'; -- Activer l'alarme
																r_s1 <= to_unsigned(0, r_s1'length);
																r_s2 <= to_unsigned(0, r_s2'length);
																r_m1 <= to_unsigned(0, r_m1'length);
																r_m2 <= to_unsigned(0, r_m2'length);
																r_h1 <= to_unsigned(0, r_h1'length);
																r_h2 <= to_unsigned(0, r_h2'length);
                                            else
                                                r_h2 <= r_h2 - 1;
                                            end if;
                                        else
                                            r_h1 <= r_h1 - 1;
                                        end if;
                                    else
                                        r_m2 <= r_m2 - 1;
                                    end if;
                                else
                                    r_m1 <= r_m1 - 1;
                                end if;
                            else
                                r_s2 <= r_s2 - 1;
                            end if;
                        else
                            r_s1 <= r_s1 - 1;
                        end if;
                    end if;
                end if;
            end if;
        end if;
    end process;

    --! Process 2
    GESTION_ALARME : process (clk)
    begin
        if rising_edge(clk) then
            if enable = '1' then
                if enable_alarme = '1' then
                    if cpt_alarme < 3 then
                        r_alarme <= '1';
                        cpt_alarme <= cpt_alarme + 1;
                    else
                        r_alarme <= '0';
                    end if;
                else
                    r_alarme <= '0';
                    cpt_alarme <= 0;
                end if;
            end if;
        end if;
    end process;

end architecture;