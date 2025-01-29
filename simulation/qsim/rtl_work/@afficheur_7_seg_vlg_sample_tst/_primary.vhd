library verilog;
use verilog.vl_types.all;
entity Afficheur_7_seg_vlg_sample_tst is
    port(
        digit           : in     vl_logic_vector(3 downto 0);
        sampler_tx      : out    vl_logic
    );
end Afficheur_7_seg_vlg_sample_tst;
