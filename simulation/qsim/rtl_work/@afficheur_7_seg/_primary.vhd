library verilog;
use verilog.vl_types.all;
entity Afficheur_7_seg is
    port(
        digit           : in     vl_logic_vector(3 downto 0);
        segments        : out    vl_logic_vector(6 downto 0)
    );
end Afficheur_7_seg;
