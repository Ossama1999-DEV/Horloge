library verilog;
use verilog.vl_types.all;
entity Afficheur_7_seg_vlg_check_tst is
    port(
        segments        : in     vl_logic_vector(6 downto 0);
        sampler_rx      : in     vl_logic
    );
end Afficheur_7_seg_vlg_check_tst;
