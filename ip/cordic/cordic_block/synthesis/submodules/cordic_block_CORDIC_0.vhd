-- ------------------------------------------------------------------------- 
-- High Level Design Compiler for Intel(R) FPGAs Version 18.1 (Release Build #625)
-- Quartus Prime development tool and MATLAB/Simulink Interface
-- 
-- Legal Notice: Copyright 2018 Intel Corporation.  All rights reserved.
-- Your use of  Intel Corporation's design tools,  logic functions and other
-- software and  tools, and its AMPP partner logic functions, and any output
-- files any  of the foregoing (including  device programming  or simulation
-- files), and  any associated  documentation  or information  are expressly
-- subject  to the terms and  conditions of the  Intel FPGA Software License
-- Agreement, Intel MegaCore Function License Agreement, or other applicable
-- license agreement,  including,  without limitation,  that your use is for
-- the  sole  purpose of  programming  logic devices  manufactured by  Intel
-- and  sold by Intel  or its authorized  distributors. Please refer  to the
-- applicable agreement for further details.
-- ---------------------------------------------------------------------------

-- VHDL created from cordic_block_CORDIC_0
-- VHDL created on Wed Mar 04 15:40:37 2020


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.all;
use std.TextIO.all;
use work.dspba_library_package.all;

LIBRARY altera_mf;
USE altera_mf.altera_mf_components.all;
LIBRARY altera_lnsim;
USE altera_lnsim.altera_lnsim_components.altera_syncram;
LIBRARY lpm;
USE lpm.lpm_components.all;

entity cordic_block_CORDIC_0 is
    port (
        a : in std_logic_vector(34 downto 0);  -- sfix35_en32
        c : out std_logic_vector(33 downto 0);  -- sfix34_en32
        s : out std_logic_vector(33 downto 0);  -- sfix34_en32
        clk : in std_logic;
        areset : in std_logic
    );
end cordic_block_CORDIC_0;

architecture normal of cordic_block_CORDIC_0 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal constantZero_uid6_sincosTest_q : STD_LOGIC_VECTOR (34 downto 0);
    signal signA_uid7_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal invSignA_uid8_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal absAE_uid9_sincosTest_a : STD_LOGIC_VECTOR (36 downto 0);
    signal absAE_uid9_sincosTest_b : STD_LOGIC_VECTOR (36 downto 0);
    signal absAE_uid9_sincosTest_o : STD_LOGIC_VECTOR (36 downto 0);
    signal absAE_uid9_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal absAE_uid9_sincosTest_q : STD_LOGIC_VECTOR (35 downto 0);
    signal absAR_uid10_sincosTest_in : STD_LOGIC_VECTOR (33 downto 0);
    signal absAR_uid10_sincosTest_b : STD_LOGIC_VECTOR (33 downto 0);
    signal cstPiO2_uid11_sincosTest_q : STD_LOGIC_VECTOR (40 downto 0);
    signal padACst_uid12_sincosTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal aPostPad_uid13_sincosTest_q : STD_LOGIC_VECTOR (41 downto 0);
    signal argMPiO2_uid14_sincosTest_a : STD_LOGIC_VECTOR (42 downto 0);
    signal argMPiO2_uid14_sincosTest_b : STD_LOGIC_VECTOR (42 downto 0);
    signal argMPiO2_uid14_sincosTest_o : STD_LOGIC_VECTOR (42 downto 0);
    signal argMPiO2_uid14_sincosTest_q : STD_LOGIC_VECTOR (42 downto 0);
    signal firstQuadrant_uid15_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal absARE_bottomRange_uid17_sincosTest_in : STD_LOGIC_VECTOR (32 downto 0);
    signal absARE_bottomRange_uid17_sincosTest_b : STD_LOGIC_VECTOR (32 downto 0);
    signal absARE_mergedSignalTM_uid18_sincosTest_q : STD_LOGIC_VECTOR (40 downto 0);
    signal argMPiO2_uid20_sincosTest_in : STD_LOGIC_VECTOR (40 downto 0);
    signal argMPiO2_uid20_sincosTest_b : STD_LOGIC_VECTOR (40 downto 0);
    signal absA_uid21_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal absA_uid21_sincosTest_q : STD_LOGIC_VECTOR (40 downto 0);
    signal cstOneOverK_uid22_sincosTest_q : STD_LOGIC_VECTOR (67 downto 0);
    signal cstArcTan2Mi_0_uid26_sincosTest_q : STD_LOGIC_VECTOR (44 downto 0);
    signal xip1E_1_uid32_sincosTest_q : STD_LOGIC_VECTOR (70 downto 0);
    signal yip1E_1CostZeroPaddingA_uid33_sincosTest_q : STD_LOGIC_VECTOR (67 downto 0);
    signal yip1E_1NA_uid34_sincosTest_q : STD_LOGIC_VECTOR (68 downto 0);
    signal yip1E_1sumAHighB_uid35_sincosTest_a : STD_LOGIC_VECTOR (70 downto 0);
    signal yip1E_1sumAHighB_uid35_sincosTest_b : STD_LOGIC_VECTOR (70 downto 0);
    signal yip1E_1sumAHighB_uid35_sincosTest_o : STD_LOGIC_VECTOR (70 downto 0);
    signal yip1E_1sumAHighB_uid35_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_1sumAHighB_uid35_sincosTest_q : STD_LOGIC_VECTOR (69 downto 0);
    signal invSignOfSelectionSignal_uid36_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_1CostZeroPaddingA_uid37_sincosTest_q : STD_LOGIC_VECTOR (3 downto 0);
    signal aip1E_1NA_uid38_sincosTest_q : STD_LOGIC_VECTOR (44 downto 0);
    signal aip1E_1sumAHighB_uid39_sincosTest_a : STD_LOGIC_VECTOR (47 downto 0);
    signal aip1E_1sumAHighB_uid39_sincosTest_b : STD_LOGIC_VECTOR (47 downto 0);
    signal aip1E_1sumAHighB_uid39_sincosTest_o : STD_LOGIC_VECTOR (47 downto 0);
    signal aip1E_1sumAHighB_uid39_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_1sumAHighB_uid39_sincosTest_q : STD_LOGIC_VECTOR (46 downto 0);
    signal xip1_1_topRange_uid41_sincosTest_in : STD_LOGIC_VECTOR (69 downto 0);
    signal xip1_1_topRange_uid41_sincosTest_b : STD_LOGIC_VECTOR (69 downto 0);
    signal xip1_1_mergedSignalTM_uid42_sincosTest_q : STD_LOGIC_VECTOR (70 downto 0);
    signal xMSB_uid44_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1_1_mergedSignalTM_uid48_sincosTest_q : STD_LOGIC_VECTOR (70 downto 0);
    signal aip1E_uid50_sincosTest_in : STD_LOGIC_VECTOR (45 downto 0);
    signal aip1E_uid50_sincosTest_b : STD_LOGIC_VECTOR (45 downto 0);
    signal xMSB_uid51_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signOfSelectionSignal_uid53_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid56_sincosTest_b : STD_LOGIC_VECTOR (69 downto 0);
    signal twoToMiSiYip_uid57_sincosTest_b : STD_LOGIC_VECTOR (69 downto 0);
    signal cstArcTan2Mi_1_uid58_sincosTest_q : STD_LOGIC_VECTOR (43 downto 0);
    signal xip1E_2_uid60_sincosTest_a : STD_LOGIC_VECTOR (72 downto 0);
    signal xip1E_2_uid60_sincosTest_b : STD_LOGIC_VECTOR (72 downto 0);
    signal xip1E_2_uid60_sincosTest_o : STD_LOGIC_VECTOR (72 downto 0);
    signal xip1E_2_uid60_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_2_uid60_sincosTest_q : STD_LOGIC_VECTOR (71 downto 0);
    signal yip1E_2_uid61_sincosTest_a : STD_LOGIC_VECTOR (72 downto 0);
    signal yip1E_2_uid61_sincosTest_b : STD_LOGIC_VECTOR (72 downto 0);
    signal yip1E_2_uid61_sincosTest_o : STD_LOGIC_VECTOR (72 downto 0);
    signal yip1E_2_uid61_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_2_uid61_sincosTest_q : STD_LOGIC_VECTOR (71 downto 0);
    signal aip1E_2_uid63_sincosTest_a : STD_LOGIC_VECTOR (47 downto 0);
    signal aip1E_2_uid63_sincosTest_b : STD_LOGIC_VECTOR (47 downto 0);
    signal aip1E_2_uid63_sincosTest_o : STD_LOGIC_VECTOR (47 downto 0);
    signal aip1E_2_uid63_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_2_uid63_sincosTest_q : STD_LOGIC_VECTOR (46 downto 0);
    signal xip1_2_uid64_sincosTest_in : STD_LOGIC_VECTOR (70 downto 0);
    signal xip1_2_uid64_sincosTest_b : STD_LOGIC_VECTOR (70 downto 0);
    signal yip1_2_uid65_sincosTest_in : STD_LOGIC_VECTOR (70 downto 0);
    signal yip1_2_uid65_sincosTest_b : STD_LOGIC_VECTOR (70 downto 0);
    signal aip1E_uid66_sincosTest_in : STD_LOGIC_VECTOR (44 downto 0);
    signal aip1E_uid66_sincosTest_b : STD_LOGIC_VECTOR (44 downto 0);
    signal xMSB_uid67_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signOfSelectionSignal_uid69_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid72_sincosTest_b : STD_LOGIC_VECTOR (68 downto 0);
    signal twoToMiSiYip_uid73_sincosTest_b : STD_LOGIC_VECTOR (68 downto 0);
    signal cstArcTan2Mi_2_uid74_sincosTest_q : STD_LOGIC_VECTOR (42 downto 0);
    signal xip1E_3_uid76_sincosTest_a : STD_LOGIC_VECTOR (72 downto 0);
    signal xip1E_3_uid76_sincosTest_b : STD_LOGIC_VECTOR (72 downto 0);
    signal xip1E_3_uid76_sincosTest_o : STD_LOGIC_VECTOR (72 downto 0);
    signal xip1E_3_uid76_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_3_uid76_sincosTest_q : STD_LOGIC_VECTOR (71 downto 0);
    signal yip1E_3_uid77_sincosTest_a : STD_LOGIC_VECTOR (72 downto 0);
    signal yip1E_3_uid77_sincosTest_b : STD_LOGIC_VECTOR (72 downto 0);
    signal yip1E_3_uid77_sincosTest_o : STD_LOGIC_VECTOR (72 downto 0);
    signal yip1E_3_uid77_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_3_uid77_sincosTest_q : STD_LOGIC_VECTOR (71 downto 0);
    signal aip1E_3_uid79_sincosTest_a : STD_LOGIC_VECTOR (46 downto 0);
    signal aip1E_3_uid79_sincosTest_b : STD_LOGIC_VECTOR (46 downto 0);
    signal aip1E_3_uid79_sincosTest_o : STD_LOGIC_VECTOR (46 downto 0);
    signal aip1E_3_uid79_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_3_uid79_sincosTest_q : STD_LOGIC_VECTOR (45 downto 0);
    signal xip1_3_uid80_sincosTest_in : STD_LOGIC_VECTOR (70 downto 0);
    signal xip1_3_uid80_sincosTest_b : STD_LOGIC_VECTOR (70 downto 0);
    signal yip1_3_uid81_sincosTest_in : STD_LOGIC_VECTOR (70 downto 0);
    signal yip1_3_uid81_sincosTest_b : STD_LOGIC_VECTOR (70 downto 0);
    signal aip1E_uid82_sincosTest_in : STD_LOGIC_VECTOR (43 downto 0);
    signal aip1E_uid82_sincosTest_b : STD_LOGIC_VECTOR (43 downto 0);
    signal xMSB_uid83_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signOfSelectionSignal_uid85_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid88_sincosTest_b : STD_LOGIC_VECTOR (67 downto 0);
    signal twoToMiSiYip_uid89_sincosTest_b : STD_LOGIC_VECTOR (67 downto 0);
    signal cstArcTan2Mi_3_uid90_sincosTest_q : STD_LOGIC_VECTOR (41 downto 0);
    signal xip1E_4_uid92_sincosTest_a : STD_LOGIC_VECTOR (72 downto 0);
    signal xip1E_4_uid92_sincosTest_b : STD_LOGIC_VECTOR (72 downto 0);
    signal xip1E_4_uid92_sincosTest_o : STD_LOGIC_VECTOR (72 downto 0);
    signal xip1E_4_uid92_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_4_uid92_sincosTest_q : STD_LOGIC_VECTOR (71 downto 0);
    signal yip1E_4_uid93_sincosTest_a : STD_LOGIC_VECTOR (72 downto 0);
    signal yip1E_4_uid93_sincosTest_b : STD_LOGIC_VECTOR (72 downto 0);
    signal yip1E_4_uid93_sincosTest_o : STD_LOGIC_VECTOR (72 downto 0);
    signal yip1E_4_uid93_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_4_uid93_sincosTest_q : STD_LOGIC_VECTOR (71 downto 0);
    signal aip1E_4_uid95_sincosTest_a : STD_LOGIC_VECTOR (45 downto 0);
    signal aip1E_4_uid95_sincosTest_b : STD_LOGIC_VECTOR (45 downto 0);
    signal aip1E_4_uid95_sincosTest_o : STD_LOGIC_VECTOR (45 downto 0);
    signal aip1E_4_uid95_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_4_uid95_sincosTest_q : STD_LOGIC_VECTOR (44 downto 0);
    signal xip1_4_uid96_sincosTest_in : STD_LOGIC_VECTOR (70 downto 0);
    signal xip1_4_uid96_sincosTest_b : STD_LOGIC_VECTOR (70 downto 0);
    signal yip1_4_uid97_sincosTest_in : STD_LOGIC_VECTOR (70 downto 0);
    signal yip1_4_uid97_sincosTest_b : STD_LOGIC_VECTOR (70 downto 0);
    signal aip1E_uid98_sincosTest_in : STD_LOGIC_VECTOR (42 downto 0);
    signal aip1E_uid98_sincosTest_b : STD_LOGIC_VECTOR (42 downto 0);
    signal xMSB_uid99_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signOfSelectionSignal_uid101_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid104_sincosTest_b : STD_LOGIC_VECTOR (66 downto 0);
    signal twoToMiSiYip_uid105_sincosTest_b : STD_LOGIC_VECTOR (66 downto 0);
    signal cstArcTan2Mi_4_uid106_sincosTest_q : STD_LOGIC_VECTOR (40 downto 0);
    signal xip1E_5_uid108_sincosTest_a : STD_LOGIC_VECTOR (72 downto 0);
    signal xip1E_5_uid108_sincosTest_b : STD_LOGIC_VECTOR (72 downto 0);
    signal xip1E_5_uid108_sincosTest_o : STD_LOGIC_VECTOR (72 downto 0);
    signal xip1E_5_uid108_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_5_uid108_sincosTest_q : STD_LOGIC_VECTOR (71 downto 0);
    signal yip1E_5_uid109_sincosTest_a : STD_LOGIC_VECTOR (72 downto 0);
    signal yip1E_5_uid109_sincosTest_b : STD_LOGIC_VECTOR (72 downto 0);
    signal yip1E_5_uid109_sincosTest_o : STD_LOGIC_VECTOR (72 downto 0);
    signal yip1E_5_uid109_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_5_uid109_sincosTest_q : STD_LOGIC_VECTOR (71 downto 0);
    signal aip1E_5_uid111_sincosTest_a : STD_LOGIC_VECTOR (44 downto 0);
    signal aip1E_5_uid111_sincosTest_b : STD_LOGIC_VECTOR (44 downto 0);
    signal aip1E_5_uid111_sincosTest_o : STD_LOGIC_VECTOR (44 downto 0);
    signal aip1E_5_uid111_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_5_uid111_sincosTest_q : STD_LOGIC_VECTOR (43 downto 0);
    signal xip1_5_uid112_sincosTest_in : STD_LOGIC_VECTOR (70 downto 0);
    signal xip1_5_uid112_sincosTest_b : STD_LOGIC_VECTOR (70 downto 0);
    signal yip1_5_uid113_sincosTest_in : STD_LOGIC_VECTOR (70 downto 0);
    signal yip1_5_uid113_sincosTest_b : STD_LOGIC_VECTOR (70 downto 0);
    signal aip1E_uid114_sincosTest_in : STD_LOGIC_VECTOR (41 downto 0);
    signal aip1E_uid114_sincosTest_b : STD_LOGIC_VECTOR (41 downto 0);
    signal xMSB_uid115_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signOfSelectionSignal_uid117_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid120_sincosTest_b : STD_LOGIC_VECTOR (65 downto 0);
    signal twoToMiSiYip_uid121_sincosTest_b : STD_LOGIC_VECTOR (65 downto 0);
    signal cstArcTan2Mi_5_uid122_sincosTest_q : STD_LOGIC_VECTOR (39 downto 0);
    signal xip1E_6_uid124_sincosTest_a : STD_LOGIC_VECTOR (72 downto 0);
    signal xip1E_6_uid124_sincosTest_b : STD_LOGIC_VECTOR (72 downto 0);
    signal xip1E_6_uid124_sincosTest_o : STD_LOGIC_VECTOR (72 downto 0);
    signal xip1E_6_uid124_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_6_uid124_sincosTest_q : STD_LOGIC_VECTOR (71 downto 0);
    signal yip1E_6_uid125_sincosTest_a : STD_LOGIC_VECTOR (72 downto 0);
    signal yip1E_6_uid125_sincosTest_b : STD_LOGIC_VECTOR (72 downto 0);
    signal yip1E_6_uid125_sincosTest_o : STD_LOGIC_VECTOR (72 downto 0);
    signal yip1E_6_uid125_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_6_uid125_sincosTest_q : STD_LOGIC_VECTOR (71 downto 0);
    signal aip1E_6_uid127_sincosTest_a : STD_LOGIC_VECTOR (43 downto 0);
    signal aip1E_6_uid127_sincosTest_b : STD_LOGIC_VECTOR (43 downto 0);
    signal aip1E_6_uid127_sincosTest_o : STD_LOGIC_VECTOR (43 downto 0);
    signal aip1E_6_uid127_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_6_uid127_sincosTest_q : STD_LOGIC_VECTOR (42 downto 0);
    signal xip1_6_uid128_sincosTest_in : STD_LOGIC_VECTOR (70 downto 0);
    signal xip1_6_uid128_sincosTest_b : STD_LOGIC_VECTOR (70 downto 0);
    signal yip1_6_uid129_sincosTest_in : STD_LOGIC_VECTOR (70 downto 0);
    signal yip1_6_uid129_sincosTest_b : STD_LOGIC_VECTOR (70 downto 0);
    signal aip1E_uid130_sincosTest_in : STD_LOGIC_VECTOR (40 downto 0);
    signal aip1E_uid130_sincosTest_b : STD_LOGIC_VECTOR (40 downto 0);
    signal xMSB_uid131_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signOfSelectionSignal_uid133_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid136_sincosTest_b : STD_LOGIC_VECTOR (64 downto 0);
    signal twoToMiSiYip_uid137_sincosTest_b : STD_LOGIC_VECTOR (64 downto 0);
    signal cstArcTan2Mi_6_uid138_sincosTest_q : STD_LOGIC_VECTOR (38 downto 0);
    signal xip1E_7_uid140_sincosTest_a : STD_LOGIC_VECTOR (72 downto 0);
    signal xip1E_7_uid140_sincosTest_b : STD_LOGIC_VECTOR (72 downto 0);
    signal xip1E_7_uid140_sincosTest_o : STD_LOGIC_VECTOR (72 downto 0);
    signal xip1E_7_uid140_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_7_uid140_sincosTest_q : STD_LOGIC_VECTOR (71 downto 0);
    signal yip1E_7_uid141_sincosTest_a : STD_LOGIC_VECTOR (72 downto 0);
    signal yip1E_7_uid141_sincosTest_b : STD_LOGIC_VECTOR (72 downto 0);
    signal yip1E_7_uid141_sincosTest_o : STD_LOGIC_VECTOR (72 downto 0);
    signal yip1E_7_uid141_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_7_uid141_sincosTest_q : STD_LOGIC_VECTOR (71 downto 0);
    signal aip1E_7_uid143_sincosTest_a : STD_LOGIC_VECTOR (42 downto 0);
    signal aip1E_7_uid143_sincosTest_b : STD_LOGIC_VECTOR (42 downto 0);
    signal aip1E_7_uid143_sincosTest_o : STD_LOGIC_VECTOR (42 downto 0);
    signal aip1E_7_uid143_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_7_uid143_sincosTest_q : STD_LOGIC_VECTOR (41 downto 0);
    signal xip1_7_uid144_sincosTest_in : STD_LOGIC_VECTOR (70 downto 0);
    signal xip1_7_uid144_sincosTest_b : STD_LOGIC_VECTOR (70 downto 0);
    signal yip1_7_uid145_sincosTest_in : STD_LOGIC_VECTOR (70 downto 0);
    signal yip1_7_uid145_sincosTest_b : STD_LOGIC_VECTOR (70 downto 0);
    signal aip1E_uid146_sincosTest_in : STD_LOGIC_VECTOR (39 downto 0);
    signal aip1E_uid146_sincosTest_b : STD_LOGIC_VECTOR (39 downto 0);
    signal xMSB_uid147_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signOfSelectionSignal_uid149_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid152_sincosTest_b : STD_LOGIC_VECTOR (63 downto 0);
    signal twoToMiSiYip_uid153_sincosTest_b : STD_LOGIC_VECTOR (63 downto 0);
    signal cstArcTan2Mi_7_uid154_sincosTest_q : STD_LOGIC_VECTOR (37 downto 0);
    signal xip1E_8_uid156_sincosTest_a : STD_LOGIC_VECTOR (72 downto 0);
    signal xip1E_8_uid156_sincosTest_b : STD_LOGIC_VECTOR (72 downto 0);
    signal xip1E_8_uid156_sincosTest_o : STD_LOGIC_VECTOR (72 downto 0);
    signal xip1E_8_uid156_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_8_uid156_sincosTest_q : STD_LOGIC_VECTOR (71 downto 0);
    signal yip1E_8_uid157_sincosTest_a : STD_LOGIC_VECTOR (72 downto 0);
    signal yip1E_8_uid157_sincosTest_b : STD_LOGIC_VECTOR (72 downto 0);
    signal yip1E_8_uid157_sincosTest_o : STD_LOGIC_VECTOR (72 downto 0);
    signal yip1E_8_uid157_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_8_uid157_sincosTest_q : STD_LOGIC_VECTOR (71 downto 0);
    signal aip1E_8_uid159_sincosTest_a : STD_LOGIC_VECTOR (41 downto 0);
    signal aip1E_8_uid159_sincosTest_b : STD_LOGIC_VECTOR (41 downto 0);
    signal aip1E_8_uid159_sincosTest_o : STD_LOGIC_VECTOR (41 downto 0);
    signal aip1E_8_uid159_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_8_uid159_sincosTest_q : STD_LOGIC_VECTOR (40 downto 0);
    signal xip1_8_uid160_sincosTest_in : STD_LOGIC_VECTOR (70 downto 0);
    signal xip1_8_uid160_sincosTest_b : STD_LOGIC_VECTOR (70 downto 0);
    signal yip1_8_uid161_sincosTest_in : STD_LOGIC_VECTOR (70 downto 0);
    signal yip1_8_uid161_sincosTest_b : STD_LOGIC_VECTOR (70 downto 0);
    signal aip1E_uid162_sincosTest_in : STD_LOGIC_VECTOR (38 downto 0);
    signal aip1E_uid162_sincosTest_b : STD_LOGIC_VECTOR (38 downto 0);
    signal xMSB_uid163_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signOfSelectionSignal_uid165_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid168_sincosTest_b : STD_LOGIC_VECTOR (62 downto 0);
    signal twoToMiSiYip_uid169_sincosTest_b : STD_LOGIC_VECTOR (62 downto 0);
    signal cstArcTan2Mi_8_uid170_sincosTest_q : STD_LOGIC_VECTOR (36 downto 0);
    signal xip1E_9_uid172_sincosTest_a : STD_LOGIC_VECTOR (72 downto 0);
    signal xip1E_9_uid172_sincosTest_b : STD_LOGIC_VECTOR (72 downto 0);
    signal xip1E_9_uid172_sincosTest_o : STD_LOGIC_VECTOR (72 downto 0);
    signal xip1E_9_uid172_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_9_uid172_sincosTest_q : STD_LOGIC_VECTOR (71 downto 0);
    signal yip1E_9_uid173_sincosTest_a : STD_LOGIC_VECTOR (72 downto 0);
    signal yip1E_9_uid173_sincosTest_b : STD_LOGIC_VECTOR (72 downto 0);
    signal yip1E_9_uid173_sincosTest_o : STD_LOGIC_VECTOR (72 downto 0);
    signal yip1E_9_uid173_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_9_uid173_sincosTest_q : STD_LOGIC_VECTOR (71 downto 0);
    signal aip1E_9_uid175_sincosTest_a : STD_LOGIC_VECTOR (40 downto 0);
    signal aip1E_9_uid175_sincosTest_b : STD_LOGIC_VECTOR (40 downto 0);
    signal aip1E_9_uid175_sincosTest_o : STD_LOGIC_VECTOR (40 downto 0);
    signal aip1E_9_uid175_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_9_uid175_sincosTest_q : STD_LOGIC_VECTOR (39 downto 0);
    signal xip1_9_uid176_sincosTest_in : STD_LOGIC_VECTOR (70 downto 0);
    signal xip1_9_uid176_sincosTest_b : STD_LOGIC_VECTOR (70 downto 0);
    signal yip1_9_uid177_sincosTest_in : STD_LOGIC_VECTOR (70 downto 0);
    signal yip1_9_uid177_sincosTest_b : STD_LOGIC_VECTOR (70 downto 0);
    signal aip1E_uid178_sincosTest_in : STD_LOGIC_VECTOR (37 downto 0);
    signal aip1E_uid178_sincosTest_b : STD_LOGIC_VECTOR (37 downto 0);
    signal xMSB_uid179_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signOfSelectionSignal_uid181_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid184_sincosTest_b : STD_LOGIC_VECTOR (61 downto 0);
    signal twoToMiSiYip_uid185_sincosTest_b : STD_LOGIC_VECTOR (61 downto 0);
    signal cstArcTan2Mi_9_uid186_sincosTest_q : STD_LOGIC_VECTOR (35 downto 0);
    signal xip1E_10_uid188_sincosTest_a : STD_LOGIC_VECTOR (72 downto 0);
    signal xip1E_10_uid188_sincosTest_b : STD_LOGIC_VECTOR (72 downto 0);
    signal xip1E_10_uid188_sincosTest_o : STD_LOGIC_VECTOR (72 downto 0);
    signal xip1E_10_uid188_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_10_uid188_sincosTest_q : STD_LOGIC_VECTOR (71 downto 0);
    signal yip1E_10_uid189_sincosTest_a : STD_LOGIC_VECTOR (72 downto 0);
    signal yip1E_10_uid189_sincosTest_b : STD_LOGIC_VECTOR (72 downto 0);
    signal yip1E_10_uid189_sincosTest_o : STD_LOGIC_VECTOR (72 downto 0);
    signal yip1E_10_uid189_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_10_uid189_sincosTest_q : STD_LOGIC_VECTOR (71 downto 0);
    signal aip1E_10_uid191_sincosTest_a : STD_LOGIC_VECTOR (39 downto 0);
    signal aip1E_10_uid191_sincosTest_b : STD_LOGIC_VECTOR (39 downto 0);
    signal aip1E_10_uid191_sincosTest_o : STD_LOGIC_VECTOR (39 downto 0);
    signal aip1E_10_uid191_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_10_uid191_sincosTest_q : STD_LOGIC_VECTOR (38 downto 0);
    signal xip1_10_uid192_sincosTest_in : STD_LOGIC_VECTOR (70 downto 0);
    signal xip1_10_uid192_sincosTest_b : STD_LOGIC_VECTOR (70 downto 0);
    signal yip1_10_uid193_sincosTest_in : STD_LOGIC_VECTOR (70 downto 0);
    signal yip1_10_uid193_sincosTest_b : STD_LOGIC_VECTOR (70 downto 0);
    signal aip1E_uid194_sincosTest_in : STD_LOGIC_VECTOR (36 downto 0);
    signal aip1E_uid194_sincosTest_b : STD_LOGIC_VECTOR (36 downto 0);
    signal xMSB_uid195_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signOfSelectionSignal_uid197_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid200_sincosTest_b : STD_LOGIC_VECTOR (60 downto 0);
    signal twoToMiSiYip_uid201_sincosTest_b : STD_LOGIC_VECTOR (60 downto 0);
    signal cstArcTan2Mi_10_uid202_sincosTest_q : STD_LOGIC_VECTOR (34 downto 0);
    signal xip1E_11_uid204_sincosTest_a : STD_LOGIC_VECTOR (72 downto 0);
    signal xip1E_11_uid204_sincosTest_b : STD_LOGIC_VECTOR (72 downto 0);
    signal xip1E_11_uid204_sincosTest_o : STD_LOGIC_VECTOR (72 downto 0);
    signal xip1E_11_uid204_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_11_uid204_sincosTest_q : STD_LOGIC_VECTOR (71 downto 0);
    signal yip1E_11_uid205_sincosTest_a : STD_LOGIC_VECTOR (72 downto 0);
    signal yip1E_11_uid205_sincosTest_b : STD_LOGIC_VECTOR (72 downto 0);
    signal yip1E_11_uid205_sincosTest_o : STD_LOGIC_VECTOR (72 downto 0);
    signal yip1E_11_uid205_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_11_uid205_sincosTest_q : STD_LOGIC_VECTOR (71 downto 0);
    signal aip1E_11_uid207_sincosTest_a : STD_LOGIC_VECTOR (38 downto 0);
    signal aip1E_11_uid207_sincosTest_b : STD_LOGIC_VECTOR (38 downto 0);
    signal aip1E_11_uid207_sincosTest_o : STD_LOGIC_VECTOR (38 downto 0);
    signal aip1E_11_uid207_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_11_uid207_sincosTest_q : STD_LOGIC_VECTOR (37 downto 0);
    signal xip1_11_uid208_sincosTest_in : STD_LOGIC_VECTOR (70 downto 0);
    signal xip1_11_uid208_sincosTest_b : STD_LOGIC_VECTOR (70 downto 0);
    signal yip1_11_uid209_sincosTest_in : STD_LOGIC_VECTOR (70 downto 0);
    signal yip1_11_uid209_sincosTest_b : STD_LOGIC_VECTOR (70 downto 0);
    signal aip1E_uid210_sincosTest_in : STD_LOGIC_VECTOR (35 downto 0);
    signal aip1E_uid210_sincosTest_b : STD_LOGIC_VECTOR (35 downto 0);
    signal xMSB_uid211_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signOfSelectionSignal_uid213_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid216_sincosTest_b : STD_LOGIC_VECTOR (59 downto 0);
    signal twoToMiSiYip_uid217_sincosTest_b : STD_LOGIC_VECTOR (59 downto 0);
    signal cstArcTan2Mi_11_uid218_sincosTest_q : STD_LOGIC_VECTOR (33 downto 0);
    signal xip1E_12_uid220_sincosTest_a : STD_LOGIC_VECTOR (72 downto 0);
    signal xip1E_12_uid220_sincosTest_b : STD_LOGIC_VECTOR (72 downto 0);
    signal xip1E_12_uid220_sincosTest_o : STD_LOGIC_VECTOR (72 downto 0);
    signal xip1E_12_uid220_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_12_uid220_sincosTest_q : STD_LOGIC_VECTOR (71 downto 0);
    signal yip1E_12_uid221_sincosTest_a : STD_LOGIC_VECTOR (72 downto 0);
    signal yip1E_12_uid221_sincosTest_b : STD_LOGIC_VECTOR (72 downto 0);
    signal yip1E_12_uid221_sincosTest_o : STD_LOGIC_VECTOR (72 downto 0);
    signal yip1E_12_uid221_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_12_uid221_sincosTest_q : STD_LOGIC_VECTOR (71 downto 0);
    signal aip1E_12_uid223_sincosTest_a : STD_LOGIC_VECTOR (37 downto 0);
    signal aip1E_12_uid223_sincosTest_b : STD_LOGIC_VECTOR (37 downto 0);
    signal aip1E_12_uid223_sincosTest_o : STD_LOGIC_VECTOR (37 downto 0);
    signal aip1E_12_uid223_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_12_uid223_sincosTest_q : STD_LOGIC_VECTOR (36 downto 0);
    signal xip1_12_uid224_sincosTest_in : STD_LOGIC_VECTOR (70 downto 0);
    signal xip1_12_uid224_sincosTest_b : STD_LOGIC_VECTOR (70 downto 0);
    signal yip1_12_uid225_sincosTest_in : STD_LOGIC_VECTOR (70 downto 0);
    signal yip1_12_uid225_sincosTest_b : STD_LOGIC_VECTOR (70 downto 0);
    signal aip1E_uid226_sincosTest_in : STD_LOGIC_VECTOR (34 downto 0);
    signal aip1E_uid226_sincosTest_b : STD_LOGIC_VECTOR (34 downto 0);
    signal xMSB_uid227_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signOfSelectionSignal_uid229_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid232_sincosTest_b : STD_LOGIC_VECTOR (58 downto 0);
    signal twoToMiSiYip_uid233_sincosTest_b : STD_LOGIC_VECTOR (58 downto 0);
    signal cstArcTan2Mi_12_uid234_sincosTest_q : STD_LOGIC_VECTOR (32 downto 0);
    signal xip1E_13_uid236_sincosTest_a : STD_LOGIC_VECTOR (72 downto 0);
    signal xip1E_13_uid236_sincosTest_b : STD_LOGIC_VECTOR (72 downto 0);
    signal xip1E_13_uid236_sincosTest_o : STD_LOGIC_VECTOR (72 downto 0);
    signal xip1E_13_uid236_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_13_uid236_sincosTest_q : STD_LOGIC_VECTOR (71 downto 0);
    signal yip1E_13_uid237_sincosTest_a : STD_LOGIC_VECTOR (72 downto 0);
    signal yip1E_13_uid237_sincosTest_b : STD_LOGIC_VECTOR (72 downto 0);
    signal yip1E_13_uid237_sincosTest_o : STD_LOGIC_VECTOR (72 downto 0);
    signal yip1E_13_uid237_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_13_uid237_sincosTest_q : STD_LOGIC_VECTOR (71 downto 0);
    signal aip1E_13_uid239_sincosTest_a : STD_LOGIC_VECTOR (36 downto 0);
    signal aip1E_13_uid239_sincosTest_b : STD_LOGIC_VECTOR (36 downto 0);
    signal aip1E_13_uid239_sincosTest_o : STD_LOGIC_VECTOR (36 downto 0);
    signal aip1E_13_uid239_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_13_uid239_sincosTest_q : STD_LOGIC_VECTOR (35 downto 0);
    signal xip1_13_uid240_sincosTest_in : STD_LOGIC_VECTOR (70 downto 0);
    signal xip1_13_uid240_sincosTest_b : STD_LOGIC_VECTOR (70 downto 0);
    signal yip1_13_uid241_sincosTest_in : STD_LOGIC_VECTOR (70 downto 0);
    signal yip1_13_uid241_sincosTest_b : STD_LOGIC_VECTOR (70 downto 0);
    signal aip1E_uid242_sincosTest_in : STD_LOGIC_VECTOR (33 downto 0);
    signal aip1E_uid242_sincosTest_b : STD_LOGIC_VECTOR (33 downto 0);
    signal xMSB_uid243_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signOfSelectionSignal_uid245_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid248_sincosTest_b : STD_LOGIC_VECTOR (57 downto 0);
    signal twoToMiSiYip_uid249_sincosTest_b : STD_LOGIC_VECTOR (57 downto 0);
    signal cstArcTan2Mi_13_uid250_sincosTest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal xip1E_14_uid252_sincosTest_a : STD_LOGIC_VECTOR (72 downto 0);
    signal xip1E_14_uid252_sincosTest_b : STD_LOGIC_VECTOR (72 downto 0);
    signal xip1E_14_uid252_sincosTest_o : STD_LOGIC_VECTOR (72 downto 0);
    signal xip1E_14_uid252_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_14_uid252_sincosTest_q : STD_LOGIC_VECTOR (71 downto 0);
    signal yip1E_14_uid253_sincosTest_a : STD_LOGIC_VECTOR (72 downto 0);
    signal yip1E_14_uid253_sincosTest_b : STD_LOGIC_VECTOR (72 downto 0);
    signal yip1E_14_uid253_sincosTest_o : STD_LOGIC_VECTOR (72 downto 0);
    signal yip1E_14_uid253_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_14_uid253_sincosTest_q : STD_LOGIC_VECTOR (71 downto 0);
    signal aip1E_14_uid255_sincosTest_a : STD_LOGIC_VECTOR (35 downto 0);
    signal aip1E_14_uid255_sincosTest_b : STD_LOGIC_VECTOR (35 downto 0);
    signal aip1E_14_uid255_sincosTest_o : STD_LOGIC_VECTOR (35 downto 0);
    signal aip1E_14_uid255_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_14_uid255_sincosTest_q : STD_LOGIC_VECTOR (34 downto 0);
    signal xip1_14_uid256_sincosTest_in : STD_LOGIC_VECTOR (70 downto 0);
    signal xip1_14_uid256_sincosTest_b : STD_LOGIC_VECTOR (70 downto 0);
    signal yip1_14_uid257_sincosTest_in : STD_LOGIC_VECTOR (70 downto 0);
    signal yip1_14_uid257_sincosTest_b : STD_LOGIC_VECTOR (70 downto 0);
    signal aip1E_uid258_sincosTest_in : STD_LOGIC_VECTOR (32 downto 0);
    signal aip1E_uid258_sincosTest_b : STD_LOGIC_VECTOR (32 downto 0);
    signal xMSB_uid259_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signOfSelectionSignal_uid261_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid264_sincosTest_b : STD_LOGIC_VECTOR (56 downto 0);
    signal twoToMiSiYip_uid265_sincosTest_b : STD_LOGIC_VECTOR (56 downto 0);
    signal cstArcTan2Mi_14_uid266_sincosTest_q : STD_LOGIC_VECTOR (30 downto 0);
    signal xip1E_15_uid268_sincosTest_a : STD_LOGIC_VECTOR (72 downto 0);
    signal xip1E_15_uid268_sincosTest_b : STD_LOGIC_VECTOR (72 downto 0);
    signal xip1E_15_uid268_sincosTest_o : STD_LOGIC_VECTOR (72 downto 0);
    signal xip1E_15_uid268_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_15_uid268_sincosTest_q : STD_LOGIC_VECTOR (71 downto 0);
    signal yip1E_15_uid269_sincosTest_a : STD_LOGIC_VECTOR (72 downto 0);
    signal yip1E_15_uid269_sincosTest_b : STD_LOGIC_VECTOR (72 downto 0);
    signal yip1E_15_uid269_sincosTest_o : STD_LOGIC_VECTOR (72 downto 0);
    signal yip1E_15_uid269_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_15_uid269_sincosTest_q : STD_LOGIC_VECTOR (71 downto 0);
    signal aip1E_15_uid271_sincosTest_a : STD_LOGIC_VECTOR (34 downto 0);
    signal aip1E_15_uid271_sincosTest_b : STD_LOGIC_VECTOR (34 downto 0);
    signal aip1E_15_uid271_sincosTest_o : STD_LOGIC_VECTOR (34 downto 0);
    signal aip1E_15_uid271_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_15_uid271_sincosTest_q : STD_LOGIC_VECTOR (33 downto 0);
    signal xip1_15_uid272_sincosTest_in : STD_LOGIC_VECTOR (70 downto 0);
    signal xip1_15_uid272_sincosTest_b : STD_LOGIC_VECTOR (70 downto 0);
    signal yip1_15_uid273_sincosTest_in : STD_LOGIC_VECTOR (70 downto 0);
    signal yip1_15_uid273_sincosTest_b : STD_LOGIC_VECTOR (70 downto 0);
    signal aip1E_uid274_sincosTest_in : STD_LOGIC_VECTOR (31 downto 0);
    signal aip1E_uid274_sincosTest_b : STD_LOGIC_VECTOR (31 downto 0);
    signal xMSB_uid275_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signOfSelectionSignal_uid277_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid280_sincosTest_b : STD_LOGIC_VECTOR (55 downto 0);
    signal twoToMiSiYip_uid281_sincosTest_b : STD_LOGIC_VECTOR (55 downto 0);
    signal cstArcTan2Mi_15_uid282_sincosTest_q : STD_LOGIC_VECTOR (29 downto 0);
    signal xip1E_16_uid284_sincosTest_a : STD_LOGIC_VECTOR (72 downto 0);
    signal xip1E_16_uid284_sincosTest_b : STD_LOGIC_VECTOR (72 downto 0);
    signal xip1E_16_uid284_sincosTest_o : STD_LOGIC_VECTOR (72 downto 0);
    signal xip1E_16_uid284_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_16_uid284_sincosTest_q : STD_LOGIC_VECTOR (71 downto 0);
    signal yip1E_16_uid285_sincosTest_a : STD_LOGIC_VECTOR (72 downto 0);
    signal yip1E_16_uid285_sincosTest_b : STD_LOGIC_VECTOR (72 downto 0);
    signal yip1E_16_uid285_sincosTest_o : STD_LOGIC_VECTOR (72 downto 0);
    signal yip1E_16_uid285_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_16_uid285_sincosTest_q : STD_LOGIC_VECTOR (71 downto 0);
    signal lowRangeA_uid287_sincosTest_in : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeA_uid287_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal highABits_uid288_sincosTest_b : STD_LOGIC_VECTOR (30 downto 0);
    signal aip1E_16high_uid289_sincosTest_a : STD_LOGIC_VECTOR (32 downto 0);
    signal aip1E_16high_uid289_sincosTest_b : STD_LOGIC_VECTOR (32 downto 0);
    signal aip1E_16high_uid289_sincosTest_o : STD_LOGIC_VECTOR (32 downto 0);
    signal aip1E_16high_uid289_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_16high_uid289_sincosTest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal aip1E_16_uid290_sincosTest_q : STD_LOGIC_VECTOR (32 downto 0);
    signal xip1_16_uid291_sincosTest_in : STD_LOGIC_VECTOR (70 downto 0);
    signal xip1_16_uid291_sincosTest_b : STD_LOGIC_VECTOR (70 downto 0);
    signal yip1_16_uid292_sincosTest_in : STD_LOGIC_VECTOR (70 downto 0);
    signal yip1_16_uid292_sincosTest_b : STD_LOGIC_VECTOR (70 downto 0);
    signal aip1E_uid293_sincosTest_in : STD_LOGIC_VECTOR (30 downto 0);
    signal aip1E_uid293_sincosTest_b : STD_LOGIC_VECTOR (30 downto 0);
    signal xMSB_uid294_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signOfSelectionSignal_uid296_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid299_sincosTest_b : STD_LOGIC_VECTOR (54 downto 0);
    signal twoToMiSiYip_uid300_sincosTest_b : STD_LOGIC_VECTOR (54 downto 0);
    signal cstArcTan2Mi_16_uid301_sincosTest_q : STD_LOGIC_VECTOR (28 downto 0);
    signal xip1E_17_uid303_sincosTest_a : STD_LOGIC_VECTOR (72 downto 0);
    signal xip1E_17_uid303_sincosTest_b : STD_LOGIC_VECTOR (72 downto 0);
    signal xip1E_17_uid303_sincosTest_o : STD_LOGIC_VECTOR (72 downto 0);
    signal xip1E_17_uid303_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_17_uid303_sincosTest_q : STD_LOGIC_VECTOR (71 downto 0);
    signal yip1E_17_uid304_sincosTest_a : STD_LOGIC_VECTOR (72 downto 0);
    signal yip1E_17_uid304_sincosTest_b : STD_LOGIC_VECTOR (72 downto 0);
    signal yip1E_17_uid304_sincosTest_o : STD_LOGIC_VECTOR (72 downto 0);
    signal yip1E_17_uid304_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_17_uid304_sincosTest_q : STD_LOGIC_VECTOR (71 downto 0);
    signal lowRangeA_uid306_sincosTest_in : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeA_uid306_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal highABits_uid307_sincosTest_b : STD_LOGIC_VECTOR (29 downto 0);
    signal aip1E_17high_uid308_sincosTest_a : STD_LOGIC_VECTOR (31 downto 0);
    signal aip1E_17high_uid308_sincosTest_b : STD_LOGIC_VECTOR (31 downto 0);
    signal aip1E_17high_uid308_sincosTest_o : STD_LOGIC_VECTOR (31 downto 0);
    signal aip1E_17high_uid308_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_17high_uid308_sincosTest_q : STD_LOGIC_VECTOR (30 downto 0);
    signal aip1E_17_uid309_sincosTest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal xip1_17_uid310_sincosTest_in : STD_LOGIC_VECTOR (70 downto 0);
    signal xip1_17_uid310_sincosTest_b : STD_LOGIC_VECTOR (70 downto 0);
    signal yip1_17_uid311_sincosTest_in : STD_LOGIC_VECTOR (70 downto 0);
    signal yip1_17_uid311_sincosTest_b : STD_LOGIC_VECTOR (70 downto 0);
    signal aip1E_uid312_sincosTest_in : STD_LOGIC_VECTOR (29 downto 0);
    signal aip1E_uid312_sincosTest_b : STD_LOGIC_VECTOR (29 downto 0);
    signal xMSB_uid313_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signOfSelectionSignal_uid315_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid318_sincosTest_b : STD_LOGIC_VECTOR (53 downto 0);
    signal twoToMiSiYip_uid319_sincosTest_b : STD_LOGIC_VECTOR (53 downto 0);
    signal cstArcTan2Mi_17_uid320_sincosTest_q : STD_LOGIC_VECTOR (27 downto 0);
    signal xip1E_18_uid322_sincosTest_a : STD_LOGIC_VECTOR (72 downto 0);
    signal xip1E_18_uid322_sincosTest_b : STD_LOGIC_VECTOR (72 downto 0);
    signal xip1E_18_uid322_sincosTest_o : STD_LOGIC_VECTOR (72 downto 0);
    signal xip1E_18_uid322_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_18_uid322_sincosTest_q : STD_LOGIC_VECTOR (71 downto 0);
    signal yip1E_18_uid323_sincosTest_a : STD_LOGIC_VECTOR (72 downto 0);
    signal yip1E_18_uid323_sincosTest_b : STD_LOGIC_VECTOR (72 downto 0);
    signal yip1E_18_uid323_sincosTest_o : STD_LOGIC_VECTOR (72 downto 0);
    signal yip1E_18_uid323_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_18_uid323_sincosTest_q : STD_LOGIC_VECTOR (71 downto 0);
    signal lowRangeA_uid325_sincosTest_in : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeA_uid325_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal highABits_uid326_sincosTest_b : STD_LOGIC_VECTOR (28 downto 0);
    signal aip1E_18high_uid327_sincosTest_a : STD_LOGIC_VECTOR (30 downto 0);
    signal aip1E_18high_uid327_sincosTest_b : STD_LOGIC_VECTOR (30 downto 0);
    signal aip1E_18high_uid327_sincosTest_o : STD_LOGIC_VECTOR (30 downto 0);
    signal aip1E_18high_uid327_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_18high_uid327_sincosTest_q : STD_LOGIC_VECTOR (29 downto 0);
    signal aip1E_18_uid328_sincosTest_q : STD_LOGIC_VECTOR (30 downto 0);
    signal xip1_18_uid329_sincosTest_in : STD_LOGIC_VECTOR (70 downto 0);
    signal xip1_18_uid329_sincosTest_b : STD_LOGIC_VECTOR (70 downto 0);
    signal yip1_18_uid330_sincosTest_in : STD_LOGIC_VECTOR (70 downto 0);
    signal yip1_18_uid330_sincosTest_b : STD_LOGIC_VECTOR (70 downto 0);
    signal aip1E_uid331_sincosTest_in : STD_LOGIC_VECTOR (28 downto 0);
    signal aip1E_uid331_sincosTest_b : STD_LOGIC_VECTOR (28 downto 0);
    signal xMSB_uid332_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signOfSelectionSignal_uid334_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid337_sincosTest_b : STD_LOGIC_VECTOR (52 downto 0);
    signal twoToMiSiYip_uid338_sincosTest_b : STD_LOGIC_VECTOR (52 downto 0);
    signal cstArcTan2Mi_18_uid339_sincosTest_q : STD_LOGIC_VECTOR (26 downto 0);
    signal xip1E_19_uid341_sincosTest_a : STD_LOGIC_VECTOR (72 downto 0);
    signal xip1E_19_uid341_sincosTest_b : STD_LOGIC_VECTOR (72 downto 0);
    signal xip1E_19_uid341_sincosTest_o : STD_LOGIC_VECTOR (72 downto 0);
    signal xip1E_19_uid341_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_19_uid341_sincosTest_q : STD_LOGIC_VECTOR (71 downto 0);
    signal yip1E_19_uid342_sincosTest_a : STD_LOGIC_VECTOR (72 downto 0);
    signal yip1E_19_uid342_sincosTest_b : STD_LOGIC_VECTOR (72 downto 0);
    signal yip1E_19_uid342_sincosTest_o : STD_LOGIC_VECTOR (72 downto 0);
    signal yip1E_19_uid342_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_19_uid342_sincosTest_q : STD_LOGIC_VECTOR (71 downto 0);
    signal lowRangeA_uid344_sincosTest_in : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeA_uid344_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal highABits_uid345_sincosTest_b : STD_LOGIC_VECTOR (27 downto 0);
    signal aip1E_19high_uid346_sincosTest_a : STD_LOGIC_VECTOR (29 downto 0);
    signal aip1E_19high_uid346_sincosTest_b : STD_LOGIC_VECTOR (29 downto 0);
    signal aip1E_19high_uid346_sincosTest_o : STD_LOGIC_VECTOR (29 downto 0);
    signal aip1E_19high_uid346_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_19high_uid346_sincosTest_q : STD_LOGIC_VECTOR (28 downto 0);
    signal aip1E_19_uid347_sincosTest_q : STD_LOGIC_VECTOR (29 downto 0);
    signal xip1_19_uid348_sincosTest_in : STD_LOGIC_VECTOR (70 downto 0);
    signal xip1_19_uid348_sincosTest_b : STD_LOGIC_VECTOR (70 downto 0);
    signal yip1_19_uid349_sincosTest_in : STD_LOGIC_VECTOR (70 downto 0);
    signal yip1_19_uid349_sincosTest_b : STD_LOGIC_VECTOR (70 downto 0);
    signal aip1E_uid350_sincosTest_in : STD_LOGIC_VECTOR (27 downto 0);
    signal aip1E_uid350_sincosTest_b : STD_LOGIC_VECTOR (27 downto 0);
    signal xMSB_uid351_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signOfSelectionSignal_uid353_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid356_sincosTest_b : STD_LOGIC_VECTOR (51 downto 0);
    signal twoToMiSiYip_uid357_sincosTest_b : STD_LOGIC_VECTOR (51 downto 0);
    signal cstArcTan2Mi_19_uid358_sincosTest_q : STD_LOGIC_VECTOR (25 downto 0);
    signal xip1E_20_uid360_sincosTest_a : STD_LOGIC_VECTOR (72 downto 0);
    signal xip1E_20_uid360_sincosTest_b : STD_LOGIC_VECTOR (72 downto 0);
    signal xip1E_20_uid360_sincosTest_o : STD_LOGIC_VECTOR (72 downto 0);
    signal xip1E_20_uid360_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_20_uid360_sincosTest_q : STD_LOGIC_VECTOR (71 downto 0);
    signal yip1E_20_uid361_sincosTest_a : STD_LOGIC_VECTOR (72 downto 0);
    signal yip1E_20_uid361_sincosTest_b : STD_LOGIC_VECTOR (72 downto 0);
    signal yip1E_20_uid361_sincosTest_o : STD_LOGIC_VECTOR (72 downto 0);
    signal yip1E_20_uid361_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_20_uid361_sincosTest_q : STD_LOGIC_VECTOR (71 downto 0);
    signal lowRangeA_uid363_sincosTest_in : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeA_uid363_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal highABits_uid364_sincosTest_b : STD_LOGIC_VECTOR (26 downto 0);
    signal aip1E_20high_uid365_sincosTest_a : STD_LOGIC_VECTOR (28 downto 0);
    signal aip1E_20high_uid365_sincosTest_b : STD_LOGIC_VECTOR (28 downto 0);
    signal aip1E_20high_uid365_sincosTest_o : STD_LOGIC_VECTOR (28 downto 0);
    signal aip1E_20high_uid365_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_20high_uid365_sincosTest_q : STD_LOGIC_VECTOR (27 downto 0);
    signal aip1E_20_uid366_sincosTest_q : STD_LOGIC_VECTOR (28 downto 0);
    signal xip1_20_uid367_sincosTest_in : STD_LOGIC_VECTOR (70 downto 0);
    signal xip1_20_uid367_sincosTest_b : STD_LOGIC_VECTOR (70 downto 0);
    signal yip1_20_uid368_sincosTest_in : STD_LOGIC_VECTOR (70 downto 0);
    signal yip1_20_uid368_sincosTest_b : STD_LOGIC_VECTOR (70 downto 0);
    signal aip1E_uid369_sincosTest_in : STD_LOGIC_VECTOR (26 downto 0);
    signal aip1E_uid369_sincosTest_b : STD_LOGIC_VECTOR (26 downto 0);
    signal xMSB_uid370_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signOfSelectionSignal_uid372_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid375_sincosTest_b : STD_LOGIC_VECTOR (50 downto 0);
    signal twoToMiSiYip_uid376_sincosTest_b : STD_LOGIC_VECTOR (50 downto 0);
    signal cstArcTan2Mi_20_uid377_sincosTest_q : STD_LOGIC_VECTOR (24 downto 0);
    signal xip1E_21_uid379_sincosTest_a : STD_LOGIC_VECTOR (72 downto 0);
    signal xip1E_21_uid379_sincosTest_b : STD_LOGIC_VECTOR (72 downto 0);
    signal xip1E_21_uid379_sincosTest_o : STD_LOGIC_VECTOR (72 downto 0);
    signal xip1E_21_uid379_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_21_uid379_sincosTest_q : STD_LOGIC_VECTOR (71 downto 0);
    signal yip1E_21_uid380_sincosTest_a : STD_LOGIC_VECTOR (72 downto 0);
    signal yip1E_21_uid380_sincosTest_b : STD_LOGIC_VECTOR (72 downto 0);
    signal yip1E_21_uid380_sincosTest_o : STD_LOGIC_VECTOR (72 downto 0);
    signal yip1E_21_uid380_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_21_uid380_sincosTest_q : STD_LOGIC_VECTOR (71 downto 0);
    signal lowRangeA_uid382_sincosTest_in : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeA_uid382_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal highABits_uid383_sincosTest_b : STD_LOGIC_VECTOR (25 downto 0);
    signal aip1E_21high_uid384_sincosTest_a : STD_LOGIC_VECTOR (27 downto 0);
    signal aip1E_21high_uid384_sincosTest_b : STD_LOGIC_VECTOR (27 downto 0);
    signal aip1E_21high_uid384_sincosTest_o : STD_LOGIC_VECTOR (27 downto 0);
    signal aip1E_21high_uid384_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_21high_uid384_sincosTest_q : STD_LOGIC_VECTOR (26 downto 0);
    signal aip1E_21_uid385_sincosTest_q : STD_LOGIC_VECTOR (27 downto 0);
    signal xip1_21_uid386_sincosTest_in : STD_LOGIC_VECTOR (70 downto 0);
    signal xip1_21_uid386_sincosTest_b : STD_LOGIC_VECTOR (70 downto 0);
    signal yip1_21_uid387_sincosTest_in : STD_LOGIC_VECTOR (70 downto 0);
    signal yip1_21_uid387_sincosTest_b : STD_LOGIC_VECTOR (70 downto 0);
    signal aip1E_uid388_sincosTest_in : STD_LOGIC_VECTOR (25 downto 0);
    signal aip1E_uid388_sincosTest_b : STD_LOGIC_VECTOR (25 downto 0);
    signal xMSB_uid389_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signOfSelectionSignal_uid391_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid394_sincosTest_b : STD_LOGIC_VECTOR (49 downto 0);
    signal twoToMiSiYip_uid395_sincosTest_b : STD_LOGIC_VECTOR (49 downto 0);
    signal cstArcTan2Mi_21_uid396_sincosTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal xip1E_22_uid398_sincosTest_a : STD_LOGIC_VECTOR (72 downto 0);
    signal xip1E_22_uid398_sincosTest_b : STD_LOGIC_VECTOR (72 downto 0);
    signal xip1E_22_uid398_sincosTest_o : STD_LOGIC_VECTOR (72 downto 0);
    signal xip1E_22_uid398_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_22_uid398_sincosTest_q : STD_LOGIC_VECTOR (71 downto 0);
    signal yip1E_22_uid399_sincosTest_a : STD_LOGIC_VECTOR (72 downto 0);
    signal yip1E_22_uid399_sincosTest_b : STD_LOGIC_VECTOR (72 downto 0);
    signal yip1E_22_uid399_sincosTest_o : STD_LOGIC_VECTOR (72 downto 0);
    signal yip1E_22_uid399_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_22_uid399_sincosTest_q : STD_LOGIC_VECTOR (71 downto 0);
    signal lowRangeA_uid401_sincosTest_in : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeA_uid401_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal highABits_uid402_sincosTest_b : STD_LOGIC_VECTOR (24 downto 0);
    signal aip1E_22high_uid403_sincosTest_a : STD_LOGIC_VECTOR (26 downto 0);
    signal aip1E_22high_uid403_sincosTest_b : STD_LOGIC_VECTOR (26 downto 0);
    signal aip1E_22high_uid403_sincosTest_o : STD_LOGIC_VECTOR (26 downto 0);
    signal aip1E_22high_uid403_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_22high_uid403_sincosTest_q : STD_LOGIC_VECTOR (25 downto 0);
    signal aip1E_22_uid404_sincosTest_q : STD_LOGIC_VECTOR (26 downto 0);
    signal xip1_22_uid405_sincosTest_in : STD_LOGIC_VECTOR (70 downto 0);
    signal xip1_22_uid405_sincosTest_b : STD_LOGIC_VECTOR (70 downto 0);
    signal yip1_22_uid406_sincosTest_in : STD_LOGIC_VECTOR (70 downto 0);
    signal yip1_22_uid406_sincosTest_b : STD_LOGIC_VECTOR (70 downto 0);
    signal aip1E_uid407_sincosTest_in : STD_LOGIC_VECTOR (24 downto 0);
    signal aip1E_uid407_sincosTest_b : STD_LOGIC_VECTOR (24 downto 0);
    signal xMSB_uid408_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signOfSelectionSignal_uid410_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid413_sincosTest_b : STD_LOGIC_VECTOR (48 downto 0);
    signal twoToMiSiYip_uid414_sincosTest_b : STD_LOGIC_VECTOR (48 downto 0);
    signal cstArcTan2Mi_22_uid415_sincosTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal xip1E_23_uid417_sincosTest_a : STD_LOGIC_VECTOR (72 downto 0);
    signal xip1E_23_uid417_sincosTest_b : STD_LOGIC_VECTOR (72 downto 0);
    signal xip1E_23_uid417_sincosTest_o : STD_LOGIC_VECTOR (72 downto 0);
    signal xip1E_23_uid417_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_23_uid417_sincosTest_q : STD_LOGIC_VECTOR (71 downto 0);
    signal yip1E_23_uid418_sincosTest_a : STD_LOGIC_VECTOR (72 downto 0);
    signal yip1E_23_uid418_sincosTest_b : STD_LOGIC_VECTOR (72 downto 0);
    signal yip1E_23_uid418_sincosTest_o : STD_LOGIC_VECTOR (72 downto 0);
    signal yip1E_23_uid418_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_23_uid418_sincosTest_q : STD_LOGIC_VECTOR (71 downto 0);
    signal lowRangeA_uid420_sincosTest_in : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeA_uid420_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal highABits_uid421_sincosTest_b : STD_LOGIC_VECTOR (23 downto 0);
    signal aip1E_23high_uid422_sincosTest_a : STD_LOGIC_VECTOR (25 downto 0);
    signal aip1E_23high_uid422_sincosTest_b : STD_LOGIC_VECTOR (25 downto 0);
    signal aip1E_23high_uid422_sincosTest_o : STD_LOGIC_VECTOR (25 downto 0);
    signal aip1E_23high_uid422_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_23high_uid422_sincosTest_q : STD_LOGIC_VECTOR (24 downto 0);
    signal aip1E_23_uid423_sincosTest_q : STD_LOGIC_VECTOR (25 downto 0);
    signal xip1_23_uid424_sincosTest_in : STD_LOGIC_VECTOR (70 downto 0);
    signal xip1_23_uid424_sincosTest_b : STD_LOGIC_VECTOR (70 downto 0);
    signal yip1_23_uid425_sincosTest_in : STD_LOGIC_VECTOR (70 downto 0);
    signal yip1_23_uid425_sincosTest_b : STD_LOGIC_VECTOR (70 downto 0);
    signal aip1E_uid426_sincosTest_in : STD_LOGIC_VECTOR (23 downto 0);
    signal aip1E_uid426_sincosTest_b : STD_LOGIC_VECTOR (23 downto 0);
    signal xMSB_uid427_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signOfSelectionSignal_uid429_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid432_sincosTest_b : STD_LOGIC_VECTOR (47 downto 0);
    signal twoToMiSiYip_uid433_sincosTest_b : STD_LOGIC_VECTOR (47 downto 0);
    signal cstArcTan2Mi_23_uid434_sincosTest_q : STD_LOGIC_VECTOR (21 downto 0);
    signal xip1E_24_uid436_sincosTest_a : STD_LOGIC_VECTOR (72 downto 0);
    signal xip1E_24_uid436_sincosTest_b : STD_LOGIC_VECTOR (72 downto 0);
    signal xip1E_24_uid436_sincosTest_o : STD_LOGIC_VECTOR (72 downto 0);
    signal xip1E_24_uid436_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_24_uid436_sincosTest_q : STD_LOGIC_VECTOR (71 downto 0);
    signal yip1E_24_uid437_sincosTest_a : STD_LOGIC_VECTOR (72 downto 0);
    signal yip1E_24_uid437_sincosTest_b : STD_LOGIC_VECTOR (72 downto 0);
    signal yip1E_24_uid437_sincosTest_o : STD_LOGIC_VECTOR (72 downto 0);
    signal yip1E_24_uid437_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_24_uid437_sincosTest_q : STD_LOGIC_VECTOR (71 downto 0);
    signal lowRangeA_uid439_sincosTest_in : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeA_uid439_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal highABits_uid440_sincosTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal aip1E_24high_uid441_sincosTest_a : STD_LOGIC_VECTOR (24 downto 0);
    signal aip1E_24high_uid441_sincosTest_b : STD_LOGIC_VECTOR (24 downto 0);
    signal aip1E_24high_uid441_sincosTest_o : STD_LOGIC_VECTOR (24 downto 0);
    signal aip1E_24high_uid441_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_24high_uid441_sincosTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal aip1E_24_uid442_sincosTest_q : STD_LOGIC_VECTOR (24 downto 0);
    signal xip1_24_uid443_sincosTest_in : STD_LOGIC_VECTOR (70 downto 0);
    signal xip1_24_uid443_sincosTest_b : STD_LOGIC_VECTOR (70 downto 0);
    signal yip1_24_uid444_sincosTest_in : STD_LOGIC_VECTOR (70 downto 0);
    signal yip1_24_uid444_sincosTest_b : STD_LOGIC_VECTOR (70 downto 0);
    signal aip1E_uid445_sincosTest_in : STD_LOGIC_VECTOR (22 downto 0);
    signal aip1E_uid445_sincosTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal xMSB_uid446_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signOfSelectionSignal_uid448_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid451_sincosTest_b : STD_LOGIC_VECTOR (46 downto 0);
    signal twoToMiSiYip_uid452_sincosTest_b : STD_LOGIC_VECTOR (46 downto 0);
    signal cstArcTan2Mi_24_uid453_sincosTest_q : STD_LOGIC_VECTOR (20 downto 0);
    signal xip1E_25_uid455_sincosTest_a : STD_LOGIC_VECTOR (72 downto 0);
    signal xip1E_25_uid455_sincosTest_b : STD_LOGIC_VECTOR (72 downto 0);
    signal xip1E_25_uid455_sincosTest_o : STD_LOGIC_VECTOR (72 downto 0);
    signal xip1E_25_uid455_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_25_uid455_sincosTest_q : STD_LOGIC_VECTOR (71 downto 0);
    signal yip1E_25_uid456_sincosTest_a : STD_LOGIC_VECTOR (72 downto 0);
    signal yip1E_25_uid456_sincosTest_b : STD_LOGIC_VECTOR (72 downto 0);
    signal yip1E_25_uid456_sincosTest_o : STD_LOGIC_VECTOR (72 downto 0);
    signal yip1E_25_uid456_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_25_uid456_sincosTest_q : STD_LOGIC_VECTOR (71 downto 0);
    signal lowRangeA_uid458_sincosTest_in : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeA_uid458_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal highABits_uid459_sincosTest_b : STD_LOGIC_VECTOR (21 downto 0);
    signal aip1E_25high_uid460_sincosTest_a : STD_LOGIC_VECTOR (23 downto 0);
    signal aip1E_25high_uid460_sincosTest_b : STD_LOGIC_VECTOR (23 downto 0);
    signal aip1E_25high_uid460_sincosTest_o : STD_LOGIC_VECTOR (23 downto 0);
    signal aip1E_25high_uid460_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_25high_uid460_sincosTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal aip1E_25_uid461_sincosTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal xip1_25_uid462_sincosTest_in : STD_LOGIC_VECTOR (70 downto 0);
    signal xip1_25_uid462_sincosTest_b : STD_LOGIC_VECTOR (70 downto 0);
    signal yip1_25_uid463_sincosTest_in : STD_LOGIC_VECTOR (70 downto 0);
    signal yip1_25_uid463_sincosTest_b : STD_LOGIC_VECTOR (70 downto 0);
    signal aip1E_uid464_sincosTest_in : STD_LOGIC_VECTOR (21 downto 0);
    signal aip1E_uid464_sincosTest_b : STD_LOGIC_VECTOR (21 downto 0);
    signal xMSB_uid465_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signOfSelectionSignal_uid467_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid470_sincosTest_b : STD_LOGIC_VECTOR (45 downto 0);
    signal twoToMiSiYip_uid471_sincosTest_b : STD_LOGIC_VECTOR (45 downto 0);
    signal cstArcTan2Mi_25_uid472_sincosTest_q : STD_LOGIC_VECTOR (19 downto 0);
    signal xip1E_26_uid474_sincosTest_a : STD_LOGIC_VECTOR (72 downto 0);
    signal xip1E_26_uid474_sincosTest_b : STD_LOGIC_VECTOR (72 downto 0);
    signal xip1E_26_uid474_sincosTest_o : STD_LOGIC_VECTOR (72 downto 0);
    signal xip1E_26_uid474_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_26_uid474_sincosTest_q : STD_LOGIC_VECTOR (71 downto 0);
    signal yip1E_26_uid475_sincosTest_a : STD_LOGIC_VECTOR (72 downto 0);
    signal yip1E_26_uid475_sincosTest_b : STD_LOGIC_VECTOR (72 downto 0);
    signal yip1E_26_uid475_sincosTest_o : STD_LOGIC_VECTOR (72 downto 0);
    signal yip1E_26_uid475_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_26_uid475_sincosTest_q : STD_LOGIC_VECTOR (71 downto 0);
    signal lowRangeA_uid477_sincosTest_in : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeA_uid477_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal highABits_uid478_sincosTest_b : STD_LOGIC_VECTOR (20 downto 0);
    signal aip1E_26high_uid479_sincosTest_a : STD_LOGIC_VECTOR (22 downto 0);
    signal aip1E_26high_uid479_sincosTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal aip1E_26high_uid479_sincosTest_o : STD_LOGIC_VECTOR (22 downto 0);
    signal aip1E_26high_uid479_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_26high_uid479_sincosTest_q : STD_LOGIC_VECTOR (21 downto 0);
    signal aip1E_26_uid480_sincosTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal xip1_26_uid481_sincosTest_in : STD_LOGIC_VECTOR (70 downto 0);
    signal xip1_26_uid481_sincosTest_b : STD_LOGIC_VECTOR (70 downto 0);
    signal yip1_26_uid482_sincosTest_in : STD_LOGIC_VECTOR (70 downto 0);
    signal yip1_26_uid482_sincosTest_b : STD_LOGIC_VECTOR (70 downto 0);
    signal aip1E_uid483_sincosTest_in : STD_LOGIC_VECTOR (20 downto 0);
    signal aip1E_uid483_sincosTest_b : STD_LOGIC_VECTOR (20 downto 0);
    signal xMSB_uid484_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signOfSelectionSignal_uid486_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid489_sincosTest_b : STD_LOGIC_VECTOR (44 downto 0);
    signal twoToMiSiYip_uid490_sincosTest_b : STD_LOGIC_VECTOR (44 downto 0);
    signal cstArcTan2Mi_26_uid491_sincosTest_q : STD_LOGIC_VECTOR (18 downto 0);
    signal xip1E_27_uid493_sincosTest_a : STD_LOGIC_VECTOR (72 downto 0);
    signal xip1E_27_uid493_sincosTest_b : STD_LOGIC_VECTOR (72 downto 0);
    signal xip1E_27_uid493_sincosTest_o : STD_LOGIC_VECTOR (72 downto 0);
    signal xip1E_27_uid493_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_27_uid493_sincosTest_q : STD_LOGIC_VECTOR (71 downto 0);
    signal yip1E_27_uid494_sincosTest_a : STD_LOGIC_VECTOR (72 downto 0);
    signal yip1E_27_uid494_sincosTest_b : STD_LOGIC_VECTOR (72 downto 0);
    signal yip1E_27_uid494_sincosTest_o : STD_LOGIC_VECTOR (72 downto 0);
    signal yip1E_27_uid494_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_27_uid494_sincosTest_q : STD_LOGIC_VECTOR (71 downto 0);
    signal lowRangeA_uid496_sincosTest_in : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeA_uid496_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal highABits_uid497_sincosTest_b : STD_LOGIC_VECTOR (19 downto 0);
    signal aip1E_27high_uid498_sincosTest_a : STD_LOGIC_VECTOR (21 downto 0);
    signal aip1E_27high_uid498_sincosTest_b : STD_LOGIC_VECTOR (21 downto 0);
    signal aip1E_27high_uid498_sincosTest_o : STD_LOGIC_VECTOR (21 downto 0);
    signal aip1E_27high_uid498_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_27high_uid498_sincosTest_q : STD_LOGIC_VECTOR (20 downto 0);
    signal aip1E_27_uid499_sincosTest_q : STD_LOGIC_VECTOR (21 downto 0);
    signal xip1_27_uid500_sincosTest_in : STD_LOGIC_VECTOR (70 downto 0);
    signal xip1_27_uid500_sincosTest_b : STD_LOGIC_VECTOR (70 downto 0);
    signal yip1_27_uid501_sincosTest_in : STD_LOGIC_VECTOR (70 downto 0);
    signal yip1_27_uid501_sincosTest_b : STD_LOGIC_VECTOR (70 downto 0);
    signal aip1E_uid502_sincosTest_in : STD_LOGIC_VECTOR (19 downto 0);
    signal aip1E_uid502_sincosTest_b : STD_LOGIC_VECTOR (19 downto 0);
    signal xMSB_uid503_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signOfSelectionSignal_uid505_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid508_sincosTest_b : STD_LOGIC_VECTOR (43 downto 0);
    signal twoToMiSiYip_uid509_sincosTest_b : STD_LOGIC_VECTOR (43 downto 0);
    signal cstArcTan2Mi_27_uid510_sincosTest_q : STD_LOGIC_VECTOR (17 downto 0);
    signal xip1E_28_uid512_sincosTest_a : STD_LOGIC_VECTOR (72 downto 0);
    signal xip1E_28_uid512_sincosTest_b : STD_LOGIC_VECTOR (72 downto 0);
    signal xip1E_28_uid512_sincosTest_o : STD_LOGIC_VECTOR (72 downto 0);
    signal xip1E_28_uid512_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_28_uid512_sincosTest_q : STD_LOGIC_VECTOR (71 downto 0);
    signal yip1E_28_uid513_sincosTest_a : STD_LOGIC_VECTOR (72 downto 0);
    signal yip1E_28_uid513_sincosTest_b : STD_LOGIC_VECTOR (72 downto 0);
    signal yip1E_28_uid513_sincosTest_o : STD_LOGIC_VECTOR (72 downto 0);
    signal yip1E_28_uid513_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_28_uid513_sincosTest_q : STD_LOGIC_VECTOR (71 downto 0);
    signal lowRangeA_uid515_sincosTest_in : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeA_uid515_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal highABits_uid516_sincosTest_b : STD_LOGIC_VECTOR (18 downto 0);
    signal aip1E_28high_uid517_sincosTest_a : STD_LOGIC_VECTOR (20 downto 0);
    signal aip1E_28high_uid517_sincosTest_b : STD_LOGIC_VECTOR (20 downto 0);
    signal aip1E_28high_uid517_sincosTest_o : STD_LOGIC_VECTOR (20 downto 0);
    signal aip1E_28high_uid517_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_28high_uid517_sincosTest_q : STD_LOGIC_VECTOR (19 downto 0);
    signal aip1E_28_uid518_sincosTest_q : STD_LOGIC_VECTOR (20 downto 0);
    signal xip1_28_uid519_sincosTest_in : STD_LOGIC_VECTOR (70 downto 0);
    signal xip1_28_uid519_sincosTest_b : STD_LOGIC_VECTOR (70 downto 0);
    signal yip1_28_uid520_sincosTest_in : STD_LOGIC_VECTOR (70 downto 0);
    signal yip1_28_uid520_sincosTest_b : STD_LOGIC_VECTOR (70 downto 0);
    signal aip1E_uid521_sincosTest_in : STD_LOGIC_VECTOR (18 downto 0);
    signal aip1E_uid521_sincosTest_b : STD_LOGIC_VECTOR (18 downto 0);
    signal xMSB_uid522_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signOfSelectionSignal_uid524_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid527_sincosTest_b : STD_LOGIC_VECTOR (42 downto 0);
    signal twoToMiSiYip_uid528_sincosTest_b : STD_LOGIC_VECTOR (42 downto 0);
    signal cstArcTan2Mi_28_uid529_sincosTest_q : STD_LOGIC_VECTOR (16 downto 0);
    signal xip1E_29_uid531_sincosTest_a : STD_LOGIC_VECTOR (72 downto 0);
    signal xip1E_29_uid531_sincosTest_b : STD_LOGIC_VECTOR (72 downto 0);
    signal xip1E_29_uid531_sincosTest_o : STD_LOGIC_VECTOR (72 downto 0);
    signal xip1E_29_uid531_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_29_uid531_sincosTest_q : STD_LOGIC_VECTOR (71 downto 0);
    signal yip1E_29_uid532_sincosTest_a : STD_LOGIC_VECTOR (72 downto 0);
    signal yip1E_29_uid532_sincosTest_b : STD_LOGIC_VECTOR (72 downto 0);
    signal yip1E_29_uid532_sincosTest_o : STD_LOGIC_VECTOR (72 downto 0);
    signal yip1E_29_uid532_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_29_uid532_sincosTest_q : STD_LOGIC_VECTOR (71 downto 0);
    signal lowRangeA_uid534_sincosTest_in : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeA_uid534_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal highABits_uid535_sincosTest_b : STD_LOGIC_VECTOR (17 downto 0);
    signal aip1E_29high_uid536_sincosTest_a : STD_LOGIC_VECTOR (19 downto 0);
    signal aip1E_29high_uid536_sincosTest_b : STD_LOGIC_VECTOR (19 downto 0);
    signal aip1E_29high_uid536_sincosTest_o : STD_LOGIC_VECTOR (19 downto 0);
    signal aip1E_29high_uid536_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_29high_uid536_sincosTest_q : STD_LOGIC_VECTOR (18 downto 0);
    signal aip1E_29_uid537_sincosTest_q : STD_LOGIC_VECTOR (19 downto 0);
    signal xip1_29_uid538_sincosTest_in : STD_LOGIC_VECTOR (70 downto 0);
    signal xip1_29_uid538_sincosTest_b : STD_LOGIC_VECTOR (70 downto 0);
    signal yip1_29_uid539_sincosTest_in : STD_LOGIC_VECTOR (70 downto 0);
    signal yip1_29_uid539_sincosTest_b : STD_LOGIC_VECTOR (70 downto 0);
    signal aip1E_uid540_sincosTest_in : STD_LOGIC_VECTOR (17 downto 0);
    signal aip1E_uid540_sincosTest_b : STD_LOGIC_VECTOR (17 downto 0);
    signal xMSB_uid541_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signOfSelectionSignal_uid543_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid546_sincosTest_b : STD_LOGIC_VECTOR (41 downto 0);
    signal twoToMiSiYip_uid547_sincosTest_b : STD_LOGIC_VECTOR (41 downto 0);
    signal cstArcTan2Mi_29_uid548_sincosTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal xip1E_30_uid550_sincosTest_a : STD_LOGIC_VECTOR (72 downto 0);
    signal xip1E_30_uid550_sincosTest_b : STD_LOGIC_VECTOR (72 downto 0);
    signal xip1E_30_uid550_sincosTest_o : STD_LOGIC_VECTOR (72 downto 0);
    signal xip1E_30_uid550_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_30_uid550_sincosTest_q : STD_LOGIC_VECTOR (71 downto 0);
    signal yip1E_30_uid551_sincosTest_a : STD_LOGIC_VECTOR (72 downto 0);
    signal yip1E_30_uid551_sincosTest_b : STD_LOGIC_VECTOR (72 downto 0);
    signal yip1E_30_uid551_sincosTest_o : STD_LOGIC_VECTOR (72 downto 0);
    signal yip1E_30_uid551_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_30_uid551_sincosTest_q : STD_LOGIC_VECTOR (71 downto 0);
    signal lowRangeA_uid553_sincosTest_in : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeA_uid553_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal highABits_uid554_sincosTest_b : STD_LOGIC_VECTOR (16 downto 0);
    signal aip1E_30high_uid555_sincosTest_a : STD_LOGIC_VECTOR (18 downto 0);
    signal aip1E_30high_uid555_sincosTest_b : STD_LOGIC_VECTOR (18 downto 0);
    signal aip1E_30high_uid555_sincosTest_o : STD_LOGIC_VECTOR (18 downto 0);
    signal aip1E_30high_uid555_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_30high_uid555_sincosTest_q : STD_LOGIC_VECTOR (17 downto 0);
    signal aip1E_30_uid556_sincosTest_q : STD_LOGIC_VECTOR (18 downto 0);
    signal xip1_30_uid557_sincosTest_in : STD_LOGIC_VECTOR (70 downto 0);
    signal xip1_30_uid557_sincosTest_b : STD_LOGIC_VECTOR (70 downto 0);
    signal yip1_30_uid558_sincosTest_in : STD_LOGIC_VECTOR (70 downto 0);
    signal yip1_30_uid558_sincosTest_b : STD_LOGIC_VECTOR (70 downto 0);
    signal aip1E_uid559_sincosTest_in : STD_LOGIC_VECTOR (16 downto 0);
    signal aip1E_uid559_sincosTest_b : STD_LOGIC_VECTOR (16 downto 0);
    signal xMSB_uid560_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signOfSelectionSignal_uid562_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid565_sincosTest_b : STD_LOGIC_VECTOR (40 downto 0);
    signal twoToMiSiYip_uid566_sincosTest_b : STD_LOGIC_VECTOR (40 downto 0);
    signal cstArcTan2Mi_30_uid567_sincosTest_q : STD_LOGIC_VECTOR (14 downto 0);
    signal xip1E_31_uid569_sincosTest_a : STD_LOGIC_VECTOR (72 downto 0);
    signal xip1E_31_uid569_sincosTest_b : STD_LOGIC_VECTOR (72 downto 0);
    signal xip1E_31_uid569_sincosTest_o : STD_LOGIC_VECTOR (72 downto 0);
    signal xip1E_31_uid569_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_31_uid569_sincosTest_q : STD_LOGIC_VECTOR (71 downto 0);
    signal yip1E_31_uid570_sincosTest_a : STD_LOGIC_VECTOR (72 downto 0);
    signal yip1E_31_uid570_sincosTest_b : STD_LOGIC_VECTOR (72 downto 0);
    signal yip1E_31_uid570_sincosTest_o : STD_LOGIC_VECTOR (72 downto 0);
    signal yip1E_31_uid570_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_31_uid570_sincosTest_q : STD_LOGIC_VECTOR (71 downto 0);
    signal lowRangeA_uid572_sincosTest_in : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeA_uid572_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal highABits_uid573_sincosTest_b : STD_LOGIC_VECTOR (15 downto 0);
    signal aip1E_31high_uid574_sincosTest_a : STD_LOGIC_VECTOR (17 downto 0);
    signal aip1E_31high_uid574_sincosTest_b : STD_LOGIC_VECTOR (17 downto 0);
    signal aip1E_31high_uid574_sincosTest_o : STD_LOGIC_VECTOR (17 downto 0);
    signal aip1E_31high_uid574_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_31high_uid574_sincosTest_q : STD_LOGIC_VECTOR (16 downto 0);
    signal aip1E_31_uid575_sincosTest_q : STD_LOGIC_VECTOR (17 downto 0);
    signal xip1_31_uid576_sincosTest_in : STD_LOGIC_VECTOR (70 downto 0);
    signal xip1_31_uid576_sincosTest_b : STD_LOGIC_VECTOR (70 downto 0);
    signal yip1_31_uid577_sincosTest_in : STD_LOGIC_VECTOR (70 downto 0);
    signal yip1_31_uid577_sincosTest_b : STD_LOGIC_VECTOR (70 downto 0);
    signal aip1E_uid578_sincosTest_in : STD_LOGIC_VECTOR (15 downto 0);
    signal aip1E_uid578_sincosTest_b : STD_LOGIC_VECTOR (15 downto 0);
    signal xMSB_uid579_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signOfSelectionSignal_uid581_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid584_sincosTest_b : STD_LOGIC_VECTOR (39 downto 0);
    signal twoToMiSiYip_uid585_sincosTest_b : STD_LOGIC_VECTOR (39 downto 0);
    signal cstArcTan2Mi_31_uid586_sincosTest_q : STD_LOGIC_VECTOR (13 downto 0);
    signal xip1E_32_uid588_sincosTest_a : STD_LOGIC_VECTOR (72 downto 0);
    signal xip1E_32_uid588_sincosTest_b : STD_LOGIC_VECTOR (72 downto 0);
    signal xip1E_32_uid588_sincosTest_o : STD_LOGIC_VECTOR (72 downto 0);
    signal xip1E_32_uid588_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_32_uid588_sincosTest_q : STD_LOGIC_VECTOR (71 downto 0);
    signal yip1E_32_uid589_sincosTest_a : STD_LOGIC_VECTOR (72 downto 0);
    signal yip1E_32_uid589_sincosTest_b : STD_LOGIC_VECTOR (72 downto 0);
    signal yip1E_32_uid589_sincosTest_o : STD_LOGIC_VECTOR (72 downto 0);
    signal yip1E_32_uid589_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_32_uid589_sincosTest_q : STD_LOGIC_VECTOR (71 downto 0);
    signal lowRangeA_uid591_sincosTest_in : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeA_uid591_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal highABits_uid592_sincosTest_b : STD_LOGIC_VECTOR (14 downto 0);
    signal aip1E_32high_uid593_sincosTest_a : STD_LOGIC_VECTOR (16 downto 0);
    signal aip1E_32high_uid593_sincosTest_b : STD_LOGIC_VECTOR (16 downto 0);
    signal aip1E_32high_uid593_sincosTest_o : STD_LOGIC_VECTOR (16 downto 0);
    signal aip1E_32high_uid593_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_32high_uid593_sincosTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal aip1E_32_uid594_sincosTest_q : STD_LOGIC_VECTOR (16 downto 0);
    signal xip1_32_uid595_sincosTest_in : STD_LOGIC_VECTOR (70 downto 0);
    signal xip1_32_uid595_sincosTest_b : STD_LOGIC_VECTOR (70 downto 0);
    signal yip1_32_uid596_sincosTest_in : STD_LOGIC_VECTOR (70 downto 0);
    signal yip1_32_uid596_sincosTest_b : STD_LOGIC_VECTOR (70 downto 0);
    signal aip1E_uid597_sincosTest_in : STD_LOGIC_VECTOR (14 downto 0);
    signal aip1E_uid597_sincosTest_b : STD_LOGIC_VECTOR (14 downto 0);
    signal xMSB_uid598_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signOfSelectionSignal_uid600_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid603_sincosTest_b : STD_LOGIC_VECTOR (38 downto 0);
    signal twoToMiSiYip_uid604_sincosTest_b : STD_LOGIC_VECTOR (38 downto 0);
    signal cstArcTan2Mi_32_uid605_sincosTest_q : STD_LOGIC_VECTOR (12 downto 0);
    signal xip1E_33_uid607_sincosTest_a : STD_LOGIC_VECTOR (72 downto 0);
    signal xip1E_33_uid607_sincosTest_b : STD_LOGIC_VECTOR (72 downto 0);
    signal xip1E_33_uid607_sincosTest_o : STD_LOGIC_VECTOR (72 downto 0);
    signal xip1E_33_uid607_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_33_uid607_sincosTest_q : STD_LOGIC_VECTOR (71 downto 0);
    signal yip1E_33_uid608_sincosTest_a : STD_LOGIC_VECTOR (72 downto 0);
    signal yip1E_33_uid608_sincosTest_b : STD_LOGIC_VECTOR (72 downto 0);
    signal yip1E_33_uid608_sincosTest_o : STD_LOGIC_VECTOR (72 downto 0);
    signal yip1E_33_uid608_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_33_uid608_sincosTest_q : STD_LOGIC_VECTOR (71 downto 0);
    signal lowRangeA_uid610_sincosTest_in : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeA_uid610_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal highABits_uid611_sincosTest_b : STD_LOGIC_VECTOR (13 downto 0);
    signal aip1E_33high_uid612_sincosTest_a : STD_LOGIC_VECTOR (15 downto 0);
    signal aip1E_33high_uid612_sincosTest_b : STD_LOGIC_VECTOR (15 downto 0);
    signal aip1E_33high_uid612_sincosTest_o : STD_LOGIC_VECTOR (15 downto 0);
    signal aip1E_33high_uid612_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_33high_uid612_sincosTest_q : STD_LOGIC_VECTOR (14 downto 0);
    signal aip1E_33_uid613_sincosTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal xip1_33_uid614_sincosTest_in : STD_LOGIC_VECTOR (70 downto 0);
    signal xip1_33_uid614_sincosTest_b : STD_LOGIC_VECTOR (70 downto 0);
    signal yip1_33_uid615_sincosTest_in : STD_LOGIC_VECTOR (70 downto 0);
    signal yip1_33_uid615_sincosTest_b : STD_LOGIC_VECTOR (70 downto 0);
    signal aip1E_uid616_sincosTest_in : STD_LOGIC_VECTOR (13 downto 0);
    signal aip1E_uid616_sincosTest_b : STD_LOGIC_VECTOR (13 downto 0);
    signal xMSB_uid617_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signOfSelectionSignal_uid619_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid622_sincosTest_b : STD_LOGIC_VECTOR (37 downto 0);
    signal twoToMiSiYip_uid623_sincosTest_b : STD_LOGIC_VECTOR (37 downto 0);
    signal xip1E_34_uid626_sincosTest_a : STD_LOGIC_VECTOR (72 downto 0);
    signal xip1E_34_uid626_sincosTest_b : STD_LOGIC_VECTOR (72 downto 0);
    signal xip1E_34_uid626_sincosTest_o : STD_LOGIC_VECTOR (72 downto 0);
    signal xip1E_34_uid626_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_34_uid626_sincosTest_q : STD_LOGIC_VECTOR (71 downto 0);
    signal yip1E_34_uid627_sincosTest_a : STD_LOGIC_VECTOR (72 downto 0);
    signal yip1E_34_uid627_sincosTest_b : STD_LOGIC_VECTOR (72 downto 0);
    signal yip1E_34_uid627_sincosTest_o : STD_LOGIC_VECTOR (72 downto 0);
    signal yip1E_34_uid627_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_34_uid627_sincosTest_q : STD_LOGIC_VECTOR (71 downto 0);
    signal xip1_34_uid633_sincosTest_in : STD_LOGIC_VECTOR (70 downto 0);
    signal xip1_34_uid633_sincosTest_b : STD_LOGIC_VECTOR (70 downto 0);
    signal yip1_34_uid634_sincosTest_in : STD_LOGIC_VECTOR (70 downto 0);
    signal yip1_34_uid634_sincosTest_b : STD_LOGIC_VECTOR (70 downto 0);
    signal xSumPreRnd_uid636_sincosTest_in : STD_LOGIC_VECTOR (69 downto 0);
    signal xSumPreRnd_uid636_sincosTest_b : STD_LOGIC_VECTOR (34 downto 0);
    signal xSumPostRnd_uid639_sincosTest_a : STD_LOGIC_VECTOR (35 downto 0);
    signal xSumPostRnd_uid639_sincosTest_b : STD_LOGIC_VECTOR (35 downto 0);
    signal xSumPostRnd_uid639_sincosTest_o : STD_LOGIC_VECTOR (35 downto 0);
    signal xSumPostRnd_uid639_sincosTest_q : STD_LOGIC_VECTOR (35 downto 0);
    signal ySumPreRnd_uid640_sincosTest_in : STD_LOGIC_VECTOR (69 downto 0);
    signal ySumPreRnd_uid640_sincosTest_b : STD_LOGIC_VECTOR (34 downto 0);
    signal ySumPostRnd_uid643_sincosTest_a : STD_LOGIC_VECTOR (35 downto 0);
    signal ySumPostRnd_uid643_sincosTest_b : STD_LOGIC_VECTOR (35 downto 0);
    signal ySumPostRnd_uid643_sincosTest_o : STD_LOGIC_VECTOR (35 downto 0);
    signal ySumPostRnd_uid643_sincosTest_q : STD_LOGIC_VECTOR (35 downto 0);
    signal xPostExc_uid644_sincosTest_in : STD_LOGIC_VECTOR (34 downto 0);
    signal xPostExc_uid644_sincosTest_b : STD_LOGIC_VECTOR (33 downto 0);
    signal yPostExc_uid645_sincosTest_in : STD_LOGIC_VECTOR (34 downto 0);
    signal yPostExc_uid645_sincosTest_b : STD_LOGIC_VECTOR (33 downto 0);
    signal invFirstQuadrant_uid646_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sinNegCond2_uid647_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sinNegCond1_uid648_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sinNegCond0_uid650_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sinNegCond_uid651_sincosTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal sinNegCond_uid651_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal cstZeroForAddSub_uid653_sincosTest_q : STD_LOGIC_VECTOR (33 downto 0);
    signal invSinNegCond_uid654_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sinPostNeg_uid655_sincosTest_a : STD_LOGIC_VECTOR (35 downto 0);
    signal sinPostNeg_uid655_sincosTest_b : STD_LOGIC_VECTOR (35 downto 0);
    signal sinPostNeg_uid655_sincosTest_o : STD_LOGIC_VECTOR (35 downto 0);
    signal sinPostNeg_uid655_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal sinPostNeg_uid655_sincosTest_q : STD_LOGIC_VECTOR (34 downto 0);
    signal invCosNegCond_uid656_sincosTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal invCosNegCond_uid656_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal cosPostNeg_uid657_sincosTest_a : STD_LOGIC_VECTOR (35 downto 0);
    signal cosPostNeg_uid657_sincosTest_b : STD_LOGIC_VECTOR (35 downto 0);
    signal cosPostNeg_uid657_sincosTest_o : STD_LOGIC_VECTOR (35 downto 0);
    signal cosPostNeg_uid657_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal cosPostNeg_uid657_sincosTest_q : STD_LOGIC_VECTOR (34 downto 0);
    signal xPostRR_uid658_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xPostRR_uid658_sincosTest_q : STD_LOGIC_VECTOR (34 downto 0);
    signal xPostRR_uid659_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xPostRR_uid659_sincosTest_q : STD_LOGIC_VECTOR (34 downto 0);
    signal cos_uid660_sincosTest_in : STD_LOGIC_VECTOR (33 downto 0);
    signal cos_uid660_sincosTest_b : STD_LOGIC_VECTOR (33 downto 0);
    signal sin_uid661_sincosTest_in : STD_LOGIC_VECTOR (33 downto 0);
    signal sin_uid661_sincosTest_b : STD_LOGIC_VECTOR (33 downto 0);
    signal redist0_invCosNegCond_uid656_sincosTest_q_9_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_sinNegCond_uid651_sincosTest_q_9_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_xMSB_uid617_sincosTest_b_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_xMSB_uid598_sincosTest_b_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_yip1_32_uid596_sincosTest_b_1_q : STD_LOGIC_VECTOR (70 downto 0);
    signal redist5_xip1_32_uid595_sincosTest_b_1_q : STD_LOGIC_VECTOR (70 downto 0);
    signal redist6_xMSB_uid579_sincosTest_b_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_xMSB_uid560_sincosTest_b_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_xMSB_uid541_sincosTest_b_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_xMSB_uid522_sincosTest_b_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_yip1_28_uid520_sincosTest_b_1_q : STD_LOGIC_VECTOR (70 downto 0);
    signal redist11_xip1_28_uid519_sincosTest_b_1_q : STD_LOGIC_VECTOR (70 downto 0);
    signal redist12_xMSB_uid503_sincosTest_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist13_aip1E_uid502_sincosTest_b_1_q : STD_LOGIC_VECTOR (19 downto 0);
    signal redist14_xMSB_uid484_sincosTest_b_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_xMSB_uid465_sincosTest_b_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist16_xMSB_uid446_sincosTest_b_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist17_yip1_24_uid444_sincosTest_b_1_q : STD_LOGIC_VECTOR (70 downto 0);
    signal redist18_xip1_24_uid443_sincosTest_b_1_q : STD_LOGIC_VECTOR (70 downto 0);
    signal redist19_xMSB_uid427_sincosTest_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist20_xMSB_uid408_sincosTest_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist21_aip1E_uid407_sincosTest_b_1_q : STD_LOGIC_VECTOR (24 downto 0);
    signal redist22_xMSB_uid389_sincosTest_b_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist23_xMSB_uid370_sincosTest_b_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist24_yip1_20_uid368_sincosTest_b_1_q : STD_LOGIC_VECTOR (70 downto 0);
    signal redist25_xip1_20_uid367_sincosTest_b_1_q : STD_LOGIC_VECTOR (70 downto 0);
    signal redist26_xMSB_uid351_sincosTest_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist27_xMSB_uid332_sincosTest_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist28_xMSB_uid313_sincosTest_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist29_aip1E_uid312_sincosTest_b_1_q : STD_LOGIC_VECTOR (29 downto 0);
    signal redist30_xMSB_uid294_sincosTest_b_2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist31_yip1_16_uid292_sincosTest_b_1_q : STD_LOGIC_VECTOR (70 downto 0);
    signal redist32_xip1_16_uid291_sincosTest_b_1_q : STD_LOGIC_VECTOR (70 downto 0);
    signal redist33_xMSB_uid275_sincosTest_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist34_xMSB_uid259_sincosTest_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist35_xMSB_uid243_sincosTest_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist36_xMSB_uid227_sincosTest_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist37_aip1E_uid226_sincosTest_b_1_q : STD_LOGIC_VECTOR (34 downto 0);
    signal redist38_yip1_12_uid225_sincosTest_b_1_q : STD_LOGIC_VECTOR (70 downto 0);
    signal redist39_xip1_12_uid224_sincosTest_b_1_q : STD_LOGIC_VECTOR (70 downto 0);
    signal redist40_xMSB_uid211_sincosTest_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist41_xMSB_uid195_sincosTest_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist42_xMSB_uid179_sincosTest_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist43_xMSB_uid163_sincosTest_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist44_yip1_8_uid161_sincosTest_b_1_q : STD_LOGIC_VECTOR (70 downto 0);
    signal redist45_xip1_8_uid160_sincosTest_b_1_q : STD_LOGIC_VECTOR (70 downto 0);
    signal redist46_aip1E_uid146_sincosTest_b_1_q : STD_LOGIC_VECTOR (39 downto 0);
    signal redist47_xMSB_uid131_sincosTest_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist48_xMSB_uid115_sincosTest_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist49_xMSB_uid99_sincosTest_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist50_yip1_4_uid97_sincosTest_b_1_q : STD_LOGIC_VECTOR (70 downto 0);
    signal redist51_xip1_4_uid96_sincosTest_b_1_q : STD_LOGIC_VECTOR (70 downto 0);
    signal redist52_aip1E_uid66_sincosTest_b_1_q : STD_LOGIC_VECTOR (44 downto 0);
    signal redist53_xMSB_uid51_sincosTest_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist54_firstQuadrant_uid15_sincosTest_b_9_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- cstPiO2_uid11_sincosTest(CONSTANT,10)
    cstPiO2_uid11_sincosTest_q <= "11001001000011111101101010100010001000011";

    -- invSignA_uid8_sincosTest(LOGICAL,7)@0
    invSignA_uid8_sincosTest_q <= not (signA_uid7_sincosTest_b);

    -- constantZero_uid6_sincosTest(CONSTANT,5)
    constantZero_uid6_sincosTest_q <= "00000000000000000000000000000000000";

    -- absAE_uid9_sincosTest(ADDSUB,8)@0
    absAE_uid9_sincosTest_s <= invSignA_uid8_sincosTest_q;
    absAE_uid9_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((36 downto 35 => constantZero_uid6_sincosTest_q(34)) & constantZero_uid6_sincosTest_q));
    absAE_uid9_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((36 downto 35 => a(34)) & a));
    absAE_uid9_sincosTest_combproc: PROCESS (absAE_uid9_sincosTest_a, absAE_uid9_sincosTest_b, absAE_uid9_sincosTest_s)
    BEGIN
        IF (absAE_uid9_sincosTest_s = "1") THEN
            absAE_uid9_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(absAE_uid9_sincosTest_a) + SIGNED(absAE_uid9_sincosTest_b));
        ELSE
            absAE_uid9_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(absAE_uid9_sincosTest_a) - SIGNED(absAE_uid9_sincosTest_b));
        END IF;
    END PROCESS;
    absAE_uid9_sincosTest_q <= absAE_uid9_sincosTest_o(35 downto 0);

    -- absAR_uid10_sincosTest(BITSELECT,9)@0
    absAR_uid10_sincosTest_in <= absAE_uid9_sincosTest_q(33 downto 0);
    absAR_uid10_sincosTest_b <= absAR_uid10_sincosTest_in(33 downto 0);

    -- padACst_uid12_sincosTest(CONSTANT,11)
    padACst_uid12_sincosTest_q <= "00000000";

    -- aPostPad_uid13_sincosTest(BITJOIN,12)@0
    aPostPad_uid13_sincosTest_q <= absAR_uid10_sincosTest_b & padACst_uid12_sincosTest_q;

    -- argMPiO2_uid14_sincosTest(SUB,13)@0
    argMPiO2_uid14_sincosTest_a <= STD_LOGIC_VECTOR("0" & aPostPad_uid13_sincosTest_q);
    argMPiO2_uid14_sincosTest_b <= STD_LOGIC_VECTOR("00" & cstPiO2_uid11_sincosTest_q);
    argMPiO2_uid14_sincosTest_o <= STD_LOGIC_VECTOR(UNSIGNED(argMPiO2_uid14_sincosTest_a) - UNSIGNED(argMPiO2_uid14_sincosTest_b));
    argMPiO2_uid14_sincosTest_q <= argMPiO2_uid14_sincosTest_o(42 downto 0);

    -- firstQuadrant_uid15_sincosTest(BITSELECT,14)@0
    firstQuadrant_uid15_sincosTest_b <= STD_LOGIC_VECTOR(argMPiO2_uid14_sincosTest_q(42 downto 42));

    -- invFirstQuadrant_uid646_sincosTest(LOGICAL,645)@0
    invFirstQuadrant_uid646_sincosTest_q <= not (firstQuadrant_uid15_sincosTest_b);

    -- signA_uid7_sincosTest(BITSELECT,6)@0
    signA_uid7_sincosTest_b <= STD_LOGIC_VECTOR(a(34 downto 34));

    -- sinNegCond2_uid647_sincosTest(LOGICAL,646)@0
    sinNegCond2_uid647_sincosTest_q <= signA_uid7_sincosTest_b and invFirstQuadrant_uid646_sincosTest_q;

    -- sinNegCond1_uid648_sincosTest(LOGICAL,647)@0
    sinNegCond1_uid648_sincosTest_q <= signA_uid7_sincosTest_b and firstQuadrant_uid15_sincosTest_b;

    -- sinNegCond0_uid650_sincosTest(LOGICAL,649)@0
    sinNegCond0_uid650_sincosTest_q <= invSignA_uid8_sincosTest_q and invFirstQuadrant_uid646_sincosTest_q;

    -- sinNegCond_uid651_sincosTest(LOGICAL,650)@0 + 1
    sinNegCond_uid651_sincosTest_qi <= sinNegCond0_uid650_sincosTest_q or sinNegCond1_uid648_sincosTest_q or sinNegCond2_uid647_sincosTest_q;
    sinNegCond_uid651_sincosTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => sinNegCond_uid651_sincosTest_qi, xout => sinNegCond_uid651_sincosTest_q, clk => clk, aclr => areset );

    -- redist1_sinNegCond_uid651_sincosTest_q_9(DELAY,662)
    redist1_sinNegCond_uid651_sincosTest_q_9 : dspba_delay
    GENERIC MAP ( width => 1, depth => 8, reset_kind => "ASYNC" )
    PORT MAP ( xin => sinNegCond_uid651_sincosTest_q, xout => redist1_sinNegCond_uid651_sincosTest_q_9_q, clk => clk, aclr => areset );

    -- invSinNegCond_uid654_sincosTest(LOGICAL,653)@9
    invSinNegCond_uid654_sincosTest_q <= not (redist1_sinNegCond_uid651_sincosTest_q_9_q);

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- xMSB_uid259_sincosTest(BITSELECT,258)@3
    xMSB_uid259_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid258_sincosTest_b(32 downto 32));

    -- cstArcTan2Mi_14_uid266_sincosTest(CONSTANT,265)
    cstArcTan2Mi_14_uid266_sincosTest_q <= "0111111111111111111111111111111";

    -- xMSB_uid243_sincosTest(BITSELECT,242)@3
    xMSB_uid243_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid242_sincosTest_b(33 downto 33));

    -- cstArcTan2Mi_13_uid250_sincosTest(CONSTANT,249)
    cstArcTan2Mi_13_uid250_sincosTest_q <= "01111111111111111111111111110101";

    -- xMSB_uid227_sincosTest(BITSELECT,226)@3
    xMSB_uid227_sincosTest_b <= STD_LOGIC_VECTOR(redist37_aip1E_uid226_sincosTest_b_1_q(34 downto 34));

    -- cstArcTan2Mi_12_uid234_sincosTest(CONSTANT,233)
    cstArcTan2Mi_12_uid234_sincosTest_q <= "011111111111111111111111110101011";

    -- xMSB_uid211_sincosTest(BITSELECT,210)@2
    xMSB_uid211_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid210_sincosTest_b(35 downto 35));

    -- cstArcTan2Mi_11_uid218_sincosTest(CONSTANT,217)
    cstArcTan2Mi_11_uid218_sincosTest_q <= "0111111111111111111111110101010101";

    -- xMSB_uid195_sincosTest(BITSELECT,194)@2
    xMSB_uid195_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid194_sincosTest_b(36 downto 36));

    -- cstArcTan2Mi_10_uid202_sincosTest(CONSTANT,201)
    cstArcTan2Mi_10_uid202_sincosTest_q <= "01111111111111111111110101010101011";

    -- xMSB_uid179_sincosTest(BITSELECT,178)@2
    xMSB_uid179_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid178_sincosTest_b(37 downto 37));

    -- cstArcTan2Mi_9_uid186_sincosTest(CONSTANT,185)
    cstArcTan2Mi_9_uid186_sincosTest_q <= "011111111111111111110101010101010101";

    -- xMSB_uid163_sincosTest(BITSELECT,162)@2
    xMSB_uid163_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid162_sincosTest_b(38 downto 38));

    -- cstArcTan2Mi_8_uid170_sincosTest(CONSTANT,169)
    cstArcTan2Mi_8_uid170_sincosTest_q <= "0111111111111111110101010101010101110";

    -- xMSB_uid147_sincosTest(BITSELECT,146)@2
    xMSB_uid147_sincosTest_b <= STD_LOGIC_VECTOR(redist46_aip1E_uid146_sincosTest_b_1_q(39 downto 39));

    -- cstArcTan2Mi_7_uid154_sincosTest(CONSTANT,153)
    cstArcTan2Mi_7_uid154_sincosTest_q <= "01111111111111110101010101010110111100";

    -- xMSB_uid131_sincosTest(BITSELECT,130)@1
    xMSB_uid131_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid130_sincosTest_b(40 downto 40));

    -- cstArcTan2Mi_6_uid138_sincosTest(CONSTANT,137)
    cstArcTan2Mi_6_uid138_sincosTest_q <= "011111111111110101010101011011101110111";

    -- xMSB_uid115_sincosTest(BITSELECT,114)@1
    xMSB_uid115_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid114_sincosTest_b(41 downto 41));

    -- cstArcTan2Mi_5_uid122_sincosTest(CONSTANT,121)
    cstArcTan2Mi_5_uid122_sincosTest_q <= "0111111111110101010101101110111010100110";

    -- xMSB_uid99_sincosTest(BITSELECT,98)@1
    xMSB_uid99_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid98_sincosTest_b(42 downto 42));

    -- cstArcTan2Mi_4_uid106_sincosTest(CONSTANT,105)
    cstArcTan2Mi_4_uid106_sincosTest_q <= "01111111110101010110111011011100101101000";

    -- xMSB_uid83_sincosTest(BITSELECT,82)@1
    xMSB_uid83_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid82_sincosTest_b(43 downto 43));

    -- cstArcTan2Mi_3_uid90_sincosTest(CONSTANT,89)
    cstArcTan2Mi_3_uid90_sincosTest_q <= "011111110101011011101010011010101011000011";

    -- xMSB_uid67_sincosTest(BITSELECT,66)@1
    xMSB_uid67_sincosTest_b <= STD_LOGIC_VECTOR(redist52_aip1E_uid66_sincosTest_b_1_q(44 downto 44));

    -- cstArcTan2Mi_2_uid74_sincosTest(CONSTANT,73)
    cstArcTan2Mi_2_uid74_sincosTest_q <= "0111110101101101110101111110010010110010000";

    -- xMSB_uid51_sincosTest(BITSELECT,50)@0
    xMSB_uid51_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid50_sincosTest_b(45 downto 45));

    -- cstArcTan2Mi_1_uid58_sincosTest(CONSTANT,57)
    cstArcTan2Mi_1_uid58_sincosTest_q <= "01110110101100011001110000010101100001101111";

    -- invSignOfSelectionSignal_uid36_sincosTest(LOGICAL,35)@0
    invSignOfSelectionSignal_uid36_sincosTest_q <= not (VCC_q);

    -- cstArcTan2Mi_0_uid26_sincosTest(CONSTANT,25)
    cstArcTan2Mi_0_uid26_sincosTest_q <= "011001001000011111101101010100010001000010111";

    -- absARE_bottomRange_uid17_sincosTest(BITSELECT,16)@0
    absARE_bottomRange_uid17_sincosTest_in <= absAR_uid10_sincosTest_b(32 downto 0);
    absARE_bottomRange_uid17_sincosTest_b <= absARE_bottomRange_uid17_sincosTest_in(32 downto 0);

    -- absARE_mergedSignalTM_uid18_sincosTest(BITJOIN,17)@0
    absARE_mergedSignalTM_uid18_sincosTest_q <= absARE_bottomRange_uid17_sincosTest_b & padACst_uid12_sincosTest_q;

    -- argMPiO2_uid20_sincosTest(BITSELECT,19)@0
    argMPiO2_uid20_sincosTest_in <= argMPiO2_uid14_sincosTest_q(40 downto 0);
    argMPiO2_uid20_sincosTest_b <= argMPiO2_uid20_sincosTest_in(40 downto 0);

    -- absA_uid21_sincosTest(MUX,20)@0
    absA_uid21_sincosTest_s <= firstQuadrant_uid15_sincosTest_b;
    absA_uid21_sincosTest_combproc: PROCESS (absA_uid21_sincosTest_s, argMPiO2_uid20_sincosTest_b, absARE_mergedSignalTM_uid18_sincosTest_q)
    BEGIN
        CASE (absA_uid21_sincosTest_s) IS
            WHEN "0" => absA_uid21_sincosTest_q <= argMPiO2_uid20_sincosTest_b;
            WHEN "1" => absA_uid21_sincosTest_q <= absARE_mergedSignalTM_uid18_sincosTest_q;
            WHEN OTHERS => absA_uid21_sincosTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- aip1E_1CostZeroPaddingA_uid37_sincosTest(CONSTANT,36)
    aip1E_1CostZeroPaddingA_uid37_sincosTest_q <= "0000";

    -- aip1E_1NA_uid38_sincosTest(BITJOIN,37)@0
    aip1E_1NA_uid38_sincosTest_q <= absA_uid21_sincosTest_q & aip1E_1CostZeroPaddingA_uid37_sincosTest_q;

    -- aip1E_1sumAHighB_uid39_sincosTest(ADDSUB,38)@0
    aip1E_1sumAHighB_uid39_sincosTest_s <= invSignOfSelectionSignal_uid36_sincosTest_q;
    aip1E_1sumAHighB_uid39_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000" & aip1E_1NA_uid38_sincosTest_q));
    aip1E_1sumAHighB_uid39_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((47 downto 45 => cstArcTan2Mi_0_uid26_sincosTest_q(44)) & cstArcTan2Mi_0_uid26_sincosTest_q));
    aip1E_1sumAHighB_uid39_sincosTest_combproc: PROCESS (aip1E_1sumAHighB_uid39_sincosTest_a, aip1E_1sumAHighB_uid39_sincosTest_b, aip1E_1sumAHighB_uid39_sincosTest_s)
    BEGIN
        IF (aip1E_1sumAHighB_uid39_sincosTest_s = "1") THEN
            aip1E_1sumAHighB_uid39_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_1sumAHighB_uid39_sincosTest_a) + SIGNED(aip1E_1sumAHighB_uid39_sincosTest_b));
        ELSE
            aip1E_1sumAHighB_uid39_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_1sumAHighB_uid39_sincosTest_a) - SIGNED(aip1E_1sumAHighB_uid39_sincosTest_b));
        END IF;
    END PROCESS;
    aip1E_1sumAHighB_uid39_sincosTest_q <= aip1E_1sumAHighB_uid39_sincosTest_o(46 downto 0);

    -- aip1E_uid50_sincosTest(BITSELECT,49)@0
    aip1E_uid50_sincosTest_in <= STD_LOGIC_VECTOR(aip1E_1sumAHighB_uid39_sincosTest_q(45 downto 0));
    aip1E_uid50_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid50_sincosTest_in(45 downto 0));

    -- aip1E_2_uid63_sincosTest(ADDSUB,62)@0
    aip1E_2_uid63_sincosTest_s <= xMSB_uid51_sincosTest_b;
    aip1E_2_uid63_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((47 downto 46 => aip1E_uid50_sincosTest_b(45)) & aip1E_uid50_sincosTest_b));
    aip1E_2_uid63_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((47 downto 44 => cstArcTan2Mi_1_uid58_sincosTest_q(43)) & cstArcTan2Mi_1_uid58_sincosTest_q));
    aip1E_2_uid63_sincosTest_combproc: PROCESS (aip1E_2_uid63_sincosTest_a, aip1E_2_uid63_sincosTest_b, aip1E_2_uid63_sincosTest_s)
    BEGIN
        IF (aip1E_2_uid63_sincosTest_s = "1") THEN
            aip1E_2_uid63_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_2_uid63_sincosTest_a) + SIGNED(aip1E_2_uid63_sincosTest_b));
        ELSE
            aip1E_2_uid63_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_2_uid63_sincosTest_a) - SIGNED(aip1E_2_uid63_sincosTest_b));
        END IF;
    END PROCESS;
    aip1E_2_uid63_sincosTest_q <= aip1E_2_uid63_sincosTest_o(46 downto 0);

    -- aip1E_uid66_sincosTest(BITSELECT,65)@0
    aip1E_uid66_sincosTest_in <= STD_LOGIC_VECTOR(aip1E_2_uid63_sincosTest_q(44 downto 0));
    aip1E_uid66_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid66_sincosTest_in(44 downto 0));

    -- redist52_aip1E_uid66_sincosTest_b_1(DELAY,713)
    redist52_aip1E_uid66_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 45, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => aip1E_uid66_sincosTest_b, xout => redist52_aip1E_uid66_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- aip1E_3_uid79_sincosTest(ADDSUB,78)@1
    aip1E_3_uid79_sincosTest_s <= xMSB_uid67_sincosTest_b;
    aip1E_3_uid79_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((46 downto 45 => redist52_aip1E_uid66_sincosTest_b_1_q(44)) & redist52_aip1E_uid66_sincosTest_b_1_q));
    aip1E_3_uid79_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((46 downto 43 => cstArcTan2Mi_2_uid74_sincosTest_q(42)) & cstArcTan2Mi_2_uid74_sincosTest_q));
    aip1E_3_uid79_sincosTest_combproc: PROCESS (aip1E_3_uid79_sincosTest_a, aip1E_3_uid79_sincosTest_b, aip1E_3_uid79_sincosTest_s)
    BEGIN
        IF (aip1E_3_uid79_sincosTest_s = "1") THEN
            aip1E_3_uid79_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_3_uid79_sincosTest_a) + SIGNED(aip1E_3_uid79_sincosTest_b));
        ELSE
            aip1E_3_uid79_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_3_uid79_sincosTest_a) - SIGNED(aip1E_3_uid79_sincosTest_b));
        END IF;
    END PROCESS;
    aip1E_3_uid79_sincosTest_q <= aip1E_3_uid79_sincosTest_o(45 downto 0);

    -- aip1E_uid82_sincosTest(BITSELECT,81)@1
    aip1E_uid82_sincosTest_in <= STD_LOGIC_VECTOR(aip1E_3_uid79_sincosTest_q(43 downto 0));
    aip1E_uid82_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid82_sincosTest_in(43 downto 0));

    -- aip1E_4_uid95_sincosTest(ADDSUB,94)@1
    aip1E_4_uid95_sincosTest_s <= xMSB_uid83_sincosTest_b;
    aip1E_4_uid95_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((45 downto 44 => aip1E_uid82_sincosTest_b(43)) & aip1E_uid82_sincosTest_b));
    aip1E_4_uid95_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((45 downto 42 => cstArcTan2Mi_3_uid90_sincosTest_q(41)) & cstArcTan2Mi_3_uid90_sincosTest_q));
    aip1E_4_uid95_sincosTest_combproc: PROCESS (aip1E_4_uid95_sincosTest_a, aip1E_4_uid95_sincosTest_b, aip1E_4_uid95_sincosTest_s)
    BEGIN
        IF (aip1E_4_uid95_sincosTest_s = "1") THEN
            aip1E_4_uid95_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_4_uid95_sincosTest_a) + SIGNED(aip1E_4_uid95_sincosTest_b));
        ELSE
            aip1E_4_uid95_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_4_uid95_sincosTest_a) - SIGNED(aip1E_4_uid95_sincosTest_b));
        END IF;
    END PROCESS;
    aip1E_4_uid95_sincosTest_q <= aip1E_4_uid95_sincosTest_o(44 downto 0);

    -- aip1E_uid98_sincosTest(BITSELECT,97)@1
    aip1E_uid98_sincosTest_in <= STD_LOGIC_VECTOR(aip1E_4_uid95_sincosTest_q(42 downto 0));
    aip1E_uid98_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid98_sincosTest_in(42 downto 0));

    -- aip1E_5_uid111_sincosTest(ADDSUB,110)@1
    aip1E_5_uid111_sincosTest_s <= xMSB_uid99_sincosTest_b;
    aip1E_5_uid111_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((44 downto 43 => aip1E_uid98_sincosTest_b(42)) & aip1E_uid98_sincosTest_b));
    aip1E_5_uid111_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((44 downto 41 => cstArcTan2Mi_4_uid106_sincosTest_q(40)) & cstArcTan2Mi_4_uid106_sincosTest_q));
    aip1E_5_uid111_sincosTest_combproc: PROCESS (aip1E_5_uid111_sincosTest_a, aip1E_5_uid111_sincosTest_b, aip1E_5_uid111_sincosTest_s)
    BEGIN
        IF (aip1E_5_uid111_sincosTest_s = "1") THEN
            aip1E_5_uid111_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_5_uid111_sincosTest_a) + SIGNED(aip1E_5_uid111_sincosTest_b));
        ELSE
            aip1E_5_uid111_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_5_uid111_sincosTest_a) - SIGNED(aip1E_5_uid111_sincosTest_b));
        END IF;
    END PROCESS;
    aip1E_5_uid111_sincosTest_q <= aip1E_5_uid111_sincosTest_o(43 downto 0);

    -- aip1E_uid114_sincosTest(BITSELECT,113)@1
    aip1E_uid114_sincosTest_in <= STD_LOGIC_VECTOR(aip1E_5_uid111_sincosTest_q(41 downto 0));
    aip1E_uid114_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid114_sincosTest_in(41 downto 0));

    -- aip1E_6_uid127_sincosTest(ADDSUB,126)@1
    aip1E_6_uid127_sincosTest_s <= xMSB_uid115_sincosTest_b;
    aip1E_6_uid127_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((43 downto 42 => aip1E_uid114_sincosTest_b(41)) & aip1E_uid114_sincosTest_b));
    aip1E_6_uid127_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((43 downto 40 => cstArcTan2Mi_5_uid122_sincosTest_q(39)) & cstArcTan2Mi_5_uid122_sincosTest_q));
    aip1E_6_uid127_sincosTest_combproc: PROCESS (aip1E_6_uid127_sincosTest_a, aip1E_6_uid127_sincosTest_b, aip1E_6_uid127_sincosTest_s)
    BEGIN
        IF (aip1E_6_uid127_sincosTest_s = "1") THEN
            aip1E_6_uid127_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_6_uid127_sincosTest_a) + SIGNED(aip1E_6_uid127_sincosTest_b));
        ELSE
            aip1E_6_uid127_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_6_uid127_sincosTest_a) - SIGNED(aip1E_6_uid127_sincosTest_b));
        END IF;
    END PROCESS;
    aip1E_6_uid127_sincosTest_q <= aip1E_6_uid127_sincosTest_o(42 downto 0);

    -- aip1E_uid130_sincosTest(BITSELECT,129)@1
    aip1E_uid130_sincosTest_in <= STD_LOGIC_VECTOR(aip1E_6_uid127_sincosTest_q(40 downto 0));
    aip1E_uid130_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid130_sincosTest_in(40 downto 0));

    -- aip1E_7_uid143_sincosTest(ADDSUB,142)@1
    aip1E_7_uid143_sincosTest_s <= xMSB_uid131_sincosTest_b;
    aip1E_7_uid143_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((42 downto 41 => aip1E_uid130_sincosTest_b(40)) & aip1E_uid130_sincosTest_b));
    aip1E_7_uid143_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((42 downto 39 => cstArcTan2Mi_6_uid138_sincosTest_q(38)) & cstArcTan2Mi_6_uid138_sincosTest_q));
    aip1E_7_uid143_sincosTest_combproc: PROCESS (aip1E_7_uid143_sincosTest_a, aip1E_7_uid143_sincosTest_b, aip1E_7_uid143_sincosTest_s)
    BEGIN
        IF (aip1E_7_uid143_sincosTest_s = "1") THEN
            aip1E_7_uid143_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_7_uid143_sincosTest_a) + SIGNED(aip1E_7_uid143_sincosTest_b));
        ELSE
            aip1E_7_uid143_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_7_uid143_sincosTest_a) - SIGNED(aip1E_7_uid143_sincosTest_b));
        END IF;
    END PROCESS;
    aip1E_7_uid143_sincosTest_q <= aip1E_7_uid143_sincosTest_o(41 downto 0);

    -- aip1E_uid146_sincosTest(BITSELECT,145)@1
    aip1E_uid146_sincosTest_in <= STD_LOGIC_VECTOR(aip1E_7_uid143_sincosTest_q(39 downto 0));
    aip1E_uid146_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid146_sincosTest_in(39 downto 0));

    -- redist46_aip1E_uid146_sincosTest_b_1(DELAY,707)
    redist46_aip1E_uid146_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 40, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => aip1E_uid146_sincosTest_b, xout => redist46_aip1E_uid146_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- aip1E_8_uid159_sincosTest(ADDSUB,158)@2
    aip1E_8_uid159_sincosTest_s <= xMSB_uid147_sincosTest_b;
    aip1E_8_uid159_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((41 downto 40 => redist46_aip1E_uid146_sincosTest_b_1_q(39)) & redist46_aip1E_uid146_sincosTest_b_1_q));
    aip1E_8_uid159_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((41 downto 38 => cstArcTan2Mi_7_uid154_sincosTest_q(37)) & cstArcTan2Mi_7_uid154_sincosTest_q));
    aip1E_8_uid159_sincosTest_combproc: PROCESS (aip1E_8_uid159_sincosTest_a, aip1E_8_uid159_sincosTest_b, aip1E_8_uid159_sincosTest_s)
    BEGIN
        IF (aip1E_8_uid159_sincosTest_s = "1") THEN
            aip1E_8_uid159_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_8_uid159_sincosTest_a) + SIGNED(aip1E_8_uid159_sincosTest_b));
        ELSE
            aip1E_8_uid159_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_8_uid159_sincosTest_a) - SIGNED(aip1E_8_uid159_sincosTest_b));
        END IF;
    END PROCESS;
    aip1E_8_uid159_sincosTest_q <= aip1E_8_uid159_sincosTest_o(40 downto 0);

    -- aip1E_uid162_sincosTest(BITSELECT,161)@2
    aip1E_uid162_sincosTest_in <= STD_LOGIC_VECTOR(aip1E_8_uid159_sincosTest_q(38 downto 0));
    aip1E_uid162_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid162_sincosTest_in(38 downto 0));

    -- aip1E_9_uid175_sincosTest(ADDSUB,174)@2
    aip1E_9_uid175_sincosTest_s <= xMSB_uid163_sincosTest_b;
    aip1E_9_uid175_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((40 downto 39 => aip1E_uid162_sincosTest_b(38)) & aip1E_uid162_sincosTest_b));
    aip1E_9_uid175_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((40 downto 37 => cstArcTan2Mi_8_uid170_sincosTest_q(36)) & cstArcTan2Mi_8_uid170_sincosTest_q));
    aip1E_9_uid175_sincosTest_combproc: PROCESS (aip1E_9_uid175_sincosTest_a, aip1E_9_uid175_sincosTest_b, aip1E_9_uid175_sincosTest_s)
    BEGIN
        IF (aip1E_9_uid175_sincosTest_s = "1") THEN
            aip1E_9_uid175_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_9_uid175_sincosTest_a) + SIGNED(aip1E_9_uid175_sincosTest_b));
        ELSE
            aip1E_9_uid175_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_9_uid175_sincosTest_a) - SIGNED(aip1E_9_uid175_sincosTest_b));
        END IF;
    END PROCESS;
    aip1E_9_uid175_sincosTest_q <= aip1E_9_uid175_sincosTest_o(39 downto 0);

    -- aip1E_uid178_sincosTest(BITSELECT,177)@2
    aip1E_uid178_sincosTest_in <= STD_LOGIC_VECTOR(aip1E_9_uid175_sincosTest_q(37 downto 0));
    aip1E_uid178_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid178_sincosTest_in(37 downto 0));

    -- aip1E_10_uid191_sincosTest(ADDSUB,190)@2
    aip1E_10_uid191_sincosTest_s <= xMSB_uid179_sincosTest_b;
    aip1E_10_uid191_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((39 downto 38 => aip1E_uid178_sincosTest_b(37)) & aip1E_uid178_sincosTest_b));
    aip1E_10_uid191_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((39 downto 36 => cstArcTan2Mi_9_uid186_sincosTest_q(35)) & cstArcTan2Mi_9_uid186_sincosTest_q));
    aip1E_10_uid191_sincosTest_combproc: PROCESS (aip1E_10_uid191_sincosTest_a, aip1E_10_uid191_sincosTest_b, aip1E_10_uid191_sincosTest_s)
    BEGIN
        IF (aip1E_10_uid191_sincosTest_s = "1") THEN
            aip1E_10_uid191_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_10_uid191_sincosTest_a) + SIGNED(aip1E_10_uid191_sincosTest_b));
        ELSE
            aip1E_10_uid191_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_10_uid191_sincosTest_a) - SIGNED(aip1E_10_uid191_sincosTest_b));
        END IF;
    END PROCESS;
    aip1E_10_uid191_sincosTest_q <= aip1E_10_uid191_sincosTest_o(38 downto 0);

    -- aip1E_uid194_sincosTest(BITSELECT,193)@2
    aip1E_uid194_sincosTest_in <= STD_LOGIC_VECTOR(aip1E_10_uid191_sincosTest_q(36 downto 0));
    aip1E_uid194_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid194_sincosTest_in(36 downto 0));

    -- aip1E_11_uid207_sincosTest(ADDSUB,206)@2
    aip1E_11_uid207_sincosTest_s <= xMSB_uid195_sincosTest_b;
    aip1E_11_uid207_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((38 downto 37 => aip1E_uid194_sincosTest_b(36)) & aip1E_uid194_sincosTest_b));
    aip1E_11_uid207_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((38 downto 35 => cstArcTan2Mi_10_uid202_sincosTest_q(34)) & cstArcTan2Mi_10_uid202_sincosTest_q));
    aip1E_11_uid207_sincosTest_combproc: PROCESS (aip1E_11_uid207_sincosTest_a, aip1E_11_uid207_sincosTest_b, aip1E_11_uid207_sincosTest_s)
    BEGIN
        IF (aip1E_11_uid207_sincosTest_s = "1") THEN
            aip1E_11_uid207_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_11_uid207_sincosTest_a) + SIGNED(aip1E_11_uid207_sincosTest_b));
        ELSE
            aip1E_11_uid207_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_11_uid207_sincosTest_a) - SIGNED(aip1E_11_uid207_sincosTest_b));
        END IF;
    END PROCESS;
    aip1E_11_uid207_sincosTest_q <= aip1E_11_uid207_sincosTest_o(37 downto 0);

    -- aip1E_uid210_sincosTest(BITSELECT,209)@2
    aip1E_uid210_sincosTest_in <= STD_LOGIC_VECTOR(aip1E_11_uid207_sincosTest_q(35 downto 0));
    aip1E_uid210_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid210_sincosTest_in(35 downto 0));

    -- aip1E_12_uid223_sincosTest(ADDSUB,222)@2
    aip1E_12_uid223_sincosTest_s <= xMSB_uid211_sincosTest_b;
    aip1E_12_uid223_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((37 downto 36 => aip1E_uid210_sincosTest_b(35)) & aip1E_uid210_sincosTest_b));
    aip1E_12_uid223_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((37 downto 34 => cstArcTan2Mi_11_uid218_sincosTest_q(33)) & cstArcTan2Mi_11_uid218_sincosTest_q));
    aip1E_12_uid223_sincosTest_combproc: PROCESS (aip1E_12_uid223_sincosTest_a, aip1E_12_uid223_sincosTest_b, aip1E_12_uid223_sincosTest_s)
    BEGIN
        IF (aip1E_12_uid223_sincosTest_s = "1") THEN
            aip1E_12_uid223_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_12_uid223_sincosTest_a) + SIGNED(aip1E_12_uid223_sincosTest_b));
        ELSE
            aip1E_12_uid223_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_12_uid223_sincosTest_a) - SIGNED(aip1E_12_uid223_sincosTest_b));
        END IF;
    END PROCESS;
    aip1E_12_uid223_sincosTest_q <= aip1E_12_uid223_sincosTest_o(36 downto 0);

    -- aip1E_uid226_sincosTest(BITSELECT,225)@2
    aip1E_uid226_sincosTest_in <= STD_LOGIC_VECTOR(aip1E_12_uid223_sincosTest_q(34 downto 0));
    aip1E_uid226_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid226_sincosTest_in(34 downto 0));

    -- redist37_aip1E_uid226_sincosTest_b_1(DELAY,698)
    redist37_aip1E_uid226_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 35, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => aip1E_uid226_sincosTest_b, xout => redist37_aip1E_uid226_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- aip1E_13_uid239_sincosTest(ADDSUB,238)@3
    aip1E_13_uid239_sincosTest_s <= xMSB_uid227_sincosTest_b;
    aip1E_13_uid239_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((36 downto 35 => redist37_aip1E_uid226_sincosTest_b_1_q(34)) & redist37_aip1E_uid226_sincosTest_b_1_q));
    aip1E_13_uid239_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((36 downto 33 => cstArcTan2Mi_12_uid234_sincosTest_q(32)) & cstArcTan2Mi_12_uid234_sincosTest_q));
    aip1E_13_uid239_sincosTest_combproc: PROCESS (aip1E_13_uid239_sincosTest_a, aip1E_13_uid239_sincosTest_b, aip1E_13_uid239_sincosTest_s)
    BEGIN
        IF (aip1E_13_uid239_sincosTest_s = "1") THEN
            aip1E_13_uid239_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_13_uid239_sincosTest_a) + SIGNED(aip1E_13_uid239_sincosTest_b));
        ELSE
            aip1E_13_uid239_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_13_uid239_sincosTest_a) - SIGNED(aip1E_13_uid239_sincosTest_b));
        END IF;
    END PROCESS;
    aip1E_13_uid239_sincosTest_q <= aip1E_13_uid239_sincosTest_o(35 downto 0);

    -- aip1E_uid242_sincosTest(BITSELECT,241)@3
    aip1E_uid242_sincosTest_in <= STD_LOGIC_VECTOR(aip1E_13_uid239_sincosTest_q(33 downto 0));
    aip1E_uid242_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid242_sincosTest_in(33 downto 0));

    -- aip1E_14_uid255_sincosTest(ADDSUB,254)@3
    aip1E_14_uid255_sincosTest_s <= xMSB_uid243_sincosTest_b;
    aip1E_14_uid255_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((35 downto 34 => aip1E_uid242_sincosTest_b(33)) & aip1E_uid242_sincosTest_b));
    aip1E_14_uid255_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((35 downto 32 => cstArcTan2Mi_13_uid250_sincosTest_q(31)) & cstArcTan2Mi_13_uid250_sincosTest_q));
    aip1E_14_uid255_sincosTest_combproc: PROCESS (aip1E_14_uid255_sincosTest_a, aip1E_14_uid255_sincosTest_b, aip1E_14_uid255_sincosTest_s)
    BEGIN
        IF (aip1E_14_uid255_sincosTest_s = "1") THEN
            aip1E_14_uid255_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_14_uid255_sincosTest_a) + SIGNED(aip1E_14_uid255_sincosTest_b));
        ELSE
            aip1E_14_uid255_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_14_uid255_sincosTest_a) - SIGNED(aip1E_14_uid255_sincosTest_b));
        END IF;
    END PROCESS;
    aip1E_14_uid255_sincosTest_q <= aip1E_14_uid255_sincosTest_o(34 downto 0);

    -- aip1E_uid258_sincosTest(BITSELECT,257)@3
    aip1E_uid258_sincosTest_in <= STD_LOGIC_VECTOR(aip1E_14_uid255_sincosTest_q(32 downto 0));
    aip1E_uid258_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid258_sincosTest_in(32 downto 0));

    -- aip1E_15_uid271_sincosTest(ADDSUB,270)@3
    aip1E_15_uid271_sincosTest_s <= xMSB_uid259_sincosTest_b;
    aip1E_15_uid271_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 33 => aip1E_uid258_sincosTest_b(32)) & aip1E_uid258_sincosTest_b));
    aip1E_15_uid271_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 31 => cstArcTan2Mi_14_uid266_sincosTest_q(30)) & cstArcTan2Mi_14_uid266_sincosTest_q));
    aip1E_15_uid271_sincosTest_combproc: PROCESS (aip1E_15_uid271_sincosTest_a, aip1E_15_uid271_sincosTest_b, aip1E_15_uid271_sincosTest_s)
    BEGIN
        IF (aip1E_15_uid271_sincosTest_s = "1") THEN
            aip1E_15_uid271_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_15_uid271_sincosTest_a) + SIGNED(aip1E_15_uid271_sincosTest_b));
        ELSE
            aip1E_15_uid271_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_15_uid271_sincosTest_a) - SIGNED(aip1E_15_uid271_sincosTest_b));
        END IF;
    END PROCESS;
    aip1E_15_uid271_sincosTest_q <= aip1E_15_uid271_sincosTest_o(33 downto 0);

    -- aip1E_uid274_sincosTest(BITSELECT,273)@3
    aip1E_uid274_sincosTest_in <= STD_LOGIC_VECTOR(aip1E_15_uid271_sincosTest_q(31 downto 0));
    aip1E_uid274_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid274_sincosTest_in(31 downto 0));

    -- xMSB_uid275_sincosTest(BITSELECT,274)@3
    xMSB_uid275_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid274_sincosTest_b(31 downto 31));

    -- cstArcTan2Mi_15_uid282_sincosTest(CONSTANT,281)
    cstArcTan2Mi_15_uid282_sincosTest_q <= "010000000000000000000000000000";

    -- highABits_uid288_sincosTest(BITSELECT,287)@3
    highABits_uid288_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid274_sincosTest_b(31 downto 1));

    -- aip1E_16high_uid289_sincosTest(ADDSUB,288)@3
    aip1E_16high_uid289_sincosTest_s <= xMSB_uid275_sincosTest_b;
    aip1E_16high_uid289_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((32 downto 31 => highABits_uid288_sincosTest_b(30)) & highABits_uid288_sincosTest_b));
    aip1E_16high_uid289_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((32 downto 30 => cstArcTan2Mi_15_uid282_sincosTest_q(29)) & cstArcTan2Mi_15_uid282_sincosTest_q));
    aip1E_16high_uid289_sincosTest_combproc: PROCESS (aip1E_16high_uid289_sincosTest_a, aip1E_16high_uid289_sincosTest_b, aip1E_16high_uid289_sincosTest_s)
    BEGIN
        IF (aip1E_16high_uid289_sincosTest_s = "1") THEN
            aip1E_16high_uid289_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_16high_uid289_sincosTest_a) + SIGNED(aip1E_16high_uid289_sincosTest_b));
        ELSE
            aip1E_16high_uid289_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_16high_uid289_sincosTest_a) - SIGNED(aip1E_16high_uid289_sincosTest_b));
        END IF;
    END PROCESS;
    aip1E_16high_uid289_sincosTest_q <= aip1E_16high_uid289_sincosTest_o(31 downto 0);

    -- lowRangeA_uid287_sincosTest(BITSELECT,286)@3
    lowRangeA_uid287_sincosTest_in <= aip1E_uid274_sincosTest_b(0 downto 0);
    lowRangeA_uid287_sincosTest_b <= lowRangeA_uid287_sincosTest_in(0 downto 0);

    -- aip1E_16_uid290_sincosTest(BITJOIN,289)@3
    aip1E_16_uid290_sincosTest_q <= aip1E_16high_uid289_sincosTest_q & lowRangeA_uid287_sincosTest_b;

    -- aip1E_uid293_sincosTest(BITSELECT,292)@3
    aip1E_uid293_sincosTest_in <= STD_LOGIC_VECTOR(aip1E_16_uid290_sincosTest_q(30 downto 0));
    aip1E_uid293_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid293_sincosTest_in(30 downto 0));

    -- xMSB_uid294_sincosTest(BITSELECT,293)@3
    xMSB_uid294_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid293_sincosTest_b(30 downto 30));

    -- cstArcTan2Mi_16_uid301_sincosTest(CONSTANT,300)
    cstArcTan2Mi_16_uid301_sincosTest_q <= "01000000000000000000000000000";

    -- highABits_uid307_sincosTest(BITSELECT,306)@3
    highABits_uid307_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid293_sincosTest_b(30 downto 1));

    -- aip1E_17high_uid308_sincosTest(ADDSUB,307)@3
    aip1E_17high_uid308_sincosTest_s <= xMSB_uid294_sincosTest_b;
    aip1E_17high_uid308_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((31 downto 30 => highABits_uid307_sincosTest_b(29)) & highABits_uid307_sincosTest_b));
    aip1E_17high_uid308_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((31 downto 29 => cstArcTan2Mi_16_uid301_sincosTest_q(28)) & cstArcTan2Mi_16_uid301_sincosTest_q));
    aip1E_17high_uid308_sincosTest_combproc: PROCESS (aip1E_17high_uid308_sincosTest_a, aip1E_17high_uid308_sincosTest_b, aip1E_17high_uid308_sincosTest_s)
    BEGIN
        IF (aip1E_17high_uid308_sincosTest_s = "1") THEN
            aip1E_17high_uid308_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_17high_uid308_sincosTest_a) + SIGNED(aip1E_17high_uid308_sincosTest_b));
        ELSE
            aip1E_17high_uid308_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_17high_uid308_sincosTest_a) - SIGNED(aip1E_17high_uid308_sincosTest_b));
        END IF;
    END PROCESS;
    aip1E_17high_uid308_sincosTest_q <= aip1E_17high_uid308_sincosTest_o(30 downto 0);

    -- lowRangeA_uid306_sincosTest(BITSELECT,305)@3
    lowRangeA_uid306_sincosTest_in <= aip1E_uid293_sincosTest_b(0 downto 0);
    lowRangeA_uid306_sincosTest_b <= lowRangeA_uid306_sincosTest_in(0 downto 0);

    -- aip1E_17_uid309_sincosTest(BITJOIN,308)@3
    aip1E_17_uid309_sincosTest_q <= aip1E_17high_uid308_sincosTest_q & lowRangeA_uid306_sincosTest_b;

    -- aip1E_uid312_sincosTest(BITSELECT,311)@3
    aip1E_uid312_sincosTest_in <= STD_LOGIC_VECTOR(aip1E_17_uid309_sincosTest_q(29 downto 0));
    aip1E_uid312_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid312_sincosTest_in(29 downto 0));

    -- redist29_aip1E_uid312_sincosTest_b_1(DELAY,690)
    redist29_aip1E_uid312_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 30, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => aip1E_uid312_sincosTest_b, xout => redist29_aip1E_uid312_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- xMSB_uid313_sincosTest(BITSELECT,312)@4
    xMSB_uid313_sincosTest_b <= STD_LOGIC_VECTOR(redist29_aip1E_uid312_sincosTest_b_1_q(29 downto 29));

    -- cstArcTan2Mi_17_uid320_sincosTest(CONSTANT,319)
    cstArcTan2Mi_17_uid320_sincosTest_q <= "0100000000000000000000000000";

    -- highABits_uid326_sincosTest(BITSELECT,325)@4
    highABits_uid326_sincosTest_b <= STD_LOGIC_VECTOR(redist29_aip1E_uid312_sincosTest_b_1_q(29 downto 1));

    -- aip1E_18high_uid327_sincosTest(ADDSUB,326)@4
    aip1E_18high_uid327_sincosTest_s <= xMSB_uid313_sincosTest_b;
    aip1E_18high_uid327_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((30 downto 29 => highABits_uid326_sincosTest_b(28)) & highABits_uid326_sincosTest_b));
    aip1E_18high_uid327_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((30 downto 28 => cstArcTan2Mi_17_uid320_sincosTest_q(27)) & cstArcTan2Mi_17_uid320_sincosTest_q));
    aip1E_18high_uid327_sincosTest_combproc: PROCESS (aip1E_18high_uid327_sincosTest_a, aip1E_18high_uid327_sincosTest_b, aip1E_18high_uid327_sincosTest_s)
    BEGIN
        IF (aip1E_18high_uid327_sincosTest_s = "1") THEN
            aip1E_18high_uid327_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_18high_uid327_sincosTest_a) + SIGNED(aip1E_18high_uid327_sincosTest_b));
        ELSE
            aip1E_18high_uid327_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_18high_uid327_sincosTest_a) - SIGNED(aip1E_18high_uid327_sincosTest_b));
        END IF;
    END PROCESS;
    aip1E_18high_uid327_sincosTest_q <= aip1E_18high_uid327_sincosTest_o(29 downto 0);

    -- lowRangeA_uid325_sincosTest(BITSELECT,324)@4
    lowRangeA_uid325_sincosTest_in <= redist29_aip1E_uid312_sincosTest_b_1_q(0 downto 0);
    lowRangeA_uid325_sincosTest_b <= lowRangeA_uid325_sincosTest_in(0 downto 0);

    -- aip1E_18_uid328_sincosTest(BITJOIN,327)@4
    aip1E_18_uid328_sincosTest_q <= aip1E_18high_uid327_sincosTest_q & lowRangeA_uid325_sincosTest_b;

    -- aip1E_uid331_sincosTest(BITSELECT,330)@4
    aip1E_uid331_sincosTest_in <= STD_LOGIC_VECTOR(aip1E_18_uid328_sincosTest_q(28 downto 0));
    aip1E_uid331_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid331_sincosTest_in(28 downto 0));

    -- xMSB_uid332_sincosTest(BITSELECT,331)@4
    xMSB_uid332_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid331_sincosTest_b(28 downto 28));

    -- cstArcTan2Mi_18_uid339_sincosTest(CONSTANT,338)
    cstArcTan2Mi_18_uid339_sincosTest_q <= "010000000000000000000000000";

    -- highABits_uid345_sincosTest(BITSELECT,344)@4
    highABits_uid345_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid331_sincosTest_b(28 downto 1));

    -- aip1E_19high_uid346_sincosTest(ADDSUB,345)@4
    aip1E_19high_uid346_sincosTest_s <= xMSB_uid332_sincosTest_b;
    aip1E_19high_uid346_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((29 downto 28 => highABits_uid345_sincosTest_b(27)) & highABits_uid345_sincosTest_b));
    aip1E_19high_uid346_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((29 downto 27 => cstArcTan2Mi_18_uid339_sincosTest_q(26)) & cstArcTan2Mi_18_uid339_sincosTest_q));
    aip1E_19high_uid346_sincosTest_combproc: PROCESS (aip1E_19high_uid346_sincosTest_a, aip1E_19high_uid346_sincosTest_b, aip1E_19high_uid346_sincosTest_s)
    BEGIN
        IF (aip1E_19high_uid346_sincosTest_s = "1") THEN
            aip1E_19high_uid346_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_19high_uid346_sincosTest_a) + SIGNED(aip1E_19high_uid346_sincosTest_b));
        ELSE
            aip1E_19high_uid346_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_19high_uid346_sincosTest_a) - SIGNED(aip1E_19high_uid346_sincosTest_b));
        END IF;
    END PROCESS;
    aip1E_19high_uid346_sincosTest_q <= aip1E_19high_uid346_sincosTest_o(28 downto 0);

    -- lowRangeA_uid344_sincosTest(BITSELECT,343)@4
    lowRangeA_uid344_sincosTest_in <= aip1E_uid331_sincosTest_b(0 downto 0);
    lowRangeA_uid344_sincosTest_b <= lowRangeA_uid344_sincosTest_in(0 downto 0);

    -- aip1E_19_uid347_sincosTest(BITJOIN,346)@4
    aip1E_19_uid347_sincosTest_q <= aip1E_19high_uid346_sincosTest_q & lowRangeA_uid344_sincosTest_b;

    -- aip1E_uid350_sincosTest(BITSELECT,349)@4
    aip1E_uid350_sincosTest_in <= STD_LOGIC_VECTOR(aip1E_19_uid347_sincosTest_q(27 downto 0));
    aip1E_uid350_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid350_sincosTest_in(27 downto 0));

    -- xMSB_uid351_sincosTest(BITSELECT,350)@4
    xMSB_uid351_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid350_sincosTest_b(27 downto 27));

    -- cstArcTan2Mi_19_uid358_sincosTest(CONSTANT,357)
    cstArcTan2Mi_19_uid358_sincosTest_q <= "01000000000000000000000000";

    -- highABits_uid364_sincosTest(BITSELECT,363)@4
    highABits_uid364_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid350_sincosTest_b(27 downto 1));

    -- aip1E_20high_uid365_sincosTest(ADDSUB,364)@4
    aip1E_20high_uid365_sincosTest_s <= xMSB_uid351_sincosTest_b;
    aip1E_20high_uid365_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((28 downto 27 => highABits_uid364_sincosTest_b(26)) & highABits_uid364_sincosTest_b));
    aip1E_20high_uid365_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((28 downto 26 => cstArcTan2Mi_19_uid358_sincosTest_q(25)) & cstArcTan2Mi_19_uid358_sincosTest_q));
    aip1E_20high_uid365_sincosTest_combproc: PROCESS (aip1E_20high_uid365_sincosTest_a, aip1E_20high_uid365_sincosTest_b, aip1E_20high_uid365_sincosTest_s)
    BEGIN
        IF (aip1E_20high_uid365_sincosTest_s = "1") THEN
            aip1E_20high_uid365_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_20high_uid365_sincosTest_a) + SIGNED(aip1E_20high_uid365_sincosTest_b));
        ELSE
            aip1E_20high_uid365_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_20high_uid365_sincosTest_a) - SIGNED(aip1E_20high_uid365_sincosTest_b));
        END IF;
    END PROCESS;
    aip1E_20high_uid365_sincosTest_q <= aip1E_20high_uid365_sincosTest_o(27 downto 0);

    -- lowRangeA_uid363_sincosTest(BITSELECT,362)@4
    lowRangeA_uid363_sincosTest_in <= aip1E_uid350_sincosTest_b(0 downto 0);
    lowRangeA_uid363_sincosTest_b <= lowRangeA_uid363_sincosTest_in(0 downto 0);

    -- aip1E_20_uid366_sincosTest(BITJOIN,365)@4
    aip1E_20_uid366_sincosTest_q <= aip1E_20high_uid365_sincosTest_q & lowRangeA_uid363_sincosTest_b;

    -- aip1E_uid369_sincosTest(BITSELECT,368)@4
    aip1E_uid369_sincosTest_in <= STD_LOGIC_VECTOR(aip1E_20_uid366_sincosTest_q(26 downto 0));
    aip1E_uid369_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid369_sincosTest_in(26 downto 0));

    -- xMSB_uid370_sincosTest(BITSELECT,369)@4
    xMSB_uid370_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid369_sincosTest_b(26 downto 26));

    -- cstArcTan2Mi_20_uid377_sincosTest(CONSTANT,376)
    cstArcTan2Mi_20_uid377_sincosTest_q <= "0100000000000000000000000";

    -- highABits_uid383_sincosTest(BITSELECT,382)@4
    highABits_uid383_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid369_sincosTest_b(26 downto 1));

    -- aip1E_21high_uid384_sincosTest(ADDSUB,383)@4
    aip1E_21high_uid384_sincosTest_s <= xMSB_uid370_sincosTest_b;
    aip1E_21high_uid384_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((27 downto 26 => highABits_uid383_sincosTest_b(25)) & highABits_uid383_sincosTest_b));
    aip1E_21high_uid384_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((27 downto 25 => cstArcTan2Mi_20_uid377_sincosTest_q(24)) & cstArcTan2Mi_20_uid377_sincosTest_q));
    aip1E_21high_uid384_sincosTest_combproc: PROCESS (aip1E_21high_uid384_sincosTest_a, aip1E_21high_uid384_sincosTest_b, aip1E_21high_uid384_sincosTest_s)
    BEGIN
        IF (aip1E_21high_uid384_sincosTest_s = "1") THEN
            aip1E_21high_uid384_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_21high_uid384_sincosTest_a) + SIGNED(aip1E_21high_uid384_sincosTest_b));
        ELSE
            aip1E_21high_uid384_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_21high_uid384_sincosTest_a) - SIGNED(aip1E_21high_uid384_sincosTest_b));
        END IF;
    END PROCESS;
    aip1E_21high_uid384_sincosTest_q <= aip1E_21high_uid384_sincosTest_o(26 downto 0);

    -- lowRangeA_uid382_sincosTest(BITSELECT,381)@4
    lowRangeA_uid382_sincosTest_in <= aip1E_uid369_sincosTest_b(0 downto 0);
    lowRangeA_uid382_sincosTest_b <= lowRangeA_uid382_sincosTest_in(0 downto 0);

    -- aip1E_21_uid385_sincosTest(BITJOIN,384)@4
    aip1E_21_uid385_sincosTest_q <= aip1E_21high_uid384_sincosTest_q & lowRangeA_uid382_sincosTest_b;

    -- aip1E_uid388_sincosTest(BITSELECT,387)@4
    aip1E_uid388_sincosTest_in <= STD_LOGIC_VECTOR(aip1E_21_uid385_sincosTest_q(25 downto 0));
    aip1E_uid388_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid388_sincosTest_in(25 downto 0));

    -- xMSB_uid389_sincosTest(BITSELECT,388)@4
    xMSB_uid389_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid388_sincosTest_b(25 downto 25));

    -- cstArcTan2Mi_21_uid396_sincosTest(CONSTANT,395)
    cstArcTan2Mi_21_uid396_sincosTest_q <= "010000000000000000000000";

    -- highABits_uid402_sincosTest(BITSELECT,401)@4
    highABits_uid402_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid388_sincosTest_b(25 downto 1));

    -- aip1E_22high_uid403_sincosTest(ADDSUB,402)@4
    aip1E_22high_uid403_sincosTest_s <= xMSB_uid389_sincosTest_b;
    aip1E_22high_uid403_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((26 downto 25 => highABits_uid402_sincosTest_b(24)) & highABits_uid402_sincosTest_b));
    aip1E_22high_uid403_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((26 downto 24 => cstArcTan2Mi_21_uid396_sincosTest_q(23)) & cstArcTan2Mi_21_uid396_sincosTest_q));
    aip1E_22high_uid403_sincosTest_combproc: PROCESS (aip1E_22high_uid403_sincosTest_a, aip1E_22high_uid403_sincosTest_b, aip1E_22high_uid403_sincosTest_s)
    BEGIN
        IF (aip1E_22high_uid403_sincosTest_s = "1") THEN
            aip1E_22high_uid403_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_22high_uid403_sincosTest_a) + SIGNED(aip1E_22high_uid403_sincosTest_b));
        ELSE
            aip1E_22high_uid403_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_22high_uid403_sincosTest_a) - SIGNED(aip1E_22high_uid403_sincosTest_b));
        END IF;
    END PROCESS;
    aip1E_22high_uid403_sincosTest_q <= aip1E_22high_uid403_sincosTest_o(25 downto 0);

    -- lowRangeA_uid401_sincosTest(BITSELECT,400)@4
    lowRangeA_uid401_sincosTest_in <= aip1E_uid388_sincosTest_b(0 downto 0);
    lowRangeA_uid401_sincosTest_b <= lowRangeA_uid401_sincosTest_in(0 downto 0);

    -- aip1E_22_uid404_sincosTest(BITJOIN,403)@4
    aip1E_22_uid404_sincosTest_q <= aip1E_22high_uid403_sincosTest_q & lowRangeA_uid401_sincosTest_b;

    -- aip1E_uid407_sincosTest(BITSELECT,406)@4
    aip1E_uid407_sincosTest_in <= STD_LOGIC_VECTOR(aip1E_22_uid404_sincosTest_q(24 downto 0));
    aip1E_uid407_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid407_sincosTest_in(24 downto 0));

    -- redist21_aip1E_uid407_sincosTest_b_1(DELAY,682)
    redist21_aip1E_uid407_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 25, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => aip1E_uid407_sincosTest_b, xout => redist21_aip1E_uid407_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- xMSB_uid408_sincosTest(BITSELECT,407)@5
    xMSB_uid408_sincosTest_b <= STD_LOGIC_VECTOR(redist21_aip1E_uid407_sincosTest_b_1_q(24 downto 24));

    -- cstArcTan2Mi_22_uid415_sincosTest(CONSTANT,414)
    cstArcTan2Mi_22_uid415_sincosTest_q <= "01000000000000000000000";

    -- highABits_uid421_sincosTest(BITSELECT,420)@5
    highABits_uid421_sincosTest_b <= STD_LOGIC_VECTOR(redist21_aip1E_uid407_sincosTest_b_1_q(24 downto 1));

    -- aip1E_23high_uid422_sincosTest(ADDSUB,421)@5
    aip1E_23high_uid422_sincosTest_s <= xMSB_uid408_sincosTest_b;
    aip1E_23high_uid422_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((25 downto 24 => highABits_uid421_sincosTest_b(23)) & highABits_uid421_sincosTest_b));
    aip1E_23high_uid422_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((25 downto 23 => cstArcTan2Mi_22_uid415_sincosTest_q(22)) & cstArcTan2Mi_22_uid415_sincosTest_q));
    aip1E_23high_uid422_sincosTest_combproc: PROCESS (aip1E_23high_uid422_sincosTest_a, aip1E_23high_uid422_sincosTest_b, aip1E_23high_uid422_sincosTest_s)
    BEGIN
        IF (aip1E_23high_uid422_sincosTest_s = "1") THEN
            aip1E_23high_uid422_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_23high_uid422_sincosTest_a) + SIGNED(aip1E_23high_uid422_sincosTest_b));
        ELSE
            aip1E_23high_uid422_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_23high_uid422_sincosTest_a) - SIGNED(aip1E_23high_uid422_sincosTest_b));
        END IF;
    END PROCESS;
    aip1E_23high_uid422_sincosTest_q <= aip1E_23high_uid422_sincosTest_o(24 downto 0);

    -- lowRangeA_uid420_sincosTest(BITSELECT,419)@5
    lowRangeA_uid420_sincosTest_in <= redist21_aip1E_uid407_sincosTest_b_1_q(0 downto 0);
    lowRangeA_uid420_sincosTest_b <= lowRangeA_uid420_sincosTest_in(0 downto 0);

    -- aip1E_23_uid423_sincosTest(BITJOIN,422)@5
    aip1E_23_uid423_sincosTest_q <= aip1E_23high_uid422_sincosTest_q & lowRangeA_uid420_sincosTest_b;

    -- aip1E_uid426_sincosTest(BITSELECT,425)@5
    aip1E_uid426_sincosTest_in <= STD_LOGIC_VECTOR(aip1E_23_uid423_sincosTest_q(23 downto 0));
    aip1E_uid426_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid426_sincosTest_in(23 downto 0));

    -- xMSB_uid427_sincosTest(BITSELECT,426)@5
    xMSB_uid427_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid426_sincosTest_b(23 downto 23));

    -- cstArcTan2Mi_23_uid434_sincosTest(CONSTANT,433)
    cstArcTan2Mi_23_uid434_sincosTest_q <= "0100000000000000000000";

    -- highABits_uid440_sincosTest(BITSELECT,439)@5
    highABits_uid440_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid426_sincosTest_b(23 downto 1));

    -- aip1E_24high_uid441_sincosTest(ADDSUB,440)@5
    aip1E_24high_uid441_sincosTest_s <= xMSB_uid427_sincosTest_b;
    aip1E_24high_uid441_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 23 => highABits_uid440_sincosTest_b(22)) & highABits_uid440_sincosTest_b));
    aip1E_24high_uid441_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 22 => cstArcTan2Mi_23_uid434_sincosTest_q(21)) & cstArcTan2Mi_23_uid434_sincosTest_q));
    aip1E_24high_uid441_sincosTest_combproc: PROCESS (aip1E_24high_uid441_sincosTest_a, aip1E_24high_uid441_sincosTest_b, aip1E_24high_uid441_sincosTest_s)
    BEGIN
        IF (aip1E_24high_uid441_sincosTest_s = "1") THEN
            aip1E_24high_uid441_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_24high_uid441_sincosTest_a) + SIGNED(aip1E_24high_uid441_sincosTest_b));
        ELSE
            aip1E_24high_uid441_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_24high_uid441_sincosTest_a) - SIGNED(aip1E_24high_uid441_sincosTest_b));
        END IF;
    END PROCESS;
    aip1E_24high_uid441_sincosTest_q <= aip1E_24high_uid441_sincosTest_o(23 downto 0);

    -- lowRangeA_uid439_sincosTest(BITSELECT,438)@5
    lowRangeA_uid439_sincosTest_in <= aip1E_uid426_sincosTest_b(0 downto 0);
    lowRangeA_uid439_sincosTest_b <= lowRangeA_uid439_sincosTest_in(0 downto 0);

    -- aip1E_24_uid442_sincosTest(BITJOIN,441)@5
    aip1E_24_uid442_sincosTest_q <= aip1E_24high_uid441_sincosTest_q & lowRangeA_uid439_sincosTest_b;

    -- aip1E_uid445_sincosTest(BITSELECT,444)@5
    aip1E_uid445_sincosTest_in <= STD_LOGIC_VECTOR(aip1E_24_uid442_sincosTest_q(22 downto 0));
    aip1E_uid445_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid445_sincosTest_in(22 downto 0));

    -- xMSB_uid446_sincosTest(BITSELECT,445)@5
    xMSB_uid446_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid445_sincosTest_b(22 downto 22));

    -- cstArcTan2Mi_24_uid453_sincosTest(CONSTANT,452)
    cstArcTan2Mi_24_uid453_sincosTest_q <= "010000000000000000000";

    -- highABits_uid459_sincosTest(BITSELECT,458)@5
    highABits_uid459_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid445_sincosTest_b(22 downto 1));

    -- aip1E_25high_uid460_sincosTest(ADDSUB,459)@5
    aip1E_25high_uid460_sincosTest_s <= xMSB_uid446_sincosTest_b;
    aip1E_25high_uid460_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((23 downto 22 => highABits_uid459_sincosTest_b(21)) & highABits_uid459_sincosTest_b));
    aip1E_25high_uid460_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((23 downto 21 => cstArcTan2Mi_24_uid453_sincosTest_q(20)) & cstArcTan2Mi_24_uid453_sincosTest_q));
    aip1E_25high_uid460_sincosTest_combproc: PROCESS (aip1E_25high_uid460_sincosTest_a, aip1E_25high_uid460_sincosTest_b, aip1E_25high_uid460_sincosTest_s)
    BEGIN
        IF (aip1E_25high_uid460_sincosTest_s = "1") THEN
            aip1E_25high_uid460_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_25high_uid460_sincosTest_a) + SIGNED(aip1E_25high_uid460_sincosTest_b));
        ELSE
            aip1E_25high_uid460_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_25high_uid460_sincosTest_a) - SIGNED(aip1E_25high_uid460_sincosTest_b));
        END IF;
    END PROCESS;
    aip1E_25high_uid460_sincosTest_q <= aip1E_25high_uid460_sincosTest_o(22 downto 0);

    -- lowRangeA_uid458_sincosTest(BITSELECT,457)@5
    lowRangeA_uid458_sincosTest_in <= aip1E_uid445_sincosTest_b(0 downto 0);
    lowRangeA_uid458_sincosTest_b <= lowRangeA_uid458_sincosTest_in(0 downto 0);

    -- aip1E_25_uid461_sincosTest(BITJOIN,460)@5
    aip1E_25_uid461_sincosTest_q <= aip1E_25high_uid460_sincosTest_q & lowRangeA_uid458_sincosTest_b;

    -- aip1E_uid464_sincosTest(BITSELECT,463)@5
    aip1E_uid464_sincosTest_in <= STD_LOGIC_VECTOR(aip1E_25_uid461_sincosTest_q(21 downto 0));
    aip1E_uid464_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid464_sincosTest_in(21 downto 0));

    -- xMSB_uid465_sincosTest(BITSELECT,464)@5
    xMSB_uid465_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid464_sincosTest_b(21 downto 21));

    -- cstArcTan2Mi_25_uid472_sincosTest(CONSTANT,471)
    cstArcTan2Mi_25_uid472_sincosTest_q <= "01000000000000000000";

    -- highABits_uid478_sincosTest(BITSELECT,477)@5
    highABits_uid478_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid464_sincosTest_b(21 downto 1));

    -- aip1E_26high_uid479_sincosTest(ADDSUB,478)@5
    aip1E_26high_uid479_sincosTest_s <= xMSB_uid465_sincosTest_b;
    aip1E_26high_uid479_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((22 downto 21 => highABits_uid478_sincosTest_b(20)) & highABits_uid478_sincosTest_b));
    aip1E_26high_uid479_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((22 downto 20 => cstArcTan2Mi_25_uid472_sincosTest_q(19)) & cstArcTan2Mi_25_uid472_sincosTest_q));
    aip1E_26high_uid479_sincosTest_combproc: PROCESS (aip1E_26high_uid479_sincosTest_a, aip1E_26high_uid479_sincosTest_b, aip1E_26high_uid479_sincosTest_s)
    BEGIN
        IF (aip1E_26high_uid479_sincosTest_s = "1") THEN
            aip1E_26high_uid479_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_26high_uid479_sincosTest_a) + SIGNED(aip1E_26high_uid479_sincosTest_b));
        ELSE
            aip1E_26high_uid479_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_26high_uid479_sincosTest_a) - SIGNED(aip1E_26high_uid479_sincosTest_b));
        END IF;
    END PROCESS;
    aip1E_26high_uid479_sincosTest_q <= aip1E_26high_uid479_sincosTest_o(21 downto 0);

    -- lowRangeA_uid477_sincosTest(BITSELECT,476)@5
    lowRangeA_uid477_sincosTest_in <= aip1E_uid464_sincosTest_b(0 downto 0);
    lowRangeA_uid477_sincosTest_b <= lowRangeA_uid477_sincosTest_in(0 downto 0);

    -- aip1E_26_uid480_sincosTest(BITJOIN,479)@5
    aip1E_26_uid480_sincosTest_q <= aip1E_26high_uid479_sincosTest_q & lowRangeA_uid477_sincosTest_b;

    -- aip1E_uid483_sincosTest(BITSELECT,482)@5
    aip1E_uid483_sincosTest_in <= STD_LOGIC_VECTOR(aip1E_26_uid480_sincosTest_q(20 downto 0));
    aip1E_uid483_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid483_sincosTest_in(20 downto 0));

    -- xMSB_uid484_sincosTest(BITSELECT,483)@5
    xMSB_uid484_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid483_sincosTest_b(20 downto 20));

    -- cstArcTan2Mi_26_uid491_sincosTest(CONSTANT,490)
    cstArcTan2Mi_26_uid491_sincosTest_q <= "0100000000000000000";

    -- highABits_uid497_sincosTest(BITSELECT,496)@5
    highABits_uid497_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid483_sincosTest_b(20 downto 1));

    -- aip1E_27high_uid498_sincosTest(ADDSUB,497)@5
    aip1E_27high_uid498_sincosTest_s <= xMSB_uid484_sincosTest_b;
    aip1E_27high_uid498_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((21 downto 20 => highABits_uid497_sincosTest_b(19)) & highABits_uid497_sincosTest_b));
    aip1E_27high_uid498_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((21 downto 19 => cstArcTan2Mi_26_uid491_sincosTest_q(18)) & cstArcTan2Mi_26_uid491_sincosTest_q));
    aip1E_27high_uid498_sincosTest_combproc: PROCESS (aip1E_27high_uid498_sincosTest_a, aip1E_27high_uid498_sincosTest_b, aip1E_27high_uid498_sincosTest_s)
    BEGIN
        IF (aip1E_27high_uid498_sincosTest_s = "1") THEN
            aip1E_27high_uid498_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_27high_uid498_sincosTest_a) + SIGNED(aip1E_27high_uid498_sincosTest_b));
        ELSE
            aip1E_27high_uid498_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_27high_uid498_sincosTest_a) - SIGNED(aip1E_27high_uid498_sincosTest_b));
        END IF;
    END PROCESS;
    aip1E_27high_uid498_sincosTest_q <= aip1E_27high_uid498_sincosTest_o(20 downto 0);

    -- lowRangeA_uid496_sincosTest(BITSELECT,495)@5
    lowRangeA_uid496_sincosTest_in <= aip1E_uid483_sincosTest_b(0 downto 0);
    lowRangeA_uid496_sincosTest_b <= lowRangeA_uid496_sincosTest_in(0 downto 0);

    -- aip1E_27_uid499_sincosTest(BITJOIN,498)@5
    aip1E_27_uid499_sincosTest_q <= aip1E_27high_uid498_sincosTest_q & lowRangeA_uid496_sincosTest_b;

    -- aip1E_uid502_sincosTest(BITSELECT,501)@5
    aip1E_uid502_sincosTest_in <= STD_LOGIC_VECTOR(aip1E_27_uid499_sincosTest_q(19 downto 0));
    aip1E_uid502_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid502_sincosTest_in(19 downto 0));

    -- redist13_aip1E_uid502_sincosTest_b_1(DELAY,674)
    redist13_aip1E_uid502_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 20, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => aip1E_uid502_sincosTest_b, xout => redist13_aip1E_uid502_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- xMSB_uid503_sincosTest(BITSELECT,502)@6
    xMSB_uid503_sincosTest_b <= STD_LOGIC_VECTOR(redist13_aip1E_uid502_sincosTest_b_1_q(19 downto 19));

    -- cstArcTan2Mi_27_uid510_sincosTest(CONSTANT,509)
    cstArcTan2Mi_27_uid510_sincosTest_q <= "010000000000000000";

    -- highABits_uid516_sincosTest(BITSELECT,515)@6
    highABits_uid516_sincosTest_b <= STD_LOGIC_VECTOR(redist13_aip1E_uid502_sincosTest_b_1_q(19 downto 1));

    -- aip1E_28high_uid517_sincosTest(ADDSUB,516)@6
    aip1E_28high_uid517_sincosTest_s <= xMSB_uid503_sincosTest_b;
    aip1E_28high_uid517_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((20 downto 19 => highABits_uid516_sincosTest_b(18)) & highABits_uid516_sincosTest_b));
    aip1E_28high_uid517_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((20 downto 18 => cstArcTan2Mi_27_uid510_sincosTest_q(17)) & cstArcTan2Mi_27_uid510_sincosTest_q));
    aip1E_28high_uid517_sincosTest_combproc: PROCESS (aip1E_28high_uid517_sincosTest_a, aip1E_28high_uid517_sincosTest_b, aip1E_28high_uid517_sincosTest_s)
    BEGIN
        IF (aip1E_28high_uid517_sincosTest_s = "1") THEN
            aip1E_28high_uid517_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_28high_uid517_sincosTest_a) + SIGNED(aip1E_28high_uid517_sincosTest_b));
        ELSE
            aip1E_28high_uid517_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_28high_uid517_sincosTest_a) - SIGNED(aip1E_28high_uid517_sincosTest_b));
        END IF;
    END PROCESS;
    aip1E_28high_uid517_sincosTest_q <= aip1E_28high_uid517_sincosTest_o(19 downto 0);

    -- lowRangeA_uid515_sincosTest(BITSELECT,514)@6
    lowRangeA_uid515_sincosTest_in <= redist13_aip1E_uid502_sincosTest_b_1_q(0 downto 0);
    lowRangeA_uid515_sincosTest_b <= lowRangeA_uid515_sincosTest_in(0 downto 0);

    -- aip1E_28_uid518_sincosTest(BITJOIN,517)@6
    aip1E_28_uid518_sincosTest_q <= aip1E_28high_uid517_sincosTest_q & lowRangeA_uid515_sincosTest_b;

    -- aip1E_uid521_sincosTest(BITSELECT,520)@6
    aip1E_uid521_sincosTest_in <= STD_LOGIC_VECTOR(aip1E_28_uid518_sincosTest_q(18 downto 0));
    aip1E_uid521_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid521_sincosTest_in(18 downto 0));

    -- xMSB_uid522_sincosTest(BITSELECT,521)@6
    xMSB_uid522_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid521_sincosTest_b(18 downto 18));

    -- cstArcTan2Mi_28_uid529_sincosTest(CONSTANT,528)
    cstArcTan2Mi_28_uid529_sincosTest_q <= "01000000000000000";

    -- highABits_uid535_sincosTest(BITSELECT,534)@6
    highABits_uid535_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid521_sincosTest_b(18 downto 1));

    -- aip1E_29high_uid536_sincosTest(ADDSUB,535)@6
    aip1E_29high_uid536_sincosTest_s <= xMSB_uid522_sincosTest_b;
    aip1E_29high_uid536_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((19 downto 18 => highABits_uid535_sincosTest_b(17)) & highABits_uid535_sincosTest_b));
    aip1E_29high_uid536_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((19 downto 17 => cstArcTan2Mi_28_uid529_sincosTest_q(16)) & cstArcTan2Mi_28_uid529_sincosTest_q));
    aip1E_29high_uid536_sincosTest_combproc: PROCESS (aip1E_29high_uid536_sincosTest_a, aip1E_29high_uid536_sincosTest_b, aip1E_29high_uid536_sincosTest_s)
    BEGIN
        IF (aip1E_29high_uid536_sincosTest_s = "1") THEN
            aip1E_29high_uid536_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_29high_uid536_sincosTest_a) + SIGNED(aip1E_29high_uid536_sincosTest_b));
        ELSE
            aip1E_29high_uid536_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_29high_uid536_sincosTest_a) - SIGNED(aip1E_29high_uid536_sincosTest_b));
        END IF;
    END PROCESS;
    aip1E_29high_uid536_sincosTest_q <= aip1E_29high_uid536_sincosTest_o(18 downto 0);

    -- lowRangeA_uid534_sincosTest(BITSELECT,533)@6
    lowRangeA_uid534_sincosTest_in <= aip1E_uid521_sincosTest_b(0 downto 0);
    lowRangeA_uid534_sincosTest_b <= lowRangeA_uid534_sincosTest_in(0 downto 0);

    -- aip1E_29_uid537_sincosTest(BITJOIN,536)@6
    aip1E_29_uid537_sincosTest_q <= aip1E_29high_uid536_sincosTest_q & lowRangeA_uid534_sincosTest_b;

    -- aip1E_uid540_sincosTest(BITSELECT,539)@6
    aip1E_uid540_sincosTest_in <= STD_LOGIC_VECTOR(aip1E_29_uid537_sincosTest_q(17 downto 0));
    aip1E_uid540_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid540_sincosTest_in(17 downto 0));

    -- xMSB_uid541_sincosTest(BITSELECT,540)@6
    xMSB_uid541_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid540_sincosTest_b(17 downto 17));

    -- cstArcTan2Mi_29_uid548_sincosTest(CONSTANT,547)
    cstArcTan2Mi_29_uid548_sincosTest_q <= "0100000000000000";

    -- highABits_uid554_sincosTest(BITSELECT,553)@6
    highABits_uid554_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid540_sincosTest_b(17 downto 1));

    -- aip1E_30high_uid555_sincosTest(ADDSUB,554)@6
    aip1E_30high_uid555_sincosTest_s <= xMSB_uid541_sincosTest_b;
    aip1E_30high_uid555_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((18 downto 17 => highABits_uid554_sincosTest_b(16)) & highABits_uid554_sincosTest_b));
    aip1E_30high_uid555_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((18 downto 16 => cstArcTan2Mi_29_uid548_sincosTest_q(15)) & cstArcTan2Mi_29_uid548_sincosTest_q));
    aip1E_30high_uid555_sincosTest_combproc: PROCESS (aip1E_30high_uid555_sincosTest_a, aip1E_30high_uid555_sincosTest_b, aip1E_30high_uid555_sincosTest_s)
    BEGIN
        IF (aip1E_30high_uid555_sincosTest_s = "1") THEN
            aip1E_30high_uid555_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_30high_uid555_sincosTest_a) + SIGNED(aip1E_30high_uid555_sincosTest_b));
        ELSE
            aip1E_30high_uid555_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_30high_uid555_sincosTest_a) - SIGNED(aip1E_30high_uid555_sincosTest_b));
        END IF;
    END PROCESS;
    aip1E_30high_uid555_sincosTest_q <= aip1E_30high_uid555_sincosTest_o(17 downto 0);

    -- lowRangeA_uid553_sincosTest(BITSELECT,552)@6
    lowRangeA_uid553_sincosTest_in <= aip1E_uid540_sincosTest_b(0 downto 0);
    lowRangeA_uid553_sincosTest_b <= lowRangeA_uid553_sincosTest_in(0 downto 0);

    -- aip1E_30_uid556_sincosTest(BITJOIN,555)@6
    aip1E_30_uid556_sincosTest_q <= aip1E_30high_uid555_sincosTest_q & lowRangeA_uid553_sincosTest_b;

    -- aip1E_uid559_sincosTest(BITSELECT,558)@6
    aip1E_uid559_sincosTest_in <= STD_LOGIC_VECTOR(aip1E_30_uid556_sincosTest_q(16 downto 0));
    aip1E_uid559_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid559_sincosTest_in(16 downto 0));

    -- xMSB_uid560_sincosTest(BITSELECT,559)@6
    xMSB_uid560_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid559_sincosTest_b(16 downto 16));

    -- cstArcTan2Mi_30_uid567_sincosTest(CONSTANT,566)
    cstArcTan2Mi_30_uid567_sincosTest_q <= "010000000000000";

    -- highABits_uid573_sincosTest(BITSELECT,572)@6
    highABits_uid573_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid559_sincosTest_b(16 downto 1));

    -- aip1E_31high_uid574_sincosTest(ADDSUB,573)@6
    aip1E_31high_uid574_sincosTest_s <= xMSB_uid560_sincosTest_b;
    aip1E_31high_uid574_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((17 downto 16 => highABits_uid573_sincosTest_b(15)) & highABits_uid573_sincosTest_b));
    aip1E_31high_uid574_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((17 downto 15 => cstArcTan2Mi_30_uid567_sincosTest_q(14)) & cstArcTan2Mi_30_uid567_sincosTest_q));
    aip1E_31high_uid574_sincosTest_combproc: PROCESS (aip1E_31high_uid574_sincosTest_a, aip1E_31high_uid574_sincosTest_b, aip1E_31high_uid574_sincosTest_s)
    BEGIN
        IF (aip1E_31high_uid574_sincosTest_s = "1") THEN
            aip1E_31high_uid574_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_31high_uid574_sincosTest_a) + SIGNED(aip1E_31high_uid574_sincosTest_b));
        ELSE
            aip1E_31high_uid574_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_31high_uid574_sincosTest_a) - SIGNED(aip1E_31high_uid574_sincosTest_b));
        END IF;
    END PROCESS;
    aip1E_31high_uid574_sincosTest_q <= aip1E_31high_uid574_sincosTest_o(16 downto 0);

    -- lowRangeA_uid572_sincosTest(BITSELECT,571)@6
    lowRangeA_uid572_sincosTest_in <= aip1E_uid559_sincosTest_b(0 downto 0);
    lowRangeA_uid572_sincosTest_b <= lowRangeA_uid572_sincosTest_in(0 downto 0);

    -- aip1E_31_uid575_sincosTest(BITJOIN,574)@6
    aip1E_31_uid575_sincosTest_q <= aip1E_31high_uid574_sincosTest_q & lowRangeA_uid572_sincosTest_b;

    -- aip1E_uid578_sincosTest(BITSELECT,577)@6
    aip1E_uid578_sincosTest_in <= STD_LOGIC_VECTOR(aip1E_31_uid575_sincosTest_q(15 downto 0));
    aip1E_uid578_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid578_sincosTest_in(15 downto 0));

    -- xMSB_uid579_sincosTest(BITSELECT,578)@6
    xMSB_uid579_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid578_sincosTest_b(15 downto 15));

    -- cstArcTan2Mi_31_uid586_sincosTest(CONSTANT,585)
    cstArcTan2Mi_31_uid586_sincosTest_q <= "01000000000000";

    -- highABits_uid592_sincosTest(BITSELECT,591)@6
    highABits_uid592_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid578_sincosTest_b(15 downto 1));

    -- aip1E_32high_uid593_sincosTest(ADDSUB,592)@6
    aip1E_32high_uid593_sincosTest_s <= xMSB_uid579_sincosTest_b;
    aip1E_32high_uid593_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 15 => highABits_uid592_sincosTest_b(14)) & highABits_uid592_sincosTest_b));
    aip1E_32high_uid593_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 14 => cstArcTan2Mi_31_uid586_sincosTest_q(13)) & cstArcTan2Mi_31_uid586_sincosTest_q));
    aip1E_32high_uid593_sincosTest_combproc: PROCESS (aip1E_32high_uid593_sincosTest_a, aip1E_32high_uid593_sincosTest_b, aip1E_32high_uid593_sincosTest_s)
    BEGIN
        IF (aip1E_32high_uid593_sincosTest_s = "1") THEN
            aip1E_32high_uid593_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_32high_uid593_sincosTest_a) + SIGNED(aip1E_32high_uid593_sincosTest_b));
        ELSE
            aip1E_32high_uid593_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_32high_uid593_sincosTest_a) - SIGNED(aip1E_32high_uid593_sincosTest_b));
        END IF;
    END PROCESS;
    aip1E_32high_uid593_sincosTest_q <= aip1E_32high_uid593_sincosTest_o(15 downto 0);

    -- lowRangeA_uid591_sincosTest(BITSELECT,590)@6
    lowRangeA_uid591_sincosTest_in <= aip1E_uid578_sincosTest_b(0 downto 0);
    lowRangeA_uid591_sincosTest_b <= lowRangeA_uid591_sincosTest_in(0 downto 0);

    -- aip1E_32_uid594_sincosTest(BITJOIN,593)@6
    aip1E_32_uid594_sincosTest_q <= aip1E_32high_uid593_sincosTest_q & lowRangeA_uid591_sincosTest_b;

    -- aip1E_uid597_sincosTest(BITSELECT,596)@6
    aip1E_uid597_sincosTest_in <= STD_LOGIC_VECTOR(aip1E_32_uid594_sincosTest_q(14 downto 0));
    aip1E_uid597_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid597_sincosTest_in(14 downto 0));

    -- xMSB_uid598_sincosTest(BITSELECT,597)@6
    xMSB_uid598_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid597_sincosTest_b(14 downto 14));

    -- cstArcTan2Mi_32_uid605_sincosTest(CONSTANT,604)
    cstArcTan2Mi_32_uid605_sincosTest_q <= "0100000000000";

    -- highABits_uid611_sincosTest(BITSELECT,610)@6
    highABits_uid611_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid597_sincosTest_b(14 downto 1));

    -- aip1E_33high_uid612_sincosTest(ADDSUB,611)@6
    aip1E_33high_uid612_sincosTest_s <= xMSB_uid598_sincosTest_b;
    aip1E_33high_uid612_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((15 downto 14 => highABits_uid611_sincosTest_b(13)) & highABits_uid611_sincosTest_b));
    aip1E_33high_uid612_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((15 downto 13 => cstArcTan2Mi_32_uid605_sincosTest_q(12)) & cstArcTan2Mi_32_uid605_sincosTest_q));
    aip1E_33high_uid612_sincosTest_combproc: PROCESS (aip1E_33high_uid612_sincosTest_a, aip1E_33high_uid612_sincosTest_b, aip1E_33high_uid612_sincosTest_s)
    BEGIN
        IF (aip1E_33high_uid612_sincosTest_s = "1") THEN
            aip1E_33high_uid612_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_33high_uid612_sincosTest_a) + SIGNED(aip1E_33high_uid612_sincosTest_b));
        ELSE
            aip1E_33high_uid612_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_33high_uid612_sincosTest_a) - SIGNED(aip1E_33high_uid612_sincosTest_b));
        END IF;
    END PROCESS;
    aip1E_33high_uid612_sincosTest_q <= aip1E_33high_uid612_sincosTest_o(14 downto 0);

    -- lowRangeA_uid610_sincosTest(BITSELECT,609)@6
    lowRangeA_uid610_sincosTest_in <= aip1E_uid597_sincosTest_b(0 downto 0);
    lowRangeA_uid610_sincosTest_b <= lowRangeA_uid610_sincosTest_in(0 downto 0);

    -- aip1E_33_uid613_sincosTest(BITJOIN,612)@6
    aip1E_33_uid613_sincosTest_q <= aip1E_33high_uid612_sincosTest_q & lowRangeA_uid610_sincosTest_b;

    -- aip1E_uid616_sincosTest(BITSELECT,615)@6
    aip1E_uid616_sincosTest_in <= STD_LOGIC_VECTOR(aip1E_33_uid613_sincosTest_q(13 downto 0));
    aip1E_uid616_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid616_sincosTest_in(13 downto 0));

    -- xMSB_uid617_sincosTest(BITSELECT,616)@6
    xMSB_uid617_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid616_sincosTest_b(13 downto 13));

    -- redist2_xMSB_uid617_sincosTest_b_3(DELAY,663)
    redist2_xMSB_uid617_sincosTest_b_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => xMSB_uid617_sincosTest_b, xout => redist2_xMSB_uid617_sincosTest_b_3_q, clk => clk, aclr => areset );

    -- signOfSelectionSignal_uid619_sincosTest(LOGICAL,618)@9
    signOfSelectionSignal_uid619_sincosTest_q <= not (redist2_xMSB_uid617_sincosTest_b_3_q);

    -- redist3_xMSB_uid598_sincosTest_b_3(DELAY,664)
    redist3_xMSB_uid598_sincosTest_b_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => xMSB_uid598_sincosTest_b, xout => redist3_xMSB_uid598_sincosTest_b_3_q, clk => clk, aclr => areset );

    -- redist6_xMSB_uid579_sincosTest_b_2(DELAY,667)
    redist6_xMSB_uid579_sincosTest_b_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => xMSB_uid579_sincosTest_b, xout => redist6_xMSB_uid579_sincosTest_b_2_q, clk => clk, aclr => areset );

    -- signOfSelectionSignal_uid581_sincosTest(LOGICAL,580)@8
    signOfSelectionSignal_uid581_sincosTest_q <= not (redist6_xMSB_uid579_sincosTest_b_2_q);

    -- redist7_xMSB_uid560_sincosTest_b_2(DELAY,668)
    redist7_xMSB_uid560_sincosTest_b_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => xMSB_uid560_sincosTest_b, xout => redist7_xMSB_uid560_sincosTest_b_2_q, clk => clk, aclr => areset );

    -- redist8_xMSB_uid541_sincosTest_b_2(DELAY,669)
    redist8_xMSB_uid541_sincosTest_b_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => xMSB_uid541_sincosTest_b, xout => redist8_xMSB_uid541_sincosTest_b_2_q, clk => clk, aclr => areset );

    -- signOfSelectionSignal_uid543_sincosTest(LOGICAL,542)@8
    signOfSelectionSignal_uid543_sincosTest_q <= not (redist8_xMSB_uid541_sincosTest_b_2_q);

    -- redist9_xMSB_uid522_sincosTest_b_2(DELAY,670)
    redist9_xMSB_uid522_sincosTest_b_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => xMSB_uid522_sincosTest_b, xout => redist9_xMSB_uid522_sincosTest_b_2_q, clk => clk, aclr => areset );

    -- redist12_xMSB_uid503_sincosTest_b_1(DELAY,673)
    redist12_xMSB_uid503_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xMSB_uid503_sincosTest_b, xout => redist12_xMSB_uid503_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- signOfSelectionSignal_uid505_sincosTest(LOGICAL,504)@7
    signOfSelectionSignal_uid505_sincosTest_q <= not (redist12_xMSB_uid503_sincosTest_b_1_q);

    -- redist14_xMSB_uid484_sincosTest_b_2(DELAY,675)
    redist14_xMSB_uid484_sincosTest_b_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => xMSB_uid484_sincosTest_b, xout => redist14_xMSB_uid484_sincosTest_b_2_q, clk => clk, aclr => areset );

    -- redist15_xMSB_uid465_sincosTest_b_2(DELAY,676)
    redist15_xMSB_uid465_sincosTest_b_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => xMSB_uid465_sincosTest_b, xout => redist15_xMSB_uid465_sincosTest_b_2_q, clk => clk, aclr => areset );

    -- signOfSelectionSignal_uid467_sincosTest(LOGICAL,466)@7
    signOfSelectionSignal_uid467_sincosTest_q <= not (redist15_xMSB_uid465_sincosTest_b_2_q);

    -- redist16_xMSB_uid446_sincosTest_b_2(DELAY,677)
    redist16_xMSB_uid446_sincosTest_b_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => xMSB_uid446_sincosTest_b, xout => redist16_xMSB_uid446_sincosTest_b_2_q, clk => clk, aclr => areset );

    -- redist19_xMSB_uid427_sincosTest_b_1(DELAY,680)
    redist19_xMSB_uid427_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xMSB_uid427_sincosTest_b, xout => redist19_xMSB_uid427_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- signOfSelectionSignal_uid429_sincosTest(LOGICAL,428)@6
    signOfSelectionSignal_uid429_sincosTest_q <= not (redist19_xMSB_uid427_sincosTest_b_1_q);

    -- redist20_xMSB_uid408_sincosTest_b_1(DELAY,681)
    redist20_xMSB_uid408_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xMSB_uid408_sincosTest_b, xout => redist20_xMSB_uid408_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- redist22_xMSB_uid389_sincosTest_b_2(DELAY,683)
    redist22_xMSB_uid389_sincosTest_b_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => xMSB_uid389_sincosTest_b, xout => redist22_xMSB_uid389_sincosTest_b_2_q, clk => clk, aclr => areset );

    -- signOfSelectionSignal_uid391_sincosTest(LOGICAL,390)@6
    signOfSelectionSignal_uid391_sincosTest_q <= not (redist22_xMSB_uid389_sincosTest_b_2_q);

    -- redist23_xMSB_uid370_sincosTest_b_2(DELAY,684)
    redist23_xMSB_uid370_sincosTest_b_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => xMSB_uid370_sincosTest_b, xout => redist23_xMSB_uid370_sincosTest_b_2_q, clk => clk, aclr => areset );

    -- redist26_xMSB_uid351_sincosTest_b_1(DELAY,687)
    redist26_xMSB_uid351_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xMSB_uid351_sincosTest_b, xout => redist26_xMSB_uid351_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- signOfSelectionSignal_uid353_sincosTest(LOGICAL,352)@5
    signOfSelectionSignal_uid353_sincosTest_q <= not (redist26_xMSB_uid351_sincosTest_b_1_q);

    -- redist27_xMSB_uid332_sincosTest_b_1(DELAY,688)
    redist27_xMSB_uid332_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xMSB_uid332_sincosTest_b, xout => redist27_xMSB_uid332_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- redist28_xMSB_uid313_sincosTest_b_1(DELAY,689)
    redist28_xMSB_uid313_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xMSB_uid313_sincosTest_b, xout => redist28_xMSB_uid313_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- signOfSelectionSignal_uid315_sincosTest(LOGICAL,314)@5
    signOfSelectionSignal_uid315_sincosTest_q <= not (redist28_xMSB_uid313_sincosTest_b_1_q);

    -- redist30_xMSB_uid294_sincosTest_b_2(DELAY,691)
    redist30_xMSB_uid294_sincosTest_b_2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => xMSB_uid294_sincosTest_b, xout => redist30_xMSB_uid294_sincosTest_b_2_q, clk => clk, aclr => areset );

    -- redist33_xMSB_uid275_sincosTest_b_1(DELAY,694)
    redist33_xMSB_uid275_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xMSB_uid275_sincosTest_b, xout => redist33_xMSB_uid275_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- signOfSelectionSignal_uid277_sincosTest(LOGICAL,276)@4
    signOfSelectionSignal_uid277_sincosTest_q <= not (redist33_xMSB_uid275_sincosTest_b_1_q);

    -- redist34_xMSB_uid259_sincosTest_b_1(DELAY,695)
    redist34_xMSB_uid259_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xMSB_uid259_sincosTest_b, xout => redist34_xMSB_uid259_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- redist35_xMSB_uid243_sincosTest_b_1(DELAY,696)
    redist35_xMSB_uid243_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xMSB_uid243_sincosTest_b, xout => redist35_xMSB_uid243_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- signOfSelectionSignal_uid245_sincosTest(LOGICAL,244)@4
    signOfSelectionSignal_uid245_sincosTest_q <= not (redist35_xMSB_uid243_sincosTest_b_1_q);

    -- redist36_xMSB_uid227_sincosTest_b_1(DELAY,697)
    redist36_xMSB_uid227_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xMSB_uid227_sincosTest_b, xout => redist36_xMSB_uid227_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- redist40_xMSB_uid211_sincosTest_b_1(DELAY,701)
    redist40_xMSB_uid211_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xMSB_uid211_sincosTest_b, xout => redist40_xMSB_uid211_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- signOfSelectionSignal_uid213_sincosTest(LOGICAL,212)@3
    signOfSelectionSignal_uid213_sincosTest_q <= not (redist40_xMSB_uid211_sincosTest_b_1_q);

    -- redist41_xMSB_uid195_sincosTest_b_1(DELAY,702)
    redist41_xMSB_uid195_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xMSB_uid195_sincosTest_b, xout => redist41_xMSB_uid195_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- redist42_xMSB_uid179_sincosTest_b_1(DELAY,703)
    redist42_xMSB_uid179_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xMSB_uid179_sincosTest_b, xout => redist42_xMSB_uid179_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- signOfSelectionSignal_uid181_sincosTest(LOGICAL,180)@3
    signOfSelectionSignal_uid181_sincosTest_q <= not (redist42_xMSB_uid179_sincosTest_b_1_q);

    -- redist43_xMSB_uid163_sincosTest_b_1(DELAY,704)
    redist43_xMSB_uid163_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xMSB_uid163_sincosTest_b, xout => redist43_xMSB_uid163_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- signOfSelectionSignal_uid149_sincosTest(LOGICAL,148)@2
    signOfSelectionSignal_uid149_sincosTest_q <= not (xMSB_uid147_sincosTest_b);

    -- redist47_xMSB_uid131_sincosTest_b_1(DELAY,708)
    redist47_xMSB_uid131_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xMSB_uid131_sincosTest_b, xout => redist47_xMSB_uid131_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- redist48_xMSB_uid115_sincosTest_b_1(DELAY,709)
    redist48_xMSB_uid115_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xMSB_uid115_sincosTest_b, xout => redist48_xMSB_uid115_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- signOfSelectionSignal_uid117_sincosTest(LOGICAL,116)@2
    signOfSelectionSignal_uid117_sincosTest_q <= not (redist48_xMSB_uid115_sincosTest_b_1_q);

    -- redist49_xMSB_uid99_sincosTest_b_1(DELAY,710)
    redist49_xMSB_uid99_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xMSB_uid99_sincosTest_b, xout => redist49_xMSB_uid99_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- signOfSelectionSignal_uid85_sincosTest(LOGICAL,84)@1
    signOfSelectionSignal_uid85_sincosTest_q <= not (xMSB_uid83_sincosTest_b);

    -- redist53_xMSB_uid51_sincosTest_b_1(DELAY,714)
    redist53_xMSB_uid51_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xMSB_uid51_sincosTest_b, xout => redist53_xMSB_uid51_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- signOfSelectionSignal_uid53_sincosTest(LOGICAL,52)@1
    signOfSelectionSignal_uid53_sincosTest_q <= not (redist53_xMSB_uid51_sincosTest_b_1_q);

    -- cstOneOverK_uid22_sincosTest(CONSTANT,21)
    cstOneOverK_uid22_sincosTest_q <= "10011011011101001110110110101000010000110101111000000000000000000000";

    -- xip1E_1_uid32_sincosTest(BITJOIN,31)@1
    xip1E_1_uid32_sincosTest_q <= STD_LOGIC_VECTOR((2 downto 1 => GND_q(0)) & GND_q) & cstOneOverK_uid22_sincosTest_q;

    -- xip1_1_topRange_uid41_sincosTest(BITSELECT,40)@1
    xip1_1_topRange_uid41_sincosTest_in <= xip1E_1_uid32_sincosTest_q(69 downto 0);
    xip1_1_topRange_uid41_sincosTest_b <= xip1_1_topRange_uid41_sincosTest_in(69 downto 0);

    -- xip1_1_mergedSignalTM_uid42_sincosTest(BITJOIN,41)@1
    xip1_1_mergedSignalTM_uid42_sincosTest_q <= GND_q & xip1_1_topRange_uid41_sincosTest_b;

    -- twoToMiSiXip_uid56_sincosTest(BITSELECT,55)@1
    twoToMiSiXip_uid56_sincosTest_b <= STD_LOGIC_VECTOR(xip1_1_mergedSignalTM_uid42_sincosTest_q(70 downto 1));

    -- xMSB_uid44_sincosTest(BITSELECT,43)@1
    xMSB_uid44_sincosTest_b <= STD_LOGIC_VECTOR(yip1E_1sumAHighB_uid35_sincosTest_q(69 downto 69));

    -- yip1E_1CostZeroPaddingA_uid33_sincosTest(CONSTANT,32)
    yip1E_1CostZeroPaddingA_uid33_sincosTest_q <= "00000000000000000000000000000000000000000000000000000000000000000000";

    -- yip1E_1NA_uid34_sincosTest(BITJOIN,33)@1
    yip1E_1NA_uid34_sincosTest_q <= GND_q & yip1E_1CostZeroPaddingA_uid33_sincosTest_q;

    -- yip1E_1sumAHighB_uid35_sincosTest(ADDSUB,34)@1
    yip1E_1sumAHighB_uid35_sincosTest_s <= VCC_q;
    yip1E_1sumAHighB_uid35_sincosTest_a <= STD_LOGIC_VECTOR("00" & yip1E_1NA_uid34_sincosTest_q);
    yip1E_1sumAHighB_uid35_sincosTest_b <= STD_LOGIC_VECTOR("000" & cstOneOverK_uid22_sincosTest_q);
    yip1E_1sumAHighB_uid35_sincosTest_combproc: PROCESS (yip1E_1sumAHighB_uid35_sincosTest_a, yip1E_1sumAHighB_uid35_sincosTest_b, yip1E_1sumAHighB_uid35_sincosTest_s)
    BEGIN
        IF (yip1E_1sumAHighB_uid35_sincosTest_s = "1") THEN
            yip1E_1sumAHighB_uid35_sincosTest_o <= STD_LOGIC_VECTOR(UNSIGNED(yip1E_1sumAHighB_uid35_sincosTest_a) + UNSIGNED(yip1E_1sumAHighB_uid35_sincosTest_b));
        ELSE
            yip1E_1sumAHighB_uid35_sincosTest_o <= STD_LOGIC_VECTOR(UNSIGNED(yip1E_1sumAHighB_uid35_sincosTest_a) - UNSIGNED(yip1E_1sumAHighB_uid35_sincosTest_b));
        END IF;
    END PROCESS;
    yip1E_1sumAHighB_uid35_sincosTest_q <= yip1E_1sumAHighB_uid35_sincosTest_o(69 downto 0);

    -- yip1_1_mergedSignalTM_uid48_sincosTest(BITJOIN,47)@1
    yip1_1_mergedSignalTM_uid48_sincosTest_q <= xMSB_uid44_sincosTest_b & yip1E_1sumAHighB_uid35_sincosTest_q;

    -- yip1E_2_uid61_sincosTest(ADDSUB,60)@1
    yip1E_2_uid61_sincosTest_s <= signOfSelectionSignal_uid53_sincosTest_q;
    yip1E_2_uid61_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((72 downto 71 => yip1_1_mergedSignalTM_uid48_sincosTest_q(70)) & yip1_1_mergedSignalTM_uid48_sincosTest_q));
    yip1E_2_uid61_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((72 downto 70 => twoToMiSiXip_uid56_sincosTest_b(69)) & twoToMiSiXip_uid56_sincosTest_b));
    yip1E_2_uid61_sincosTest_combproc: PROCESS (yip1E_2_uid61_sincosTest_a, yip1E_2_uid61_sincosTest_b, yip1E_2_uid61_sincosTest_s)
    BEGIN
        IF (yip1E_2_uid61_sincosTest_s = "1") THEN
            yip1E_2_uid61_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_2_uid61_sincosTest_a) + SIGNED(yip1E_2_uid61_sincosTest_b));
        ELSE
            yip1E_2_uid61_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_2_uid61_sincosTest_a) - SIGNED(yip1E_2_uid61_sincosTest_b));
        END IF;
    END PROCESS;
    yip1E_2_uid61_sincosTest_q <= yip1E_2_uid61_sincosTest_o(71 downto 0);

    -- yip1_2_uid65_sincosTest(BITSELECT,64)@1
    yip1_2_uid65_sincosTest_in <= STD_LOGIC_VECTOR(yip1E_2_uid61_sincosTest_q(70 downto 0));
    yip1_2_uid65_sincosTest_b <= STD_LOGIC_VECTOR(yip1_2_uid65_sincosTest_in(70 downto 0));

    -- twoToMiSiYip_uid73_sincosTest(BITSELECT,72)@1
    twoToMiSiYip_uid73_sincosTest_b <= STD_LOGIC_VECTOR(yip1_2_uid65_sincosTest_b(70 downto 2));

    -- twoToMiSiYip_uid57_sincosTest(BITSELECT,56)@1
    twoToMiSiYip_uid57_sincosTest_b <= STD_LOGIC_VECTOR(yip1_1_mergedSignalTM_uid48_sincosTest_q(70 downto 1));

    -- xip1E_2_uid60_sincosTest(ADDSUB,59)@1
    xip1E_2_uid60_sincosTest_s <= redist53_xMSB_uid51_sincosTest_b_1_q;
    xip1E_2_uid60_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((72 downto 71 => xip1_1_mergedSignalTM_uid42_sincosTest_q(70)) & xip1_1_mergedSignalTM_uid42_sincosTest_q));
    xip1E_2_uid60_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((72 downto 70 => twoToMiSiYip_uid57_sincosTest_b(69)) & twoToMiSiYip_uid57_sincosTest_b));
    xip1E_2_uid60_sincosTest_combproc: PROCESS (xip1E_2_uid60_sincosTest_a, xip1E_2_uid60_sincosTest_b, xip1E_2_uid60_sincosTest_s)
    BEGIN
        IF (xip1E_2_uid60_sincosTest_s = "1") THEN
            xip1E_2_uid60_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_2_uid60_sincosTest_a) + SIGNED(xip1E_2_uid60_sincosTest_b));
        ELSE
            xip1E_2_uid60_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_2_uid60_sincosTest_a) - SIGNED(xip1E_2_uid60_sincosTest_b));
        END IF;
    END PROCESS;
    xip1E_2_uid60_sincosTest_q <= xip1E_2_uid60_sincosTest_o(71 downto 0);

    -- xip1_2_uid64_sincosTest(BITSELECT,63)@1
    xip1_2_uid64_sincosTest_in <= STD_LOGIC_VECTOR(xip1E_2_uid60_sincosTest_q(70 downto 0));
    xip1_2_uid64_sincosTest_b <= STD_LOGIC_VECTOR(xip1_2_uid64_sincosTest_in(70 downto 0));

    -- xip1E_3_uid76_sincosTest(ADDSUB,75)@1
    xip1E_3_uid76_sincosTest_s <= xMSB_uid67_sincosTest_b;
    xip1E_3_uid76_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((72 downto 71 => xip1_2_uid64_sincosTest_b(70)) & xip1_2_uid64_sincosTest_b));
    xip1E_3_uid76_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((72 downto 69 => twoToMiSiYip_uid73_sincosTest_b(68)) & twoToMiSiYip_uid73_sincosTest_b));
    xip1E_3_uid76_sincosTest_combproc: PROCESS (xip1E_3_uid76_sincosTest_a, xip1E_3_uid76_sincosTest_b, xip1E_3_uid76_sincosTest_s)
    BEGIN
        IF (xip1E_3_uid76_sincosTest_s = "1") THEN
            xip1E_3_uid76_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_3_uid76_sincosTest_a) + SIGNED(xip1E_3_uid76_sincosTest_b));
        ELSE
            xip1E_3_uid76_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_3_uid76_sincosTest_a) - SIGNED(xip1E_3_uid76_sincosTest_b));
        END IF;
    END PROCESS;
    xip1E_3_uid76_sincosTest_q <= xip1E_3_uid76_sincosTest_o(71 downto 0);

    -- xip1_3_uid80_sincosTest(BITSELECT,79)@1
    xip1_3_uid80_sincosTest_in <= STD_LOGIC_VECTOR(xip1E_3_uid76_sincosTest_q(70 downto 0));
    xip1_3_uid80_sincosTest_b <= STD_LOGIC_VECTOR(xip1_3_uid80_sincosTest_in(70 downto 0));

    -- twoToMiSiXip_uid88_sincosTest(BITSELECT,87)@1
    twoToMiSiXip_uid88_sincosTest_b <= STD_LOGIC_VECTOR(xip1_3_uid80_sincosTest_b(70 downto 3));

    -- signOfSelectionSignal_uid69_sincosTest(LOGICAL,68)@1
    signOfSelectionSignal_uid69_sincosTest_q <= not (xMSB_uid67_sincosTest_b);

    -- twoToMiSiXip_uid72_sincosTest(BITSELECT,71)@1
    twoToMiSiXip_uid72_sincosTest_b <= STD_LOGIC_VECTOR(xip1_2_uid64_sincosTest_b(70 downto 2));

    -- yip1E_3_uid77_sincosTest(ADDSUB,76)@1
    yip1E_3_uid77_sincosTest_s <= signOfSelectionSignal_uid69_sincosTest_q;
    yip1E_3_uid77_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((72 downto 71 => yip1_2_uid65_sincosTest_b(70)) & yip1_2_uid65_sincosTest_b));
    yip1E_3_uid77_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((72 downto 69 => twoToMiSiXip_uid72_sincosTest_b(68)) & twoToMiSiXip_uid72_sincosTest_b));
    yip1E_3_uid77_sincosTest_combproc: PROCESS (yip1E_3_uid77_sincosTest_a, yip1E_3_uid77_sincosTest_b, yip1E_3_uid77_sincosTest_s)
    BEGIN
        IF (yip1E_3_uid77_sincosTest_s = "1") THEN
            yip1E_3_uid77_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_3_uid77_sincosTest_a) + SIGNED(yip1E_3_uid77_sincosTest_b));
        ELSE
            yip1E_3_uid77_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_3_uid77_sincosTest_a) - SIGNED(yip1E_3_uid77_sincosTest_b));
        END IF;
    END PROCESS;
    yip1E_3_uid77_sincosTest_q <= yip1E_3_uid77_sincosTest_o(71 downto 0);

    -- yip1_3_uid81_sincosTest(BITSELECT,80)@1
    yip1_3_uid81_sincosTest_in <= STD_LOGIC_VECTOR(yip1E_3_uid77_sincosTest_q(70 downto 0));
    yip1_3_uid81_sincosTest_b <= STD_LOGIC_VECTOR(yip1_3_uid81_sincosTest_in(70 downto 0));

    -- yip1E_4_uid93_sincosTest(ADDSUB,92)@1
    yip1E_4_uid93_sincosTest_s <= signOfSelectionSignal_uid85_sincosTest_q;
    yip1E_4_uid93_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((72 downto 71 => yip1_3_uid81_sincosTest_b(70)) & yip1_3_uid81_sincosTest_b));
    yip1E_4_uid93_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((72 downto 68 => twoToMiSiXip_uid88_sincosTest_b(67)) & twoToMiSiXip_uid88_sincosTest_b));
    yip1E_4_uid93_sincosTest_combproc: PROCESS (yip1E_4_uid93_sincosTest_a, yip1E_4_uid93_sincosTest_b, yip1E_4_uid93_sincosTest_s)
    BEGIN
        IF (yip1E_4_uid93_sincosTest_s = "1") THEN
            yip1E_4_uid93_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_4_uid93_sincosTest_a) + SIGNED(yip1E_4_uid93_sincosTest_b));
        ELSE
            yip1E_4_uid93_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_4_uid93_sincosTest_a) - SIGNED(yip1E_4_uid93_sincosTest_b));
        END IF;
    END PROCESS;
    yip1E_4_uid93_sincosTest_q <= yip1E_4_uid93_sincosTest_o(71 downto 0);

    -- yip1_4_uid97_sincosTest(BITSELECT,96)@1
    yip1_4_uid97_sincosTest_in <= STD_LOGIC_VECTOR(yip1E_4_uid93_sincosTest_q(70 downto 0));
    yip1_4_uid97_sincosTest_b <= STD_LOGIC_VECTOR(yip1_4_uid97_sincosTest_in(70 downto 0));

    -- redist50_yip1_4_uid97_sincosTest_b_1(DELAY,711)
    redist50_yip1_4_uid97_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 71, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => yip1_4_uid97_sincosTest_b, xout => redist50_yip1_4_uid97_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- twoToMiSiYip_uid105_sincosTest(BITSELECT,104)@2
    twoToMiSiYip_uid105_sincosTest_b <= STD_LOGIC_VECTOR(redist50_yip1_4_uid97_sincosTest_b_1_q(70 downto 4));

    -- twoToMiSiYip_uid89_sincosTest(BITSELECT,88)@1
    twoToMiSiYip_uid89_sincosTest_b <= STD_LOGIC_VECTOR(yip1_3_uid81_sincosTest_b(70 downto 3));

    -- xip1E_4_uid92_sincosTest(ADDSUB,91)@1
    xip1E_4_uid92_sincosTest_s <= xMSB_uid83_sincosTest_b;
    xip1E_4_uid92_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((72 downto 71 => xip1_3_uid80_sincosTest_b(70)) & xip1_3_uid80_sincosTest_b));
    xip1E_4_uid92_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((72 downto 68 => twoToMiSiYip_uid89_sincosTest_b(67)) & twoToMiSiYip_uid89_sincosTest_b));
    xip1E_4_uid92_sincosTest_combproc: PROCESS (xip1E_4_uid92_sincosTest_a, xip1E_4_uid92_sincosTest_b, xip1E_4_uid92_sincosTest_s)
    BEGIN
        IF (xip1E_4_uid92_sincosTest_s = "1") THEN
            xip1E_4_uid92_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_4_uid92_sincosTest_a) + SIGNED(xip1E_4_uid92_sincosTest_b));
        ELSE
            xip1E_4_uid92_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_4_uid92_sincosTest_a) - SIGNED(xip1E_4_uid92_sincosTest_b));
        END IF;
    END PROCESS;
    xip1E_4_uid92_sincosTest_q <= xip1E_4_uid92_sincosTest_o(71 downto 0);

    -- xip1_4_uid96_sincosTest(BITSELECT,95)@1
    xip1_4_uid96_sincosTest_in <= STD_LOGIC_VECTOR(xip1E_4_uid92_sincosTest_q(70 downto 0));
    xip1_4_uid96_sincosTest_b <= STD_LOGIC_VECTOR(xip1_4_uid96_sincosTest_in(70 downto 0));

    -- redist51_xip1_4_uid96_sincosTest_b_1(DELAY,712)
    redist51_xip1_4_uid96_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 71, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xip1_4_uid96_sincosTest_b, xout => redist51_xip1_4_uid96_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- xip1E_5_uid108_sincosTest(ADDSUB,107)@2
    xip1E_5_uid108_sincosTest_s <= redist49_xMSB_uid99_sincosTest_b_1_q;
    xip1E_5_uid108_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((72 downto 71 => redist51_xip1_4_uid96_sincosTest_b_1_q(70)) & redist51_xip1_4_uid96_sincosTest_b_1_q));
    xip1E_5_uid108_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((72 downto 67 => twoToMiSiYip_uid105_sincosTest_b(66)) & twoToMiSiYip_uid105_sincosTest_b));
    xip1E_5_uid108_sincosTest_combproc: PROCESS (xip1E_5_uid108_sincosTest_a, xip1E_5_uid108_sincosTest_b, xip1E_5_uid108_sincosTest_s)
    BEGIN
        IF (xip1E_5_uid108_sincosTest_s = "1") THEN
            xip1E_5_uid108_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_5_uid108_sincosTest_a) + SIGNED(xip1E_5_uid108_sincosTest_b));
        ELSE
            xip1E_5_uid108_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_5_uid108_sincosTest_a) - SIGNED(xip1E_5_uid108_sincosTest_b));
        END IF;
    END PROCESS;
    xip1E_5_uid108_sincosTest_q <= xip1E_5_uid108_sincosTest_o(71 downto 0);

    -- xip1_5_uid112_sincosTest(BITSELECT,111)@2
    xip1_5_uid112_sincosTest_in <= STD_LOGIC_VECTOR(xip1E_5_uid108_sincosTest_q(70 downto 0));
    xip1_5_uid112_sincosTest_b <= STD_LOGIC_VECTOR(xip1_5_uid112_sincosTest_in(70 downto 0));

    -- twoToMiSiXip_uid120_sincosTest(BITSELECT,119)@2
    twoToMiSiXip_uid120_sincosTest_b <= STD_LOGIC_VECTOR(xip1_5_uid112_sincosTest_b(70 downto 5));

    -- signOfSelectionSignal_uid101_sincosTest(LOGICAL,100)@2
    signOfSelectionSignal_uid101_sincosTest_q <= not (redist49_xMSB_uid99_sincosTest_b_1_q);

    -- twoToMiSiXip_uid104_sincosTest(BITSELECT,103)@2
    twoToMiSiXip_uid104_sincosTest_b <= STD_LOGIC_VECTOR(redist51_xip1_4_uid96_sincosTest_b_1_q(70 downto 4));

    -- yip1E_5_uid109_sincosTest(ADDSUB,108)@2
    yip1E_5_uid109_sincosTest_s <= signOfSelectionSignal_uid101_sincosTest_q;
    yip1E_5_uid109_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((72 downto 71 => redist50_yip1_4_uid97_sincosTest_b_1_q(70)) & redist50_yip1_4_uid97_sincosTest_b_1_q));
    yip1E_5_uid109_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((72 downto 67 => twoToMiSiXip_uid104_sincosTest_b(66)) & twoToMiSiXip_uid104_sincosTest_b));
    yip1E_5_uid109_sincosTest_combproc: PROCESS (yip1E_5_uid109_sincosTest_a, yip1E_5_uid109_sincosTest_b, yip1E_5_uid109_sincosTest_s)
    BEGIN
        IF (yip1E_5_uid109_sincosTest_s = "1") THEN
            yip1E_5_uid109_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_5_uid109_sincosTest_a) + SIGNED(yip1E_5_uid109_sincosTest_b));
        ELSE
            yip1E_5_uid109_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_5_uid109_sincosTest_a) - SIGNED(yip1E_5_uid109_sincosTest_b));
        END IF;
    END PROCESS;
    yip1E_5_uid109_sincosTest_q <= yip1E_5_uid109_sincosTest_o(71 downto 0);

    -- yip1_5_uid113_sincosTest(BITSELECT,112)@2
    yip1_5_uid113_sincosTest_in <= STD_LOGIC_VECTOR(yip1E_5_uid109_sincosTest_q(70 downto 0));
    yip1_5_uid113_sincosTest_b <= STD_LOGIC_VECTOR(yip1_5_uid113_sincosTest_in(70 downto 0));

    -- yip1E_6_uid125_sincosTest(ADDSUB,124)@2
    yip1E_6_uid125_sincosTest_s <= signOfSelectionSignal_uid117_sincosTest_q;
    yip1E_6_uid125_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((72 downto 71 => yip1_5_uid113_sincosTest_b(70)) & yip1_5_uid113_sincosTest_b));
    yip1E_6_uid125_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((72 downto 66 => twoToMiSiXip_uid120_sincosTest_b(65)) & twoToMiSiXip_uid120_sincosTest_b));
    yip1E_6_uid125_sincosTest_combproc: PROCESS (yip1E_6_uid125_sincosTest_a, yip1E_6_uid125_sincosTest_b, yip1E_6_uid125_sincosTest_s)
    BEGIN
        IF (yip1E_6_uid125_sincosTest_s = "1") THEN
            yip1E_6_uid125_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_6_uid125_sincosTest_a) + SIGNED(yip1E_6_uid125_sincosTest_b));
        ELSE
            yip1E_6_uid125_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_6_uid125_sincosTest_a) - SIGNED(yip1E_6_uid125_sincosTest_b));
        END IF;
    END PROCESS;
    yip1E_6_uid125_sincosTest_q <= yip1E_6_uid125_sincosTest_o(71 downto 0);

    -- yip1_6_uid129_sincosTest(BITSELECT,128)@2
    yip1_6_uid129_sincosTest_in <= STD_LOGIC_VECTOR(yip1E_6_uid125_sincosTest_q(70 downto 0));
    yip1_6_uid129_sincosTest_b <= STD_LOGIC_VECTOR(yip1_6_uid129_sincosTest_in(70 downto 0));

    -- twoToMiSiYip_uid137_sincosTest(BITSELECT,136)@2
    twoToMiSiYip_uid137_sincosTest_b <= STD_LOGIC_VECTOR(yip1_6_uid129_sincosTest_b(70 downto 6));

    -- twoToMiSiYip_uid121_sincosTest(BITSELECT,120)@2
    twoToMiSiYip_uid121_sincosTest_b <= STD_LOGIC_VECTOR(yip1_5_uid113_sincosTest_b(70 downto 5));

    -- xip1E_6_uid124_sincosTest(ADDSUB,123)@2
    xip1E_6_uid124_sincosTest_s <= redist48_xMSB_uid115_sincosTest_b_1_q;
    xip1E_6_uid124_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((72 downto 71 => xip1_5_uid112_sincosTest_b(70)) & xip1_5_uid112_sincosTest_b));
    xip1E_6_uid124_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((72 downto 66 => twoToMiSiYip_uid121_sincosTest_b(65)) & twoToMiSiYip_uid121_sincosTest_b));
    xip1E_6_uid124_sincosTest_combproc: PROCESS (xip1E_6_uid124_sincosTest_a, xip1E_6_uid124_sincosTest_b, xip1E_6_uid124_sincosTest_s)
    BEGIN
        IF (xip1E_6_uid124_sincosTest_s = "1") THEN
            xip1E_6_uid124_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_6_uid124_sincosTest_a) + SIGNED(xip1E_6_uid124_sincosTest_b));
        ELSE
            xip1E_6_uid124_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_6_uid124_sincosTest_a) - SIGNED(xip1E_6_uid124_sincosTest_b));
        END IF;
    END PROCESS;
    xip1E_6_uid124_sincosTest_q <= xip1E_6_uid124_sincosTest_o(71 downto 0);

    -- xip1_6_uid128_sincosTest(BITSELECT,127)@2
    xip1_6_uid128_sincosTest_in <= STD_LOGIC_VECTOR(xip1E_6_uid124_sincosTest_q(70 downto 0));
    xip1_6_uid128_sincosTest_b <= STD_LOGIC_VECTOR(xip1_6_uid128_sincosTest_in(70 downto 0));

    -- xip1E_7_uid140_sincosTest(ADDSUB,139)@2
    xip1E_7_uid140_sincosTest_s <= redist47_xMSB_uid131_sincosTest_b_1_q;
    xip1E_7_uid140_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((72 downto 71 => xip1_6_uid128_sincosTest_b(70)) & xip1_6_uid128_sincosTest_b));
    xip1E_7_uid140_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((72 downto 65 => twoToMiSiYip_uid137_sincosTest_b(64)) & twoToMiSiYip_uid137_sincosTest_b));
    xip1E_7_uid140_sincosTest_combproc: PROCESS (xip1E_7_uid140_sincosTest_a, xip1E_7_uid140_sincosTest_b, xip1E_7_uid140_sincosTest_s)
    BEGIN
        IF (xip1E_7_uid140_sincosTest_s = "1") THEN
            xip1E_7_uid140_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_7_uid140_sincosTest_a) + SIGNED(xip1E_7_uid140_sincosTest_b));
        ELSE
            xip1E_7_uid140_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_7_uid140_sincosTest_a) - SIGNED(xip1E_7_uid140_sincosTest_b));
        END IF;
    END PROCESS;
    xip1E_7_uid140_sincosTest_q <= xip1E_7_uid140_sincosTest_o(71 downto 0);

    -- xip1_7_uid144_sincosTest(BITSELECT,143)@2
    xip1_7_uid144_sincosTest_in <= STD_LOGIC_VECTOR(xip1E_7_uid140_sincosTest_q(70 downto 0));
    xip1_7_uid144_sincosTest_b <= STD_LOGIC_VECTOR(xip1_7_uid144_sincosTest_in(70 downto 0));

    -- twoToMiSiXip_uid152_sincosTest(BITSELECT,151)@2
    twoToMiSiXip_uid152_sincosTest_b <= STD_LOGIC_VECTOR(xip1_7_uid144_sincosTest_b(70 downto 7));

    -- signOfSelectionSignal_uid133_sincosTest(LOGICAL,132)@2
    signOfSelectionSignal_uid133_sincosTest_q <= not (redist47_xMSB_uid131_sincosTest_b_1_q);

    -- twoToMiSiXip_uid136_sincosTest(BITSELECT,135)@2
    twoToMiSiXip_uid136_sincosTest_b <= STD_LOGIC_VECTOR(xip1_6_uid128_sincosTest_b(70 downto 6));

    -- yip1E_7_uid141_sincosTest(ADDSUB,140)@2
    yip1E_7_uid141_sincosTest_s <= signOfSelectionSignal_uid133_sincosTest_q;
    yip1E_7_uid141_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((72 downto 71 => yip1_6_uid129_sincosTest_b(70)) & yip1_6_uid129_sincosTest_b));
    yip1E_7_uid141_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((72 downto 65 => twoToMiSiXip_uid136_sincosTest_b(64)) & twoToMiSiXip_uid136_sincosTest_b));
    yip1E_7_uid141_sincosTest_combproc: PROCESS (yip1E_7_uid141_sincosTest_a, yip1E_7_uid141_sincosTest_b, yip1E_7_uid141_sincosTest_s)
    BEGIN
        IF (yip1E_7_uid141_sincosTest_s = "1") THEN
            yip1E_7_uid141_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_7_uid141_sincosTest_a) + SIGNED(yip1E_7_uid141_sincosTest_b));
        ELSE
            yip1E_7_uid141_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_7_uid141_sincosTest_a) - SIGNED(yip1E_7_uid141_sincosTest_b));
        END IF;
    END PROCESS;
    yip1E_7_uid141_sincosTest_q <= yip1E_7_uid141_sincosTest_o(71 downto 0);

    -- yip1_7_uid145_sincosTest(BITSELECT,144)@2
    yip1_7_uid145_sincosTest_in <= STD_LOGIC_VECTOR(yip1E_7_uid141_sincosTest_q(70 downto 0));
    yip1_7_uid145_sincosTest_b <= STD_LOGIC_VECTOR(yip1_7_uid145_sincosTest_in(70 downto 0));

    -- yip1E_8_uid157_sincosTest(ADDSUB,156)@2
    yip1E_8_uid157_sincosTest_s <= signOfSelectionSignal_uid149_sincosTest_q;
    yip1E_8_uid157_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((72 downto 71 => yip1_7_uid145_sincosTest_b(70)) & yip1_7_uid145_sincosTest_b));
    yip1E_8_uid157_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((72 downto 64 => twoToMiSiXip_uid152_sincosTest_b(63)) & twoToMiSiXip_uid152_sincosTest_b));
    yip1E_8_uid157_sincosTest_combproc: PROCESS (yip1E_8_uid157_sincosTest_a, yip1E_8_uid157_sincosTest_b, yip1E_8_uid157_sincosTest_s)
    BEGIN
        IF (yip1E_8_uid157_sincosTest_s = "1") THEN
            yip1E_8_uid157_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_8_uid157_sincosTest_a) + SIGNED(yip1E_8_uid157_sincosTest_b));
        ELSE
            yip1E_8_uid157_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_8_uid157_sincosTest_a) - SIGNED(yip1E_8_uid157_sincosTest_b));
        END IF;
    END PROCESS;
    yip1E_8_uid157_sincosTest_q <= yip1E_8_uid157_sincosTest_o(71 downto 0);

    -- yip1_8_uid161_sincosTest(BITSELECT,160)@2
    yip1_8_uid161_sincosTest_in <= STD_LOGIC_VECTOR(yip1E_8_uid157_sincosTest_q(70 downto 0));
    yip1_8_uid161_sincosTest_b <= STD_LOGIC_VECTOR(yip1_8_uid161_sincosTest_in(70 downto 0));

    -- redist44_yip1_8_uid161_sincosTest_b_1(DELAY,705)
    redist44_yip1_8_uid161_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 71, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => yip1_8_uid161_sincosTest_b, xout => redist44_yip1_8_uid161_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- twoToMiSiYip_uid169_sincosTest(BITSELECT,168)@3
    twoToMiSiYip_uid169_sincosTest_b <= STD_LOGIC_VECTOR(redist44_yip1_8_uid161_sincosTest_b_1_q(70 downto 8));

    -- twoToMiSiYip_uid153_sincosTest(BITSELECT,152)@2
    twoToMiSiYip_uid153_sincosTest_b <= STD_LOGIC_VECTOR(yip1_7_uid145_sincosTest_b(70 downto 7));

    -- xip1E_8_uid156_sincosTest(ADDSUB,155)@2
    xip1E_8_uid156_sincosTest_s <= xMSB_uid147_sincosTest_b;
    xip1E_8_uid156_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((72 downto 71 => xip1_7_uid144_sincosTest_b(70)) & xip1_7_uid144_sincosTest_b));
    xip1E_8_uid156_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((72 downto 64 => twoToMiSiYip_uid153_sincosTest_b(63)) & twoToMiSiYip_uid153_sincosTest_b));
    xip1E_8_uid156_sincosTest_combproc: PROCESS (xip1E_8_uid156_sincosTest_a, xip1E_8_uid156_sincosTest_b, xip1E_8_uid156_sincosTest_s)
    BEGIN
        IF (xip1E_8_uid156_sincosTest_s = "1") THEN
            xip1E_8_uid156_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_8_uid156_sincosTest_a) + SIGNED(xip1E_8_uid156_sincosTest_b));
        ELSE
            xip1E_8_uid156_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_8_uid156_sincosTest_a) - SIGNED(xip1E_8_uid156_sincosTest_b));
        END IF;
    END PROCESS;
    xip1E_8_uid156_sincosTest_q <= xip1E_8_uid156_sincosTest_o(71 downto 0);

    -- xip1_8_uid160_sincosTest(BITSELECT,159)@2
    xip1_8_uid160_sincosTest_in <= STD_LOGIC_VECTOR(xip1E_8_uid156_sincosTest_q(70 downto 0));
    xip1_8_uid160_sincosTest_b <= STD_LOGIC_VECTOR(xip1_8_uid160_sincosTest_in(70 downto 0));

    -- redist45_xip1_8_uid160_sincosTest_b_1(DELAY,706)
    redist45_xip1_8_uid160_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 71, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xip1_8_uid160_sincosTest_b, xout => redist45_xip1_8_uid160_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- xip1E_9_uid172_sincosTest(ADDSUB,171)@3
    xip1E_9_uid172_sincosTest_s <= redist43_xMSB_uid163_sincosTest_b_1_q;
    xip1E_9_uid172_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((72 downto 71 => redist45_xip1_8_uid160_sincosTest_b_1_q(70)) & redist45_xip1_8_uid160_sincosTest_b_1_q));
    xip1E_9_uid172_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((72 downto 63 => twoToMiSiYip_uid169_sincosTest_b(62)) & twoToMiSiYip_uid169_sincosTest_b));
    xip1E_9_uid172_sincosTest_combproc: PROCESS (xip1E_9_uid172_sincosTest_a, xip1E_9_uid172_sincosTest_b, xip1E_9_uid172_sincosTest_s)
    BEGIN
        IF (xip1E_9_uid172_sincosTest_s = "1") THEN
            xip1E_9_uid172_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_9_uid172_sincosTest_a) + SIGNED(xip1E_9_uid172_sincosTest_b));
        ELSE
            xip1E_9_uid172_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_9_uid172_sincosTest_a) - SIGNED(xip1E_9_uid172_sincosTest_b));
        END IF;
    END PROCESS;
    xip1E_9_uid172_sincosTest_q <= xip1E_9_uid172_sincosTest_o(71 downto 0);

    -- xip1_9_uid176_sincosTest(BITSELECT,175)@3
    xip1_9_uid176_sincosTest_in <= STD_LOGIC_VECTOR(xip1E_9_uid172_sincosTest_q(70 downto 0));
    xip1_9_uid176_sincosTest_b <= STD_LOGIC_VECTOR(xip1_9_uid176_sincosTest_in(70 downto 0));

    -- twoToMiSiXip_uid184_sincosTest(BITSELECT,183)@3
    twoToMiSiXip_uid184_sincosTest_b <= STD_LOGIC_VECTOR(xip1_9_uid176_sincosTest_b(70 downto 9));

    -- signOfSelectionSignal_uid165_sincosTest(LOGICAL,164)@3
    signOfSelectionSignal_uid165_sincosTest_q <= not (redist43_xMSB_uid163_sincosTest_b_1_q);

    -- twoToMiSiXip_uid168_sincosTest(BITSELECT,167)@3
    twoToMiSiXip_uid168_sincosTest_b <= STD_LOGIC_VECTOR(redist45_xip1_8_uid160_sincosTest_b_1_q(70 downto 8));

    -- yip1E_9_uid173_sincosTest(ADDSUB,172)@3
    yip1E_9_uid173_sincosTest_s <= signOfSelectionSignal_uid165_sincosTest_q;
    yip1E_9_uid173_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((72 downto 71 => redist44_yip1_8_uid161_sincosTest_b_1_q(70)) & redist44_yip1_8_uid161_sincosTest_b_1_q));
    yip1E_9_uid173_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((72 downto 63 => twoToMiSiXip_uid168_sincosTest_b(62)) & twoToMiSiXip_uid168_sincosTest_b));
    yip1E_9_uid173_sincosTest_combproc: PROCESS (yip1E_9_uid173_sincosTest_a, yip1E_9_uid173_sincosTest_b, yip1E_9_uid173_sincosTest_s)
    BEGIN
        IF (yip1E_9_uid173_sincosTest_s = "1") THEN
            yip1E_9_uid173_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_9_uid173_sincosTest_a) + SIGNED(yip1E_9_uid173_sincosTest_b));
        ELSE
            yip1E_9_uid173_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_9_uid173_sincosTest_a) - SIGNED(yip1E_9_uid173_sincosTest_b));
        END IF;
    END PROCESS;
    yip1E_9_uid173_sincosTest_q <= yip1E_9_uid173_sincosTest_o(71 downto 0);

    -- yip1_9_uid177_sincosTest(BITSELECT,176)@3
    yip1_9_uid177_sincosTest_in <= STD_LOGIC_VECTOR(yip1E_9_uid173_sincosTest_q(70 downto 0));
    yip1_9_uid177_sincosTest_b <= STD_LOGIC_VECTOR(yip1_9_uid177_sincosTest_in(70 downto 0));

    -- yip1E_10_uid189_sincosTest(ADDSUB,188)@3
    yip1E_10_uid189_sincosTest_s <= signOfSelectionSignal_uid181_sincosTest_q;
    yip1E_10_uid189_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((72 downto 71 => yip1_9_uid177_sincosTest_b(70)) & yip1_9_uid177_sincosTest_b));
    yip1E_10_uid189_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((72 downto 62 => twoToMiSiXip_uid184_sincosTest_b(61)) & twoToMiSiXip_uid184_sincosTest_b));
    yip1E_10_uid189_sincosTest_combproc: PROCESS (yip1E_10_uid189_sincosTest_a, yip1E_10_uid189_sincosTest_b, yip1E_10_uid189_sincosTest_s)
    BEGIN
        IF (yip1E_10_uid189_sincosTest_s = "1") THEN
            yip1E_10_uid189_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_10_uid189_sincosTest_a) + SIGNED(yip1E_10_uid189_sincosTest_b));
        ELSE
            yip1E_10_uid189_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_10_uid189_sincosTest_a) - SIGNED(yip1E_10_uid189_sincosTest_b));
        END IF;
    END PROCESS;
    yip1E_10_uid189_sincosTest_q <= yip1E_10_uid189_sincosTest_o(71 downto 0);

    -- yip1_10_uid193_sincosTest(BITSELECT,192)@3
    yip1_10_uid193_sincosTest_in <= STD_LOGIC_VECTOR(yip1E_10_uid189_sincosTest_q(70 downto 0));
    yip1_10_uid193_sincosTest_b <= STD_LOGIC_VECTOR(yip1_10_uid193_sincosTest_in(70 downto 0));

    -- twoToMiSiYip_uid201_sincosTest(BITSELECT,200)@3
    twoToMiSiYip_uid201_sincosTest_b <= STD_LOGIC_VECTOR(yip1_10_uid193_sincosTest_b(70 downto 10));

    -- twoToMiSiYip_uid185_sincosTest(BITSELECT,184)@3
    twoToMiSiYip_uid185_sincosTest_b <= STD_LOGIC_VECTOR(yip1_9_uid177_sincosTest_b(70 downto 9));

    -- xip1E_10_uid188_sincosTest(ADDSUB,187)@3
    xip1E_10_uid188_sincosTest_s <= redist42_xMSB_uid179_sincosTest_b_1_q;
    xip1E_10_uid188_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((72 downto 71 => xip1_9_uid176_sincosTest_b(70)) & xip1_9_uid176_sincosTest_b));
    xip1E_10_uid188_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((72 downto 62 => twoToMiSiYip_uid185_sincosTest_b(61)) & twoToMiSiYip_uid185_sincosTest_b));
    xip1E_10_uid188_sincosTest_combproc: PROCESS (xip1E_10_uid188_sincosTest_a, xip1E_10_uid188_sincosTest_b, xip1E_10_uid188_sincosTest_s)
    BEGIN
        IF (xip1E_10_uid188_sincosTest_s = "1") THEN
            xip1E_10_uid188_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_10_uid188_sincosTest_a) + SIGNED(xip1E_10_uid188_sincosTest_b));
        ELSE
            xip1E_10_uid188_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_10_uid188_sincosTest_a) - SIGNED(xip1E_10_uid188_sincosTest_b));
        END IF;
    END PROCESS;
    xip1E_10_uid188_sincosTest_q <= xip1E_10_uid188_sincosTest_o(71 downto 0);

    -- xip1_10_uid192_sincosTest(BITSELECT,191)@3
    xip1_10_uid192_sincosTest_in <= STD_LOGIC_VECTOR(xip1E_10_uid188_sincosTest_q(70 downto 0));
    xip1_10_uid192_sincosTest_b <= STD_LOGIC_VECTOR(xip1_10_uid192_sincosTest_in(70 downto 0));

    -- xip1E_11_uid204_sincosTest(ADDSUB,203)@3
    xip1E_11_uid204_sincosTest_s <= redist41_xMSB_uid195_sincosTest_b_1_q;
    xip1E_11_uid204_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((72 downto 71 => xip1_10_uid192_sincosTest_b(70)) & xip1_10_uid192_sincosTest_b));
    xip1E_11_uid204_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((72 downto 61 => twoToMiSiYip_uid201_sincosTest_b(60)) & twoToMiSiYip_uid201_sincosTest_b));
    xip1E_11_uid204_sincosTest_combproc: PROCESS (xip1E_11_uid204_sincosTest_a, xip1E_11_uid204_sincosTest_b, xip1E_11_uid204_sincosTest_s)
    BEGIN
        IF (xip1E_11_uid204_sincosTest_s = "1") THEN
            xip1E_11_uid204_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_11_uid204_sincosTest_a) + SIGNED(xip1E_11_uid204_sincosTest_b));
        ELSE
            xip1E_11_uid204_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_11_uid204_sincosTest_a) - SIGNED(xip1E_11_uid204_sincosTest_b));
        END IF;
    END PROCESS;
    xip1E_11_uid204_sincosTest_q <= xip1E_11_uid204_sincosTest_o(71 downto 0);

    -- xip1_11_uid208_sincosTest(BITSELECT,207)@3
    xip1_11_uid208_sincosTest_in <= STD_LOGIC_VECTOR(xip1E_11_uid204_sincosTest_q(70 downto 0));
    xip1_11_uid208_sincosTest_b <= STD_LOGIC_VECTOR(xip1_11_uid208_sincosTest_in(70 downto 0));

    -- twoToMiSiXip_uid216_sincosTest(BITSELECT,215)@3
    twoToMiSiXip_uid216_sincosTest_b <= STD_LOGIC_VECTOR(xip1_11_uid208_sincosTest_b(70 downto 11));

    -- signOfSelectionSignal_uid197_sincosTest(LOGICAL,196)@3
    signOfSelectionSignal_uid197_sincosTest_q <= not (redist41_xMSB_uid195_sincosTest_b_1_q);

    -- twoToMiSiXip_uid200_sincosTest(BITSELECT,199)@3
    twoToMiSiXip_uid200_sincosTest_b <= STD_LOGIC_VECTOR(xip1_10_uid192_sincosTest_b(70 downto 10));

    -- yip1E_11_uid205_sincosTest(ADDSUB,204)@3
    yip1E_11_uid205_sincosTest_s <= signOfSelectionSignal_uid197_sincosTest_q;
    yip1E_11_uid205_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((72 downto 71 => yip1_10_uid193_sincosTest_b(70)) & yip1_10_uid193_sincosTest_b));
    yip1E_11_uid205_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((72 downto 61 => twoToMiSiXip_uid200_sincosTest_b(60)) & twoToMiSiXip_uid200_sincosTest_b));
    yip1E_11_uid205_sincosTest_combproc: PROCESS (yip1E_11_uid205_sincosTest_a, yip1E_11_uid205_sincosTest_b, yip1E_11_uid205_sincosTest_s)
    BEGIN
        IF (yip1E_11_uid205_sincosTest_s = "1") THEN
            yip1E_11_uid205_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_11_uid205_sincosTest_a) + SIGNED(yip1E_11_uid205_sincosTest_b));
        ELSE
            yip1E_11_uid205_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_11_uid205_sincosTest_a) - SIGNED(yip1E_11_uid205_sincosTest_b));
        END IF;
    END PROCESS;
    yip1E_11_uid205_sincosTest_q <= yip1E_11_uid205_sincosTest_o(71 downto 0);

    -- yip1_11_uid209_sincosTest(BITSELECT,208)@3
    yip1_11_uid209_sincosTest_in <= STD_LOGIC_VECTOR(yip1E_11_uid205_sincosTest_q(70 downto 0));
    yip1_11_uid209_sincosTest_b <= STD_LOGIC_VECTOR(yip1_11_uid209_sincosTest_in(70 downto 0));

    -- yip1E_12_uid221_sincosTest(ADDSUB,220)@3
    yip1E_12_uid221_sincosTest_s <= signOfSelectionSignal_uid213_sincosTest_q;
    yip1E_12_uid221_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((72 downto 71 => yip1_11_uid209_sincosTest_b(70)) & yip1_11_uid209_sincosTest_b));
    yip1E_12_uid221_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((72 downto 60 => twoToMiSiXip_uid216_sincosTest_b(59)) & twoToMiSiXip_uid216_sincosTest_b));
    yip1E_12_uid221_sincosTest_combproc: PROCESS (yip1E_12_uid221_sincosTest_a, yip1E_12_uid221_sincosTest_b, yip1E_12_uid221_sincosTest_s)
    BEGIN
        IF (yip1E_12_uid221_sincosTest_s = "1") THEN
            yip1E_12_uid221_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_12_uid221_sincosTest_a) + SIGNED(yip1E_12_uid221_sincosTest_b));
        ELSE
            yip1E_12_uid221_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_12_uid221_sincosTest_a) - SIGNED(yip1E_12_uid221_sincosTest_b));
        END IF;
    END PROCESS;
    yip1E_12_uid221_sincosTest_q <= yip1E_12_uid221_sincosTest_o(71 downto 0);

    -- yip1_12_uid225_sincosTest(BITSELECT,224)@3
    yip1_12_uid225_sincosTest_in <= STD_LOGIC_VECTOR(yip1E_12_uid221_sincosTest_q(70 downto 0));
    yip1_12_uid225_sincosTest_b <= STD_LOGIC_VECTOR(yip1_12_uid225_sincosTest_in(70 downto 0));

    -- redist38_yip1_12_uid225_sincosTest_b_1(DELAY,699)
    redist38_yip1_12_uid225_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 71, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => yip1_12_uid225_sincosTest_b, xout => redist38_yip1_12_uid225_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- twoToMiSiYip_uid233_sincosTest(BITSELECT,232)@4
    twoToMiSiYip_uid233_sincosTest_b <= STD_LOGIC_VECTOR(redist38_yip1_12_uid225_sincosTest_b_1_q(70 downto 12));

    -- twoToMiSiYip_uid217_sincosTest(BITSELECT,216)@3
    twoToMiSiYip_uid217_sincosTest_b <= STD_LOGIC_VECTOR(yip1_11_uid209_sincosTest_b(70 downto 11));

    -- xip1E_12_uid220_sincosTest(ADDSUB,219)@3
    xip1E_12_uid220_sincosTest_s <= redist40_xMSB_uid211_sincosTest_b_1_q;
    xip1E_12_uid220_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((72 downto 71 => xip1_11_uid208_sincosTest_b(70)) & xip1_11_uid208_sincosTest_b));
    xip1E_12_uid220_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((72 downto 60 => twoToMiSiYip_uid217_sincosTest_b(59)) & twoToMiSiYip_uid217_sincosTest_b));
    xip1E_12_uid220_sincosTest_combproc: PROCESS (xip1E_12_uid220_sincosTest_a, xip1E_12_uid220_sincosTest_b, xip1E_12_uid220_sincosTest_s)
    BEGIN
        IF (xip1E_12_uid220_sincosTest_s = "1") THEN
            xip1E_12_uid220_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_12_uid220_sincosTest_a) + SIGNED(xip1E_12_uid220_sincosTest_b));
        ELSE
            xip1E_12_uid220_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_12_uid220_sincosTest_a) - SIGNED(xip1E_12_uid220_sincosTest_b));
        END IF;
    END PROCESS;
    xip1E_12_uid220_sincosTest_q <= xip1E_12_uid220_sincosTest_o(71 downto 0);

    -- xip1_12_uid224_sincosTest(BITSELECT,223)@3
    xip1_12_uid224_sincosTest_in <= STD_LOGIC_VECTOR(xip1E_12_uid220_sincosTest_q(70 downto 0));
    xip1_12_uid224_sincosTest_b <= STD_LOGIC_VECTOR(xip1_12_uid224_sincosTest_in(70 downto 0));

    -- redist39_xip1_12_uid224_sincosTest_b_1(DELAY,700)
    redist39_xip1_12_uid224_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 71, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xip1_12_uid224_sincosTest_b, xout => redist39_xip1_12_uid224_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- xip1E_13_uid236_sincosTest(ADDSUB,235)@4
    xip1E_13_uid236_sincosTest_s <= redist36_xMSB_uid227_sincosTest_b_1_q;
    xip1E_13_uid236_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((72 downto 71 => redist39_xip1_12_uid224_sincosTest_b_1_q(70)) & redist39_xip1_12_uid224_sincosTest_b_1_q));
    xip1E_13_uid236_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((72 downto 59 => twoToMiSiYip_uid233_sincosTest_b(58)) & twoToMiSiYip_uid233_sincosTest_b));
    xip1E_13_uid236_sincosTest_combproc: PROCESS (xip1E_13_uid236_sincosTest_a, xip1E_13_uid236_sincosTest_b, xip1E_13_uid236_sincosTest_s)
    BEGIN
        IF (xip1E_13_uid236_sincosTest_s = "1") THEN
            xip1E_13_uid236_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_13_uid236_sincosTest_a) + SIGNED(xip1E_13_uid236_sincosTest_b));
        ELSE
            xip1E_13_uid236_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_13_uid236_sincosTest_a) - SIGNED(xip1E_13_uid236_sincosTest_b));
        END IF;
    END PROCESS;
    xip1E_13_uid236_sincosTest_q <= xip1E_13_uid236_sincosTest_o(71 downto 0);

    -- xip1_13_uid240_sincosTest(BITSELECT,239)@4
    xip1_13_uid240_sincosTest_in <= STD_LOGIC_VECTOR(xip1E_13_uid236_sincosTest_q(70 downto 0));
    xip1_13_uid240_sincosTest_b <= STD_LOGIC_VECTOR(xip1_13_uid240_sincosTest_in(70 downto 0));

    -- twoToMiSiXip_uid248_sincosTest(BITSELECT,247)@4
    twoToMiSiXip_uid248_sincosTest_b <= STD_LOGIC_VECTOR(xip1_13_uid240_sincosTest_b(70 downto 13));

    -- signOfSelectionSignal_uid229_sincosTest(LOGICAL,228)@4
    signOfSelectionSignal_uid229_sincosTest_q <= not (redist36_xMSB_uid227_sincosTest_b_1_q);

    -- twoToMiSiXip_uid232_sincosTest(BITSELECT,231)@4
    twoToMiSiXip_uid232_sincosTest_b <= STD_LOGIC_VECTOR(redist39_xip1_12_uid224_sincosTest_b_1_q(70 downto 12));

    -- yip1E_13_uid237_sincosTest(ADDSUB,236)@4
    yip1E_13_uid237_sincosTest_s <= signOfSelectionSignal_uid229_sincosTest_q;
    yip1E_13_uid237_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((72 downto 71 => redist38_yip1_12_uid225_sincosTest_b_1_q(70)) & redist38_yip1_12_uid225_sincosTest_b_1_q));
    yip1E_13_uid237_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((72 downto 59 => twoToMiSiXip_uid232_sincosTest_b(58)) & twoToMiSiXip_uid232_sincosTest_b));
    yip1E_13_uid237_sincosTest_combproc: PROCESS (yip1E_13_uid237_sincosTest_a, yip1E_13_uid237_sincosTest_b, yip1E_13_uid237_sincosTest_s)
    BEGIN
        IF (yip1E_13_uid237_sincosTest_s = "1") THEN
            yip1E_13_uid237_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_13_uid237_sincosTest_a) + SIGNED(yip1E_13_uid237_sincosTest_b));
        ELSE
            yip1E_13_uid237_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_13_uid237_sincosTest_a) - SIGNED(yip1E_13_uid237_sincosTest_b));
        END IF;
    END PROCESS;
    yip1E_13_uid237_sincosTest_q <= yip1E_13_uid237_sincosTest_o(71 downto 0);

    -- yip1_13_uid241_sincosTest(BITSELECT,240)@4
    yip1_13_uid241_sincosTest_in <= STD_LOGIC_VECTOR(yip1E_13_uid237_sincosTest_q(70 downto 0));
    yip1_13_uid241_sincosTest_b <= STD_LOGIC_VECTOR(yip1_13_uid241_sincosTest_in(70 downto 0));

    -- yip1E_14_uid253_sincosTest(ADDSUB,252)@4
    yip1E_14_uid253_sincosTest_s <= signOfSelectionSignal_uid245_sincosTest_q;
    yip1E_14_uid253_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((72 downto 71 => yip1_13_uid241_sincosTest_b(70)) & yip1_13_uid241_sincosTest_b));
    yip1E_14_uid253_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((72 downto 58 => twoToMiSiXip_uid248_sincosTest_b(57)) & twoToMiSiXip_uid248_sincosTest_b));
    yip1E_14_uid253_sincosTest_combproc: PROCESS (yip1E_14_uid253_sincosTest_a, yip1E_14_uid253_sincosTest_b, yip1E_14_uid253_sincosTest_s)
    BEGIN
        IF (yip1E_14_uid253_sincosTest_s = "1") THEN
            yip1E_14_uid253_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_14_uid253_sincosTest_a) + SIGNED(yip1E_14_uid253_sincosTest_b));
        ELSE
            yip1E_14_uid253_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_14_uid253_sincosTest_a) - SIGNED(yip1E_14_uid253_sincosTest_b));
        END IF;
    END PROCESS;
    yip1E_14_uid253_sincosTest_q <= yip1E_14_uid253_sincosTest_o(71 downto 0);

    -- yip1_14_uid257_sincosTest(BITSELECT,256)@4
    yip1_14_uid257_sincosTest_in <= STD_LOGIC_VECTOR(yip1E_14_uid253_sincosTest_q(70 downto 0));
    yip1_14_uid257_sincosTest_b <= STD_LOGIC_VECTOR(yip1_14_uid257_sincosTest_in(70 downto 0));

    -- twoToMiSiYip_uid265_sincosTest(BITSELECT,264)@4
    twoToMiSiYip_uid265_sincosTest_b <= STD_LOGIC_VECTOR(yip1_14_uid257_sincosTest_b(70 downto 14));

    -- twoToMiSiYip_uid249_sincosTest(BITSELECT,248)@4
    twoToMiSiYip_uid249_sincosTest_b <= STD_LOGIC_VECTOR(yip1_13_uid241_sincosTest_b(70 downto 13));

    -- xip1E_14_uid252_sincosTest(ADDSUB,251)@4
    xip1E_14_uid252_sincosTest_s <= redist35_xMSB_uid243_sincosTest_b_1_q;
    xip1E_14_uid252_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((72 downto 71 => xip1_13_uid240_sincosTest_b(70)) & xip1_13_uid240_sincosTest_b));
    xip1E_14_uid252_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((72 downto 58 => twoToMiSiYip_uid249_sincosTest_b(57)) & twoToMiSiYip_uid249_sincosTest_b));
    xip1E_14_uid252_sincosTest_combproc: PROCESS (xip1E_14_uid252_sincosTest_a, xip1E_14_uid252_sincosTest_b, xip1E_14_uid252_sincosTest_s)
    BEGIN
        IF (xip1E_14_uid252_sincosTest_s = "1") THEN
            xip1E_14_uid252_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_14_uid252_sincosTest_a) + SIGNED(xip1E_14_uid252_sincosTest_b));
        ELSE
            xip1E_14_uid252_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_14_uid252_sincosTest_a) - SIGNED(xip1E_14_uid252_sincosTest_b));
        END IF;
    END PROCESS;
    xip1E_14_uid252_sincosTest_q <= xip1E_14_uid252_sincosTest_o(71 downto 0);

    -- xip1_14_uid256_sincosTest(BITSELECT,255)@4
    xip1_14_uid256_sincosTest_in <= STD_LOGIC_VECTOR(xip1E_14_uid252_sincosTest_q(70 downto 0));
    xip1_14_uid256_sincosTest_b <= STD_LOGIC_VECTOR(xip1_14_uid256_sincosTest_in(70 downto 0));

    -- xip1E_15_uid268_sincosTest(ADDSUB,267)@4
    xip1E_15_uid268_sincosTest_s <= redist34_xMSB_uid259_sincosTest_b_1_q;
    xip1E_15_uid268_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((72 downto 71 => xip1_14_uid256_sincosTest_b(70)) & xip1_14_uid256_sincosTest_b));
    xip1E_15_uid268_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((72 downto 57 => twoToMiSiYip_uid265_sincosTest_b(56)) & twoToMiSiYip_uid265_sincosTest_b));
    xip1E_15_uid268_sincosTest_combproc: PROCESS (xip1E_15_uid268_sincosTest_a, xip1E_15_uid268_sincosTest_b, xip1E_15_uid268_sincosTest_s)
    BEGIN
        IF (xip1E_15_uid268_sincosTest_s = "1") THEN
            xip1E_15_uid268_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_15_uid268_sincosTest_a) + SIGNED(xip1E_15_uid268_sincosTest_b));
        ELSE
            xip1E_15_uid268_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_15_uid268_sincosTest_a) - SIGNED(xip1E_15_uid268_sincosTest_b));
        END IF;
    END PROCESS;
    xip1E_15_uid268_sincosTest_q <= xip1E_15_uid268_sincosTest_o(71 downto 0);

    -- xip1_15_uid272_sincosTest(BITSELECT,271)@4
    xip1_15_uid272_sincosTest_in <= STD_LOGIC_VECTOR(xip1E_15_uid268_sincosTest_q(70 downto 0));
    xip1_15_uid272_sincosTest_b <= STD_LOGIC_VECTOR(xip1_15_uid272_sincosTest_in(70 downto 0));

    -- twoToMiSiXip_uid280_sincosTest(BITSELECT,279)@4
    twoToMiSiXip_uid280_sincosTest_b <= STD_LOGIC_VECTOR(xip1_15_uid272_sincosTest_b(70 downto 15));

    -- signOfSelectionSignal_uid261_sincosTest(LOGICAL,260)@4
    signOfSelectionSignal_uid261_sincosTest_q <= not (redist34_xMSB_uid259_sincosTest_b_1_q);

    -- twoToMiSiXip_uid264_sincosTest(BITSELECT,263)@4
    twoToMiSiXip_uid264_sincosTest_b <= STD_LOGIC_VECTOR(xip1_14_uid256_sincosTest_b(70 downto 14));

    -- yip1E_15_uid269_sincosTest(ADDSUB,268)@4
    yip1E_15_uid269_sincosTest_s <= signOfSelectionSignal_uid261_sincosTest_q;
    yip1E_15_uid269_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((72 downto 71 => yip1_14_uid257_sincosTest_b(70)) & yip1_14_uid257_sincosTest_b));
    yip1E_15_uid269_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((72 downto 57 => twoToMiSiXip_uid264_sincosTest_b(56)) & twoToMiSiXip_uid264_sincosTest_b));
    yip1E_15_uid269_sincosTest_combproc: PROCESS (yip1E_15_uid269_sincosTest_a, yip1E_15_uid269_sincosTest_b, yip1E_15_uid269_sincosTest_s)
    BEGIN
        IF (yip1E_15_uid269_sincosTest_s = "1") THEN
            yip1E_15_uid269_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_15_uid269_sincosTest_a) + SIGNED(yip1E_15_uid269_sincosTest_b));
        ELSE
            yip1E_15_uid269_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_15_uid269_sincosTest_a) - SIGNED(yip1E_15_uid269_sincosTest_b));
        END IF;
    END PROCESS;
    yip1E_15_uid269_sincosTest_q <= yip1E_15_uid269_sincosTest_o(71 downto 0);

    -- yip1_15_uid273_sincosTest(BITSELECT,272)@4
    yip1_15_uid273_sincosTest_in <= STD_LOGIC_VECTOR(yip1E_15_uid269_sincosTest_q(70 downto 0));
    yip1_15_uid273_sincosTest_b <= STD_LOGIC_VECTOR(yip1_15_uid273_sincosTest_in(70 downto 0));

    -- yip1E_16_uid285_sincosTest(ADDSUB,284)@4
    yip1E_16_uid285_sincosTest_s <= signOfSelectionSignal_uid277_sincosTest_q;
    yip1E_16_uid285_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((72 downto 71 => yip1_15_uid273_sincosTest_b(70)) & yip1_15_uid273_sincosTest_b));
    yip1E_16_uid285_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((72 downto 56 => twoToMiSiXip_uid280_sincosTest_b(55)) & twoToMiSiXip_uid280_sincosTest_b));
    yip1E_16_uid285_sincosTest_combproc: PROCESS (yip1E_16_uid285_sincosTest_a, yip1E_16_uid285_sincosTest_b, yip1E_16_uid285_sincosTest_s)
    BEGIN
        IF (yip1E_16_uid285_sincosTest_s = "1") THEN
            yip1E_16_uid285_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_16_uid285_sincosTest_a) + SIGNED(yip1E_16_uid285_sincosTest_b));
        ELSE
            yip1E_16_uid285_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_16_uid285_sincosTest_a) - SIGNED(yip1E_16_uid285_sincosTest_b));
        END IF;
    END PROCESS;
    yip1E_16_uid285_sincosTest_q <= yip1E_16_uid285_sincosTest_o(71 downto 0);

    -- yip1_16_uid292_sincosTest(BITSELECT,291)@4
    yip1_16_uid292_sincosTest_in <= STD_LOGIC_VECTOR(yip1E_16_uid285_sincosTest_q(70 downto 0));
    yip1_16_uid292_sincosTest_b <= STD_LOGIC_VECTOR(yip1_16_uid292_sincosTest_in(70 downto 0));

    -- redist31_yip1_16_uid292_sincosTest_b_1(DELAY,692)
    redist31_yip1_16_uid292_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 71, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => yip1_16_uid292_sincosTest_b, xout => redist31_yip1_16_uid292_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- twoToMiSiYip_uid300_sincosTest(BITSELECT,299)@5
    twoToMiSiYip_uid300_sincosTest_b <= STD_LOGIC_VECTOR(redist31_yip1_16_uid292_sincosTest_b_1_q(70 downto 16));

    -- twoToMiSiYip_uid281_sincosTest(BITSELECT,280)@4
    twoToMiSiYip_uid281_sincosTest_b <= STD_LOGIC_VECTOR(yip1_15_uid273_sincosTest_b(70 downto 15));

    -- xip1E_16_uid284_sincosTest(ADDSUB,283)@4
    xip1E_16_uid284_sincosTest_s <= redist33_xMSB_uid275_sincosTest_b_1_q;
    xip1E_16_uid284_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((72 downto 71 => xip1_15_uid272_sincosTest_b(70)) & xip1_15_uid272_sincosTest_b));
    xip1E_16_uid284_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((72 downto 56 => twoToMiSiYip_uid281_sincosTest_b(55)) & twoToMiSiYip_uid281_sincosTest_b));
    xip1E_16_uid284_sincosTest_combproc: PROCESS (xip1E_16_uid284_sincosTest_a, xip1E_16_uid284_sincosTest_b, xip1E_16_uid284_sincosTest_s)
    BEGIN
        IF (xip1E_16_uid284_sincosTest_s = "1") THEN
            xip1E_16_uid284_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_16_uid284_sincosTest_a) + SIGNED(xip1E_16_uid284_sincosTest_b));
        ELSE
            xip1E_16_uid284_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_16_uid284_sincosTest_a) - SIGNED(xip1E_16_uid284_sincosTest_b));
        END IF;
    END PROCESS;
    xip1E_16_uid284_sincosTest_q <= xip1E_16_uid284_sincosTest_o(71 downto 0);

    -- xip1_16_uid291_sincosTest(BITSELECT,290)@4
    xip1_16_uid291_sincosTest_in <= STD_LOGIC_VECTOR(xip1E_16_uid284_sincosTest_q(70 downto 0));
    xip1_16_uid291_sincosTest_b <= STD_LOGIC_VECTOR(xip1_16_uid291_sincosTest_in(70 downto 0));

    -- redist32_xip1_16_uid291_sincosTest_b_1(DELAY,693)
    redist32_xip1_16_uid291_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 71, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xip1_16_uid291_sincosTest_b, xout => redist32_xip1_16_uid291_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- xip1E_17_uid303_sincosTest(ADDSUB,302)@5
    xip1E_17_uid303_sincosTest_s <= redist30_xMSB_uid294_sincosTest_b_2_q;
    xip1E_17_uid303_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((72 downto 71 => redist32_xip1_16_uid291_sincosTest_b_1_q(70)) & redist32_xip1_16_uid291_sincosTest_b_1_q));
    xip1E_17_uid303_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((72 downto 55 => twoToMiSiYip_uid300_sincosTest_b(54)) & twoToMiSiYip_uid300_sincosTest_b));
    xip1E_17_uid303_sincosTest_combproc: PROCESS (xip1E_17_uid303_sincosTest_a, xip1E_17_uid303_sincosTest_b, xip1E_17_uid303_sincosTest_s)
    BEGIN
        IF (xip1E_17_uid303_sincosTest_s = "1") THEN
            xip1E_17_uid303_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_17_uid303_sincosTest_a) + SIGNED(xip1E_17_uid303_sincosTest_b));
        ELSE
            xip1E_17_uid303_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_17_uid303_sincosTest_a) - SIGNED(xip1E_17_uid303_sincosTest_b));
        END IF;
    END PROCESS;
    xip1E_17_uid303_sincosTest_q <= xip1E_17_uid303_sincosTest_o(71 downto 0);

    -- xip1_17_uid310_sincosTest(BITSELECT,309)@5
    xip1_17_uid310_sincosTest_in <= STD_LOGIC_VECTOR(xip1E_17_uid303_sincosTest_q(70 downto 0));
    xip1_17_uid310_sincosTest_b <= STD_LOGIC_VECTOR(xip1_17_uid310_sincosTest_in(70 downto 0));

    -- twoToMiSiXip_uid318_sincosTest(BITSELECT,317)@5
    twoToMiSiXip_uid318_sincosTest_b <= STD_LOGIC_VECTOR(xip1_17_uid310_sincosTest_b(70 downto 17));

    -- signOfSelectionSignal_uid296_sincosTest(LOGICAL,295)@5
    signOfSelectionSignal_uid296_sincosTest_q <= not (redist30_xMSB_uid294_sincosTest_b_2_q);

    -- twoToMiSiXip_uid299_sincosTest(BITSELECT,298)@5
    twoToMiSiXip_uid299_sincosTest_b <= STD_LOGIC_VECTOR(redist32_xip1_16_uid291_sincosTest_b_1_q(70 downto 16));

    -- yip1E_17_uid304_sincosTest(ADDSUB,303)@5
    yip1E_17_uid304_sincosTest_s <= signOfSelectionSignal_uid296_sincosTest_q;
    yip1E_17_uid304_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((72 downto 71 => redist31_yip1_16_uid292_sincosTest_b_1_q(70)) & redist31_yip1_16_uid292_sincosTest_b_1_q));
    yip1E_17_uid304_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((72 downto 55 => twoToMiSiXip_uid299_sincosTest_b(54)) & twoToMiSiXip_uid299_sincosTest_b));
    yip1E_17_uid304_sincosTest_combproc: PROCESS (yip1E_17_uid304_sincosTest_a, yip1E_17_uid304_sincosTest_b, yip1E_17_uid304_sincosTest_s)
    BEGIN
        IF (yip1E_17_uid304_sincosTest_s = "1") THEN
            yip1E_17_uid304_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_17_uid304_sincosTest_a) + SIGNED(yip1E_17_uid304_sincosTest_b));
        ELSE
            yip1E_17_uid304_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_17_uid304_sincosTest_a) - SIGNED(yip1E_17_uid304_sincosTest_b));
        END IF;
    END PROCESS;
    yip1E_17_uid304_sincosTest_q <= yip1E_17_uid304_sincosTest_o(71 downto 0);

    -- yip1_17_uid311_sincosTest(BITSELECT,310)@5
    yip1_17_uid311_sincosTest_in <= STD_LOGIC_VECTOR(yip1E_17_uid304_sincosTest_q(70 downto 0));
    yip1_17_uid311_sincosTest_b <= STD_LOGIC_VECTOR(yip1_17_uid311_sincosTest_in(70 downto 0));

    -- yip1E_18_uid323_sincosTest(ADDSUB,322)@5
    yip1E_18_uid323_sincosTest_s <= signOfSelectionSignal_uid315_sincosTest_q;
    yip1E_18_uid323_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((72 downto 71 => yip1_17_uid311_sincosTest_b(70)) & yip1_17_uid311_sincosTest_b));
    yip1E_18_uid323_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((72 downto 54 => twoToMiSiXip_uid318_sincosTest_b(53)) & twoToMiSiXip_uid318_sincosTest_b));
    yip1E_18_uid323_sincosTest_combproc: PROCESS (yip1E_18_uid323_sincosTest_a, yip1E_18_uid323_sincosTest_b, yip1E_18_uid323_sincosTest_s)
    BEGIN
        IF (yip1E_18_uid323_sincosTest_s = "1") THEN
            yip1E_18_uid323_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_18_uid323_sincosTest_a) + SIGNED(yip1E_18_uid323_sincosTest_b));
        ELSE
            yip1E_18_uid323_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_18_uid323_sincosTest_a) - SIGNED(yip1E_18_uid323_sincosTest_b));
        END IF;
    END PROCESS;
    yip1E_18_uid323_sincosTest_q <= yip1E_18_uid323_sincosTest_o(71 downto 0);

    -- yip1_18_uid330_sincosTest(BITSELECT,329)@5
    yip1_18_uid330_sincosTest_in <= STD_LOGIC_VECTOR(yip1E_18_uid323_sincosTest_q(70 downto 0));
    yip1_18_uid330_sincosTest_b <= STD_LOGIC_VECTOR(yip1_18_uid330_sincosTest_in(70 downto 0));

    -- twoToMiSiYip_uid338_sincosTest(BITSELECT,337)@5
    twoToMiSiYip_uid338_sincosTest_b <= STD_LOGIC_VECTOR(yip1_18_uid330_sincosTest_b(70 downto 18));

    -- twoToMiSiYip_uid319_sincosTest(BITSELECT,318)@5
    twoToMiSiYip_uid319_sincosTest_b <= STD_LOGIC_VECTOR(yip1_17_uid311_sincosTest_b(70 downto 17));

    -- xip1E_18_uid322_sincosTest(ADDSUB,321)@5
    xip1E_18_uid322_sincosTest_s <= redist28_xMSB_uid313_sincosTest_b_1_q;
    xip1E_18_uid322_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((72 downto 71 => xip1_17_uid310_sincosTest_b(70)) & xip1_17_uid310_sincosTest_b));
    xip1E_18_uid322_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((72 downto 54 => twoToMiSiYip_uid319_sincosTest_b(53)) & twoToMiSiYip_uid319_sincosTest_b));
    xip1E_18_uid322_sincosTest_combproc: PROCESS (xip1E_18_uid322_sincosTest_a, xip1E_18_uid322_sincosTest_b, xip1E_18_uid322_sincosTest_s)
    BEGIN
        IF (xip1E_18_uid322_sincosTest_s = "1") THEN
            xip1E_18_uid322_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_18_uid322_sincosTest_a) + SIGNED(xip1E_18_uid322_sincosTest_b));
        ELSE
            xip1E_18_uid322_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_18_uid322_sincosTest_a) - SIGNED(xip1E_18_uid322_sincosTest_b));
        END IF;
    END PROCESS;
    xip1E_18_uid322_sincosTest_q <= xip1E_18_uid322_sincosTest_o(71 downto 0);

    -- xip1_18_uid329_sincosTest(BITSELECT,328)@5
    xip1_18_uid329_sincosTest_in <= STD_LOGIC_VECTOR(xip1E_18_uid322_sincosTest_q(70 downto 0));
    xip1_18_uid329_sincosTest_b <= STD_LOGIC_VECTOR(xip1_18_uid329_sincosTest_in(70 downto 0));

    -- xip1E_19_uid341_sincosTest(ADDSUB,340)@5
    xip1E_19_uid341_sincosTest_s <= redist27_xMSB_uid332_sincosTest_b_1_q;
    xip1E_19_uid341_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((72 downto 71 => xip1_18_uid329_sincosTest_b(70)) & xip1_18_uid329_sincosTest_b));
    xip1E_19_uid341_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((72 downto 53 => twoToMiSiYip_uid338_sincosTest_b(52)) & twoToMiSiYip_uid338_sincosTest_b));
    xip1E_19_uid341_sincosTest_combproc: PROCESS (xip1E_19_uid341_sincosTest_a, xip1E_19_uid341_sincosTest_b, xip1E_19_uid341_sincosTest_s)
    BEGIN
        IF (xip1E_19_uid341_sincosTest_s = "1") THEN
            xip1E_19_uid341_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_19_uid341_sincosTest_a) + SIGNED(xip1E_19_uid341_sincosTest_b));
        ELSE
            xip1E_19_uid341_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_19_uid341_sincosTest_a) - SIGNED(xip1E_19_uid341_sincosTest_b));
        END IF;
    END PROCESS;
    xip1E_19_uid341_sincosTest_q <= xip1E_19_uid341_sincosTest_o(71 downto 0);

    -- xip1_19_uid348_sincosTest(BITSELECT,347)@5
    xip1_19_uid348_sincosTest_in <= STD_LOGIC_VECTOR(xip1E_19_uid341_sincosTest_q(70 downto 0));
    xip1_19_uid348_sincosTest_b <= STD_LOGIC_VECTOR(xip1_19_uid348_sincosTest_in(70 downto 0));

    -- twoToMiSiXip_uid356_sincosTest(BITSELECT,355)@5
    twoToMiSiXip_uid356_sincosTest_b <= STD_LOGIC_VECTOR(xip1_19_uid348_sincosTest_b(70 downto 19));

    -- signOfSelectionSignal_uid334_sincosTest(LOGICAL,333)@5
    signOfSelectionSignal_uid334_sincosTest_q <= not (redist27_xMSB_uid332_sincosTest_b_1_q);

    -- twoToMiSiXip_uid337_sincosTest(BITSELECT,336)@5
    twoToMiSiXip_uid337_sincosTest_b <= STD_LOGIC_VECTOR(xip1_18_uid329_sincosTest_b(70 downto 18));

    -- yip1E_19_uid342_sincosTest(ADDSUB,341)@5
    yip1E_19_uid342_sincosTest_s <= signOfSelectionSignal_uid334_sincosTest_q;
    yip1E_19_uid342_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((72 downto 71 => yip1_18_uid330_sincosTest_b(70)) & yip1_18_uid330_sincosTest_b));
    yip1E_19_uid342_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((72 downto 53 => twoToMiSiXip_uid337_sincosTest_b(52)) & twoToMiSiXip_uid337_sincosTest_b));
    yip1E_19_uid342_sincosTest_combproc: PROCESS (yip1E_19_uid342_sincosTest_a, yip1E_19_uid342_sincosTest_b, yip1E_19_uid342_sincosTest_s)
    BEGIN
        IF (yip1E_19_uid342_sincosTest_s = "1") THEN
            yip1E_19_uid342_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_19_uid342_sincosTest_a) + SIGNED(yip1E_19_uid342_sincosTest_b));
        ELSE
            yip1E_19_uid342_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_19_uid342_sincosTest_a) - SIGNED(yip1E_19_uid342_sincosTest_b));
        END IF;
    END PROCESS;
    yip1E_19_uid342_sincosTest_q <= yip1E_19_uid342_sincosTest_o(71 downto 0);

    -- yip1_19_uid349_sincosTest(BITSELECT,348)@5
    yip1_19_uid349_sincosTest_in <= STD_LOGIC_VECTOR(yip1E_19_uid342_sincosTest_q(70 downto 0));
    yip1_19_uid349_sincosTest_b <= STD_LOGIC_VECTOR(yip1_19_uid349_sincosTest_in(70 downto 0));

    -- yip1E_20_uid361_sincosTest(ADDSUB,360)@5
    yip1E_20_uid361_sincosTest_s <= signOfSelectionSignal_uid353_sincosTest_q;
    yip1E_20_uid361_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((72 downto 71 => yip1_19_uid349_sincosTest_b(70)) & yip1_19_uid349_sincosTest_b));
    yip1E_20_uid361_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((72 downto 52 => twoToMiSiXip_uid356_sincosTest_b(51)) & twoToMiSiXip_uid356_sincosTest_b));
    yip1E_20_uid361_sincosTest_combproc: PROCESS (yip1E_20_uid361_sincosTest_a, yip1E_20_uid361_sincosTest_b, yip1E_20_uid361_sincosTest_s)
    BEGIN
        IF (yip1E_20_uid361_sincosTest_s = "1") THEN
            yip1E_20_uid361_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_20_uid361_sincosTest_a) + SIGNED(yip1E_20_uid361_sincosTest_b));
        ELSE
            yip1E_20_uid361_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_20_uid361_sincosTest_a) - SIGNED(yip1E_20_uid361_sincosTest_b));
        END IF;
    END PROCESS;
    yip1E_20_uid361_sincosTest_q <= yip1E_20_uid361_sincosTest_o(71 downto 0);

    -- yip1_20_uid368_sincosTest(BITSELECT,367)@5
    yip1_20_uid368_sincosTest_in <= STD_LOGIC_VECTOR(yip1E_20_uid361_sincosTest_q(70 downto 0));
    yip1_20_uid368_sincosTest_b <= STD_LOGIC_VECTOR(yip1_20_uid368_sincosTest_in(70 downto 0));

    -- redist24_yip1_20_uid368_sincosTest_b_1(DELAY,685)
    redist24_yip1_20_uid368_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 71, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => yip1_20_uid368_sincosTest_b, xout => redist24_yip1_20_uid368_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- twoToMiSiYip_uid376_sincosTest(BITSELECT,375)@6
    twoToMiSiYip_uid376_sincosTest_b <= STD_LOGIC_VECTOR(redist24_yip1_20_uid368_sincosTest_b_1_q(70 downto 20));

    -- twoToMiSiYip_uid357_sincosTest(BITSELECT,356)@5
    twoToMiSiYip_uid357_sincosTest_b <= STD_LOGIC_VECTOR(yip1_19_uid349_sincosTest_b(70 downto 19));

    -- xip1E_20_uid360_sincosTest(ADDSUB,359)@5
    xip1E_20_uid360_sincosTest_s <= redist26_xMSB_uid351_sincosTest_b_1_q;
    xip1E_20_uid360_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((72 downto 71 => xip1_19_uid348_sincosTest_b(70)) & xip1_19_uid348_sincosTest_b));
    xip1E_20_uid360_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((72 downto 52 => twoToMiSiYip_uid357_sincosTest_b(51)) & twoToMiSiYip_uid357_sincosTest_b));
    xip1E_20_uid360_sincosTest_combproc: PROCESS (xip1E_20_uid360_sincosTest_a, xip1E_20_uid360_sincosTest_b, xip1E_20_uid360_sincosTest_s)
    BEGIN
        IF (xip1E_20_uid360_sincosTest_s = "1") THEN
            xip1E_20_uid360_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_20_uid360_sincosTest_a) + SIGNED(xip1E_20_uid360_sincosTest_b));
        ELSE
            xip1E_20_uid360_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_20_uid360_sincosTest_a) - SIGNED(xip1E_20_uid360_sincosTest_b));
        END IF;
    END PROCESS;
    xip1E_20_uid360_sincosTest_q <= xip1E_20_uid360_sincosTest_o(71 downto 0);

    -- xip1_20_uid367_sincosTest(BITSELECT,366)@5
    xip1_20_uid367_sincosTest_in <= STD_LOGIC_VECTOR(xip1E_20_uid360_sincosTest_q(70 downto 0));
    xip1_20_uid367_sincosTest_b <= STD_LOGIC_VECTOR(xip1_20_uid367_sincosTest_in(70 downto 0));

    -- redist25_xip1_20_uid367_sincosTest_b_1(DELAY,686)
    redist25_xip1_20_uid367_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 71, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xip1_20_uid367_sincosTest_b, xout => redist25_xip1_20_uid367_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- xip1E_21_uid379_sincosTest(ADDSUB,378)@6
    xip1E_21_uid379_sincosTest_s <= redist23_xMSB_uid370_sincosTest_b_2_q;
    xip1E_21_uid379_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((72 downto 71 => redist25_xip1_20_uid367_sincosTest_b_1_q(70)) & redist25_xip1_20_uid367_sincosTest_b_1_q));
    xip1E_21_uid379_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((72 downto 51 => twoToMiSiYip_uid376_sincosTest_b(50)) & twoToMiSiYip_uid376_sincosTest_b));
    xip1E_21_uid379_sincosTest_combproc: PROCESS (xip1E_21_uid379_sincosTest_a, xip1E_21_uid379_sincosTest_b, xip1E_21_uid379_sincosTest_s)
    BEGIN
        IF (xip1E_21_uid379_sincosTest_s = "1") THEN
            xip1E_21_uid379_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_21_uid379_sincosTest_a) + SIGNED(xip1E_21_uid379_sincosTest_b));
        ELSE
            xip1E_21_uid379_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_21_uid379_sincosTest_a) - SIGNED(xip1E_21_uid379_sincosTest_b));
        END IF;
    END PROCESS;
    xip1E_21_uid379_sincosTest_q <= xip1E_21_uid379_sincosTest_o(71 downto 0);

    -- xip1_21_uid386_sincosTest(BITSELECT,385)@6
    xip1_21_uid386_sincosTest_in <= STD_LOGIC_VECTOR(xip1E_21_uid379_sincosTest_q(70 downto 0));
    xip1_21_uid386_sincosTest_b <= STD_LOGIC_VECTOR(xip1_21_uid386_sincosTest_in(70 downto 0));

    -- twoToMiSiXip_uid394_sincosTest(BITSELECT,393)@6
    twoToMiSiXip_uid394_sincosTest_b <= STD_LOGIC_VECTOR(xip1_21_uid386_sincosTest_b(70 downto 21));

    -- signOfSelectionSignal_uid372_sincosTest(LOGICAL,371)@6
    signOfSelectionSignal_uid372_sincosTest_q <= not (redist23_xMSB_uid370_sincosTest_b_2_q);

    -- twoToMiSiXip_uid375_sincosTest(BITSELECT,374)@6
    twoToMiSiXip_uid375_sincosTest_b <= STD_LOGIC_VECTOR(redist25_xip1_20_uid367_sincosTest_b_1_q(70 downto 20));

    -- yip1E_21_uid380_sincosTest(ADDSUB,379)@6
    yip1E_21_uid380_sincosTest_s <= signOfSelectionSignal_uid372_sincosTest_q;
    yip1E_21_uid380_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((72 downto 71 => redist24_yip1_20_uid368_sincosTest_b_1_q(70)) & redist24_yip1_20_uid368_sincosTest_b_1_q));
    yip1E_21_uid380_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((72 downto 51 => twoToMiSiXip_uid375_sincosTest_b(50)) & twoToMiSiXip_uid375_sincosTest_b));
    yip1E_21_uid380_sincosTest_combproc: PROCESS (yip1E_21_uid380_sincosTest_a, yip1E_21_uid380_sincosTest_b, yip1E_21_uid380_sincosTest_s)
    BEGIN
        IF (yip1E_21_uid380_sincosTest_s = "1") THEN
            yip1E_21_uid380_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_21_uid380_sincosTest_a) + SIGNED(yip1E_21_uid380_sincosTest_b));
        ELSE
            yip1E_21_uid380_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_21_uid380_sincosTest_a) - SIGNED(yip1E_21_uid380_sincosTest_b));
        END IF;
    END PROCESS;
    yip1E_21_uid380_sincosTest_q <= yip1E_21_uid380_sincosTest_o(71 downto 0);

    -- yip1_21_uid387_sincosTest(BITSELECT,386)@6
    yip1_21_uid387_sincosTest_in <= STD_LOGIC_VECTOR(yip1E_21_uid380_sincosTest_q(70 downto 0));
    yip1_21_uid387_sincosTest_b <= STD_LOGIC_VECTOR(yip1_21_uid387_sincosTest_in(70 downto 0));

    -- yip1E_22_uid399_sincosTest(ADDSUB,398)@6
    yip1E_22_uid399_sincosTest_s <= signOfSelectionSignal_uid391_sincosTest_q;
    yip1E_22_uid399_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((72 downto 71 => yip1_21_uid387_sincosTest_b(70)) & yip1_21_uid387_sincosTest_b));
    yip1E_22_uid399_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((72 downto 50 => twoToMiSiXip_uid394_sincosTest_b(49)) & twoToMiSiXip_uid394_sincosTest_b));
    yip1E_22_uid399_sincosTest_combproc: PROCESS (yip1E_22_uid399_sincosTest_a, yip1E_22_uid399_sincosTest_b, yip1E_22_uid399_sincosTest_s)
    BEGIN
        IF (yip1E_22_uid399_sincosTest_s = "1") THEN
            yip1E_22_uid399_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_22_uid399_sincosTest_a) + SIGNED(yip1E_22_uid399_sincosTest_b));
        ELSE
            yip1E_22_uid399_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_22_uid399_sincosTest_a) - SIGNED(yip1E_22_uid399_sincosTest_b));
        END IF;
    END PROCESS;
    yip1E_22_uid399_sincosTest_q <= yip1E_22_uid399_sincosTest_o(71 downto 0);

    -- yip1_22_uid406_sincosTest(BITSELECT,405)@6
    yip1_22_uid406_sincosTest_in <= STD_LOGIC_VECTOR(yip1E_22_uid399_sincosTest_q(70 downto 0));
    yip1_22_uid406_sincosTest_b <= STD_LOGIC_VECTOR(yip1_22_uid406_sincosTest_in(70 downto 0));

    -- twoToMiSiYip_uid414_sincosTest(BITSELECT,413)@6
    twoToMiSiYip_uid414_sincosTest_b <= STD_LOGIC_VECTOR(yip1_22_uid406_sincosTest_b(70 downto 22));

    -- twoToMiSiYip_uid395_sincosTest(BITSELECT,394)@6
    twoToMiSiYip_uid395_sincosTest_b <= STD_LOGIC_VECTOR(yip1_21_uid387_sincosTest_b(70 downto 21));

    -- xip1E_22_uid398_sincosTest(ADDSUB,397)@6
    xip1E_22_uid398_sincosTest_s <= redist22_xMSB_uid389_sincosTest_b_2_q;
    xip1E_22_uid398_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((72 downto 71 => xip1_21_uid386_sincosTest_b(70)) & xip1_21_uid386_sincosTest_b));
    xip1E_22_uid398_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((72 downto 50 => twoToMiSiYip_uid395_sincosTest_b(49)) & twoToMiSiYip_uid395_sincosTest_b));
    xip1E_22_uid398_sincosTest_combproc: PROCESS (xip1E_22_uid398_sincosTest_a, xip1E_22_uid398_sincosTest_b, xip1E_22_uid398_sincosTest_s)
    BEGIN
        IF (xip1E_22_uid398_sincosTest_s = "1") THEN
            xip1E_22_uid398_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_22_uid398_sincosTest_a) + SIGNED(xip1E_22_uid398_sincosTest_b));
        ELSE
            xip1E_22_uid398_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_22_uid398_sincosTest_a) - SIGNED(xip1E_22_uid398_sincosTest_b));
        END IF;
    END PROCESS;
    xip1E_22_uid398_sincosTest_q <= xip1E_22_uid398_sincosTest_o(71 downto 0);

    -- xip1_22_uid405_sincosTest(BITSELECT,404)@6
    xip1_22_uid405_sincosTest_in <= STD_LOGIC_VECTOR(xip1E_22_uid398_sincosTest_q(70 downto 0));
    xip1_22_uid405_sincosTest_b <= STD_LOGIC_VECTOR(xip1_22_uid405_sincosTest_in(70 downto 0));

    -- xip1E_23_uid417_sincosTest(ADDSUB,416)@6
    xip1E_23_uid417_sincosTest_s <= redist20_xMSB_uid408_sincosTest_b_1_q;
    xip1E_23_uid417_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((72 downto 71 => xip1_22_uid405_sincosTest_b(70)) & xip1_22_uid405_sincosTest_b));
    xip1E_23_uid417_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((72 downto 49 => twoToMiSiYip_uid414_sincosTest_b(48)) & twoToMiSiYip_uid414_sincosTest_b));
    xip1E_23_uid417_sincosTest_combproc: PROCESS (xip1E_23_uid417_sincosTest_a, xip1E_23_uid417_sincosTest_b, xip1E_23_uid417_sincosTest_s)
    BEGIN
        IF (xip1E_23_uid417_sincosTest_s = "1") THEN
            xip1E_23_uid417_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_23_uid417_sincosTest_a) + SIGNED(xip1E_23_uid417_sincosTest_b));
        ELSE
            xip1E_23_uid417_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_23_uid417_sincosTest_a) - SIGNED(xip1E_23_uid417_sincosTest_b));
        END IF;
    END PROCESS;
    xip1E_23_uid417_sincosTest_q <= xip1E_23_uid417_sincosTest_o(71 downto 0);

    -- xip1_23_uid424_sincosTest(BITSELECT,423)@6
    xip1_23_uid424_sincosTest_in <= STD_LOGIC_VECTOR(xip1E_23_uid417_sincosTest_q(70 downto 0));
    xip1_23_uid424_sincosTest_b <= STD_LOGIC_VECTOR(xip1_23_uid424_sincosTest_in(70 downto 0));

    -- twoToMiSiXip_uid432_sincosTest(BITSELECT,431)@6
    twoToMiSiXip_uid432_sincosTest_b <= STD_LOGIC_VECTOR(xip1_23_uid424_sincosTest_b(70 downto 23));

    -- signOfSelectionSignal_uid410_sincosTest(LOGICAL,409)@6
    signOfSelectionSignal_uid410_sincosTest_q <= not (redist20_xMSB_uid408_sincosTest_b_1_q);

    -- twoToMiSiXip_uid413_sincosTest(BITSELECT,412)@6
    twoToMiSiXip_uid413_sincosTest_b <= STD_LOGIC_VECTOR(xip1_22_uid405_sincosTest_b(70 downto 22));

    -- yip1E_23_uid418_sincosTest(ADDSUB,417)@6
    yip1E_23_uid418_sincosTest_s <= signOfSelectionSignal_uid410_sincosTest_q;
    yip1E_23_uid418_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((72 downto 71 => yip1_22_uid406_sincosTest_b(70)) & yip1_22_uid406_sincosTest_b));
    yip1E_23_uid418_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((72 downto 49 => twoToMiSiXip_uid413_sincosTest_b(48)) & twoToMiSiXip_uid413_sincosTest_b));
    yip1E_23_uid418_sincosTest_combproc: PROCESS (yip1E_23_uid418_sincosTest_a, yip1E_23_uid418_sincosTest_b, yip1E_23_uid418_sincosTest_s)
    BEGIN
        IF (yip1E_23_uid418_sincosTest_s = "1") THEN
            yip1E_23_uid418_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_23_uid418_sincosTest_a) + SIGNED(yip1E_23_uid418_sincosTest_b));
        ELSE
            yip1E_23_uid418_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_23_uid418_sincosTest_a) - SIGNED(yip1E_23_uid418_sincosTest_b));
        END IF;
    END PROCESS;
    yip1E_23_uid418_sincosTest_q <= yip1E_23_uid418_sincosTest_o(71 downto 0);

    -- yip1_23_uid425_sincosTest(BITSELECT,424)@6
    yip1_23_uid425_sincosTest_in <= STD_LOGIC_VECTOR(yip1E_23_uid418_sincosTest_q(70 downto 0));
    yip1_23_uid425_sincosTest_b <= STD_LOGIC_VECTOR(yip1_23_uid425_sincosTest_in(70 downto 0));

    -- yip1E_24_uid437_sincosTest(ADDSUB,436)@6
    yip1E_24_uid437_sincosTest_s <= signOfSelectionSignal_uid429_sincosTest_q;
    yip1E_24_uid437_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((72 downto 71 => yip1_23_uid425_sincosTest_b(70)) & yip1_23_uid425_sincosTest_b));
    yip1E_24_uid437_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((72 downto 48 => twoToMiSiXip_uid432_sincosTest_b(47)) & twoToMiSiXip_uid432_sincosTest_b));
    yip1E_24_uid437_sincosTest_combproc: PROCESS (yip1E_24_uid437_sincosTest_a, yip1E_24_uid437_sincosTest_b, yip1E_24_uid437_sincosTest_s)
    BEGIN
        IF (yip1E_24_uid437_sincosTest_s = "1") THEN
            yip1E_24_uid437_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_24_uid437_sincosTest_a) + SIGNED(yip1E_24_uid437_sincosTest_b));
        ELSE
            yip1E_24_uid437_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_24_uid437_sincosTest_a) - SIGNED(yip1E_24_uid437_sincosTest_b));
        END IF;
    END PROCESS;
    yip1E_24_uid437_sincosTest_q <= yip1E_24_uid437_sincosTest_o(71 downto 0);

    -- yip1_24_uid444_sincosTest(BITSELECT,443)@6
    yip1_24_uid444_sincosTest_in <= STD_LOGIC_VECTOR(yip1E_24_uid437_sincosTest_q(70 downto 0));
    yip1_24_uid444_sincosTest_b <= STD_LOGIC_VECTOR(yip1_24_uid444_sincosTest_in(70 downto 0));

    -- redist17_yip1_24_uid444_sincosTest_b_1(DELAY,678)
    redist17_yip1_24_uid444_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 71, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => yip1_24_uid444_sincosTest_b, xout => redist17_yip1_24_uid444_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- twoToMiSiYip_uid452_sincosTest(BITSELECT,451)@7
    twoToMiSiYip_uid452_sincosTest_b <= STD_LOGIC_VECTOR(redist17_yip1_24_uid444_sincosTest_b_1_q(70 downto 24));

    -- twoToMiSiYip_uid433_sincosTest(BITSELECT,432)@6
    twoToMiSiYip_uid433_sincosTest_b <= STD_LOGIC_VECTOR(yip1_23_uid425_sincosTest_b(70 downto 23));

    -- xip1E_24_uid436_sincosTest(ADDSUB,435)@6
    xip1E_24_uid436_sincosTest_s <= redist19_xMSB_uid427_sincosTest_b_1_q;
    xip1E_24_uid436_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((72 downto 71 => xip1_23_uid424_sincosTest_b(70)) & xip1_23_uid424_sincosTest_b));
    xip1E_24_uid436_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((72 downto 48 => twoToMiSiYip_uid433_sincosTest_b(47)) & twoToMiSiYip_uid433_sincosTest_b));
    xip1E_24_uid436_sincosTest_combproc: PROCESS (xip1E_24_uid436_sincosTest_a, xip1E_24_uid436_sincosTest_b, xip1E_24_uid436_sincosTest_s)
    BEGIN
        IF (xip1E_24_uid436_sincosTest_s = "1") THEN
            xip1E_24_uid436_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_24_uid436_sincosTest_a) + SIGNED(xip1E_24_uid436_sincosTest_b));
        ELSE
            xip1E_24_uid436_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_24_uid436_sincosTest_a) - SIGNED(xip1E_24_uid436_sincosTest_b));
        END IF;
    END PROCESS;
    xip1E_24_uid436_sincosTest_q <= xip1E_24_uid436_sincosTest_o(71 downto 0);

    -- xip1_24_uid443_sincosTest(BITSELECT,442)@6
    xip1_24_uid443_sincosTest_in <= STD_LOGIC_VECTOR(xip1E_24_uid436_sincosTest_q(70 downto 0));
    xip1_24_uid443_sincosTest_b <= STD_LOGIC_VECTOR(xip1_24_uid443_sincosTest_in(70 downto 0));

    -- redist18_xip1_24_uid443_sincosTest_b_1(DELAY,679)
    redist18_xip1_24_uid443_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 71, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xip1_24_uid443_sincosTest_b, xout => redist18_xip1_24_uid443_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- xip1E_25_uid455_sincosTest(ADDSUB,454)@7
    xip1E_25_uid455_sincosTest_s <= redist16_xMSB_uid446_sincosTest_b_2_q;
    xip1E_25_uid455_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((72 downto 71 => redist18_xip1_24_uid443_sincosTest_b_1_q(70)) & redist18_xip1_24_uid443_sincosTest_b_1_q));
    xip1E_25_uid455_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((72 downto 47 => twoToMiSiYip_uid452_sincosTest_b(46)) & twoToMiSiYip_uid452_sincosTest_b));
    xip1E_25_uid455_sincosTest_combproc: PROCESS (xip1E_25_uid455_sincosTest_a, xip1E_25_uid455_sincosTest_b, xip1E_25_uid455_sincosTest_s)
    BEGIN
        IF (xip1E_25_uid455_sincosTest_s = "1") THEN
            xip1E_25_uid455_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_25_uid455_sincosTest_a) + SIGNED(xip1E_25_uid455_sincosTest_b));
        ELSE
            xip1E_25_uid455_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_25_uid455_sincosTest_a) - SIGNED(xip1E_25_uid455_sincosTest_b));
        END IF;
    END PROCESS;
    xip1E_25_uid455_sincosTest_q <= xip1E_25_uid455_sincosTest_o(71 downto 0);

    -- xip1_25_uid462_sincosTest(BITSELECT,461)@7
    xip1_25_uid462_sincosTest_in <= STD_LOGIC_VECTOR(xip1E_25_uid455_sincosTest_q(70 downto 0));
    xip1_25_uid462_sincosTest_b <= STD_LOGIC_VECTOR(xip1_25_uid462_sincosTest_in(70 downto 0));

    -- twoToMiSiXip_uid470_sincosTest(BITSELECT,469)@7
    twoToMiSiXip_uid470_sincosTest_b <= STD_LOGIC_VECTOR(xip1_25_uid462_sincosTest_b(70 downto 25));

    -- signOfSelectionSignal_uid448_sincosTest(LOGICAL,447)@7
    signOfSelectionSignal_uid448_sincosTest_q <= not (redist16_xMSB_uid446_sincosTest_b_2_q);

    -- twoToMiSiXip_uid451_sincosTest(BITSELECT,450)@7
    twoToMiSiXip_uid451_sincosTest_b <= STD_LOGIC_VECTOR(redist18_xip1_24_uid443_sincosTest_b_1_q(70 downto 24));

    -- yip1E_25_uid456_sincosTest(ADDSUB,455)@7
    yip1E_25_uid456_sincosTest_s <= signOfSelectionSignal_uid448_sincosTest_q;
    yip1E_25_uid456_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((72 downto 71 => redist17_yip1_24_uid444_sincosTest_b_1_q(70)) & redist17_yip1_24_uid444_sincosTest_b_1_q));
    yip1E_25_uid456_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((72 downto 47 => twoToMiSiXip_uid451_sincosTest_b(46)) & twoToMiSiXip_uid451_sincosTest_b));
    yip1E_25_uid456_sincosTest_combproc: PROCESS (yip1E_25_uid456_sincosTest_a, yip1E_25_uid456_sincosTest_b, yip1E_25_uid456_sincosTest_s)
    BEGIN
        IF (yip1E_25_uid456_sincosTest_s = "1") THEN
            yip1E_25_uid456_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_25_uid456_sincosTest_a) + SIGNED(yip1E_25_uid456_sincosTest_b));
        ELSE
            yip1E_25_uid456_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_25_uid456_sincosTest_a) - SIGNED(yip1E_25_uid456_sincosTest_b));
        END IF;
    END PROCESS;
    yip1E_25_uid456_sincosTest_q <= yip1E_25_uid456_sincosTest_o(71 downto 0);

    -- yip1_25_uid463_sincosTest(BITSELECT,462)@7
    yip1_25_uid463_sincosTest_in <= STD_LOGIC_VECTOR(yip1E_25_uid456_sincosTest_q(70 downto 0));
    yip1_25_uid463_sincosTest_b <= STD_LOGIC_VECTOR(yip1_25_uid463_sincosTest_in(70 downto 0));

    -- yip1E_26_uid475_sincosTest(ADDSUB,474)@7
    yip1E_26_uid475_sincosTest_s <= signOfSelectionSignal_uid467_sincosTest_q;
    yip1E_26_uid475_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((72 downto 71 => yip1_25_uid463_sincosTest_b(70)) & yip1_25_uid463_sincosTest_b));
    yip1E_26_uid475_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((72 downto 46 => twoToMiSiXip_uid470_sincosTest_b(45)) & twoToMiSiXip_uid470_sincosTest_b));
    yip1E_26_uid475_sincosTest_combproc: PROCESS (yip1E_26_uid475_sincosTest_a, yip1E_26_uid475_sincosTest_b, yip1E_26_uid475_sincosTest_s)
    BEGIN
        IF (yip1E_26_uid475_sincosTest_s = "1") THEN
            yip1E_26_uid475_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_26_uid475_sincosTest_a) + SIGNED(yip1E_26_uid475_sincosTest_b));
        ELSE
            yip1E_26_uid475_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_26_uid475_sincosTest_a) - SIGNED(yip1E_26_uid475_sincosTest_b));
        END IF;
    END PROCESS;
    yip1E_26_uid475_sincosTest_q <= yip1E_26_uid475_sincosTest_o(71 downto 0);

    -- yip1_26_uid482_sincosTest(BITSELECT,481)@7
    yip1_26_uid482_sincosTest_in <= STD_LOGIC_VECTOR(yip1E_26_uid475_sincosTest_q(70 downto 0));
    yip1_26_uid482_sincosTest_b <= STD_LOGIC_VECTOR(yip1_26_uid482_sincosTest_in(70 downto 0));

    -- twoToMiSiYip_uid490_sincosTest(BITSELECT,489)@7
    twoToMiSiYip_uid490_sincosTest_b <= STD_LOGIC_VECTOR(yip1_26_uid482_sincosTest_b(70 downto 26));

    -- twoToMiSiYip_uid471_sincosTest(BITSELECT,470)@7
    twoToMiSiYip_uid471_sincosTest_b <= STD_LOGIC_VECTOR(yip1_25_uid463_sincosTest_b(70 downto 25));

    -- xip1E_26_uid474_sincosTest(ADDSUB,473)@7
    xip1E_26_uid474_sincosTest_s <= redist15_xMSB_uid465_sincosTest_b_2_q;
    xip1E_26_uid474_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((72 downto 71 => xip1_25_uid462_sincosTest_b(70)) & xip1_25_uid462_sincosTest_b));
    xip1E_26_uid474_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((72 downto 46 => twoToMiSiYip_uid471_sincosTest_b(45)) & twoToMiSiYip_uid471_sincosTest_b));
    xip1E_26_uid474_sincosTest_combproc: PROCESS (xip1E_26_uid474_sincosTest_a, xip1E_26_uid474_sincosTest_b, xip1E_26_uid474_sincosTest_s)
    BEGIN
        IF (xip1E_26_uid474_sincosTest_s = "1") THEN
            xip1E_26_uid474_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_26_uid474_sincosTest_a) + SIGNED(xip1E_26_uid474_sincosTest_b));
        ELSE
            xip1E_26_uid474_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_26_uid474_sincosTest_a) - SIGNED(xip1E_26_uid474_sincosTest_b));
        END IF;
    END PROCESS;
    xip1E_26_uid474_sincosTest_q <= xip1E_26_uid474_sincosTest_o(71 downto 0);

    -- xip1_26_uid481_sincosTest(BITSELECT,480)@7
    xip1_26_uid481_sincosTest_in <= STD_LOGIC_VECTOR(xip1E_26_uid474_sincosTest_q(70 downto 0));
    xip1_26_uid481_sincosTest_b <= STD_LOGIC_VECTOR(xip1_26_uid481_sincosTest_in(70 downto 0));

    -- xip1E_27_uid493_sincosTest(ADDSUB,492)@7
    xip1E_27_uid493_sincosTest_s <= redist14_xMSB_uid484_sincosTest_b_2_q;
    xip1E_27_uid493_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((72 downto 71 => xip1_26_uid481_sincosTest_b(70)) & xip1_26_uid481_sincosTest_b));
    xip1E_27_uid493_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((72 downto 45 => twoToMiSiYip_uid490_sincosTest_b(44)) & twoToMiSiYip_uid490_sincosTest_b));
    xip1E_27_uid493_sincosTest_combproc: PROCESS (xip1E_27_uid493_sincosTest_a, xip1E_27_uid493_sincosTest_b, xip1E_27_uid493_sincosTest_s)
    BEGIN
        IF (xip1E_27_uid493_sincosTest_s = "1") THEN
            xip1E_27_uid493_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_27_uid493_sincosTest_a) + SIGNED(xip1E_27_uid493_sincosTest_b));
        ELSE
            xip1E_27_uid493_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_27_uid493_sincosTest_a) - SIGNED(xip1E_27_uid493_sincosTest_b));
        END IF;
    END PROCESS;
    xip1E_27_uid493_sincosTest_q <= xip1E_27_uid493_sincosTest_o(71 downto 0);

    -- xip1_27_uid500_sincosTest(BITSELECT,499)@7
    xip1_27_uid500_sincosTest_in <= STD_LOGIC_VECTOR(xip1E_27_uid493_sincosTest_q(70 downto 0));
    xip1_27_uid500_sincosTest_b <= STD_LOGIC_VECTOR(xip1_27_uid500_sincosTest_in(70 downto 0));

    -- twoToMiSiXip_uid508_sincosTest(BITSELECT,507)@7
    twoToMiSiXip_uid508_sincosTest_b <= STD_LOGIC_VECTOR(xip1_27_uid500_sincosTest_b(70 downto 27));

    -- signOfSelectionSignal_uid486_sincosTest(LOGICAL,485)@7
    signOfSelectionSignal_uid486_sincosTest_q <= not (redist14_xMSB_uid484_sincosTest_b_2_q);

    -- twoToMiSiXip_uid489_sincosTest(BITSELECT,488)@7
    twoToMiSiXip_uid489_sincosTest_b <= STD_LOGIC_VECTOR(xip1_26_uid481_sincosTest_b(70 downto 26));

    -- yip1E_27_uid494_sincosTest(ADDSUB,493)@7
    yip1E_27_uid494_sincosTest_s <= signOfSelectionSignal_uid486_sincosTest_q;
    yip1E_27_uid494_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((72 downto 71 => yip1_26_uid482_sincosTest_b(70)) & yip1_26_uid482_sincosTest_b));
    yip1E_27_uid494_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((72 downto 45 => twoToMiSiXip_uid489_sincosTest_b(44)) & twoToMiSiXip_uid489_sincosTest_b));
    yip1E_27_uid494_sincosTest_combproc: PROCESS (yip1E_27_uid494_sincosTest_a, yip1E_27_uid494_sincosTest_b, yip1E_27_uid494_sincosTest_s)
    BEGIN
        IF (yip1E_27_uid494_sincosTest_s = "1") THEN
            yip1E_27_uid494_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_27_uid494_sincosTest_a) + SIGNED(yip1E_27_uid494_sincosTest_b));
        ELSE
            yip1E_27_uid494_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_27_uid494_sincosTest_a) - SIGNED(yip1E_27_uid494_sincosTest_b));
        END IF;
    END PROCESS;
    yip1E_27_uid494_sincosTest_q <= yip1E_27_uid494_sincosTest_o(71 downto 0);

    -- yip1_27_uid501_sincosTest(BITSELECT,500)@7
    yip1_27_uid501_sincosTest_in <= STD_LOGIC_VECTOR(yip1E_27_uid494_sincosTest_q(70 downto 0));
    yip1_27_uid501_sincosTest_b <= STD_LOGIC_VECTOR(yip1_27_uid501_sincosTest_in(70 downto 0));

    -- yip1E_28_uid513_sincosTest(ADDSUB,512)@7
    yip1E_28_uid513_sincosTest_s <= signOfSelectionSignal_uid505_sincosTest_q;
    yip1E_28_uid513_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((72 downto 71 => yip1_27_uid501_sincosTest_b(70)) & yip1_27_uid501_sincosTest_b));
    yip1E_28_uid513_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((72 downto 44 => twoToMiSiXip_uid508_sincosTest_b(43)) & twoToMiSiXip_uid508_sincosTest_b));
    yip1E_28_uid513_sincosTest_combproc: PROCESS (yip1E_28_uid513_sincosTest_a, yip1E_28_uid513_sincosTest_b, yip1E_28_uid513_sincosTest_s)
    BEGIN
        IF (yip1E_28_uid513_sincosTest_s = "1") THEN
            yip1E_28_uid513_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_28_uid513_sincosTest_a) + SIGNED(yip1E_28_uid513_sincosTest_b));
        ELSE
            yip1E_28_uid513_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_28_uid513_sincosTest_a) - SIGNED(yip1E_28_uid513_sincosTest_b));
        END IF;
    END PROCESS;
    yip1E_28_uid513_sincosTest_q <= yip1E_28_uid513_sincosTest_o(71 downto 0);

    -- yip1_28_uid520_sincosTest(BITSELECT,519)@7
    yip1_28_uid520_sincosTest_in <= STD_LOGIC_VECTOR(yip1E_28_uid513_sincosTest_q(70 downto 0));
    yip1_28_uid520_sincosTest_b <= STD_LOGIC_VECTOR(yip1_28_uid520_sincosTest_in(70 downto 0));

    -- redist10_yip1_28_uid520_sincosTest_b_1(DELAY,671)
    redist10_yip1_28_uid520_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 71, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => yip1_28_uid520_sincosTest_b, xout => redist10_yip1_28_uid520_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- twoToMiSiYip_uid528_sincosTest(BITSELECT,527)@8
    twoToMiSiYip_uid528_sincosTest_b <= STD_LOGIC_VECTOR(redist10_yip1_28_uid520_sincosTest_b_1_q(70 downto 28));

    -- twoToMiSiYip_uid509_sincosTest(BITSELECT,508)@7
    twoToMiSiYip_uid509_sincosTest_b <= STD_LOGIC_VECTOR(yip1_27_uid501_sincosTest_b(70 downto 27));

    -- xip1E_28_uid512_sincosTest(ADDSUB,511)@7
    xip1E_28_uid512_sincosTest_s <= redist12_xMSB_uid503_sincosTest_b_1_q;
    xip1E_28_uid512_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((72 downto 71 => xip1_27_uid500_sincosTest_b(70)) & xip1_27_uid500_sincosTest_b));
    xip1E_28_uid512_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((72 downto 44 => twoToMiSiYip_uid509_sincosTest_b(43)) & twoToMiSiYip_uid509_sincosTest_b));
    xip1E_28_uid512_sincosTest_combproc: PROCESS (xip1E_28_uid512_sincosTest_a, xip1E_28_uid512_sincosTest_b, xip1E_28_uid512_sincosTest_s)
    BEGIN
        IF (xip1E_28_uid512_sincosTest_s = "1") THEN
            xip1E_28_uid512_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_28_uid512_sincosTest_a) + SIGNED(xip1E_28_uid512_sincosTest_b));
        ELSE
            xip1E_28_uid512_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_28_uid512_sincosTest_a) - SIGNED(xip1E_28_uid512_sincosTest_b));
        END IF;
    END PROCESS;
    xip1E_28_uid512_sincosTest_q <= xip1E_28_uid512_sincosTest_o(71 downto 0);

    -- xip1_28_uid519_sincosTest(BITSELECT,518)@7
    xip1_28_uid519_sincosTest_in <= STD_LOGIC_VECTOR(xip1E_28_uid512_sincosTest_q(70 downto 0));
    xip1_28_uid519_sincosTest_b <= STD_LOGIC_VECTOR(xip1_28_uid519_sincosTest_in(70 downto 0));

    -- redist11_xip1_28_uid519_sincosTest_b_1(DELAY,672)
    redist11_xip1_28_uid519_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 71, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xip1_28_uid519_sincosTest_b, xout => redist11_xip1_28_uid519_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- xip1E_29_uid531_sincosTest(ADDSUB,530)@8
    xip1E_29_uid531_sincosTest_s <= redist9_xMSB_uid522_sincosTest_b_2_q;
    xip1E_29_uid531_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((72 downto 71 => redist11_xip1_28_uid519_sincosTest_b_1_q(70)) & redist11_xip1_28_uid519_sincosTest_b_1_q));
    xip1E_29_uid531_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((72 downto 43 => twoToMiSiYip_uid528_sincosTest_b(42)) & twoToMiSiYip_uid528_sincosTest_b));
    xip1E_29_uid531_sincosTest_combproc: PROCESS (xip1E_29_uid531_sincosTest_a, xip1E_29_uid531_sincosTest_b, xip1E_29_uid531_sincosTest_s)
    BEGIN
        IF (xip1E_29_uid531_sincosTest_s = "1") THEN
            xip1E_29_uid531_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_29_uid531_sincosTest_a) + SIGNED(xip1E_29_uid531_sincosTest_b));
        ELSE
            xip1E_29_uid531_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_29_uid531_sincosTest_a) - SIGNED(xip1E_29_uid531_sincosTest_b));
        END IF;
    END PROCESS;
    xip1E_29_uid531_sincosTest_q <= xip1E_29_uid531_sincosTest_o(71 downto 0);

    -- xip1_29_uid538_sincosTest(BITSELECT,537)@8
    xip1_29_uid538_sincosTest_in <= STD_LOGIC_VECTOR(xip1E_29_uid531_sincosTest_q(70 downto 0));
    xip1_29_uid538_sincosTest_b <= STD_LOGIC_VECTOR(xip1_29_uid538_sincosTest_in(70 downto 0));

    -- twoToMiSiXip_uid546_sincosTest(BITSELECT,545)@8
    twoToMiSiXip_uid546_sincosTest_b <= STD_LOGIC_VECTOR(xip1_29_uid538_sincosTest_b(70 downto 29));

    -- signOfSelectionSignal_uid524_sincosTest(LOGICAL,523)@8
    signOfSelectionSignal_uid524_sincosTest_q <= not (redist9_xMSB_uid522_sincosTest_b_2_q);

    -- twoToMiSiXip_uid527_sincosTest(BITSELECT,526)@8
    twoToMiSiXip_uid527_sincosTest_b <= STD_LOGIC_VECTOR(redist11_xip1_28_uid519_sincosTest_b_1_q(70 downto 28));

    -- yip1E_29_uid532_sincosTest(ADDSUB,531)@8
    yip1E_29_uid532_sincosTest_s <= signOfSelectionSignal_uid524_sincosTest_q;
    yip1E_29_uid532_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((72 downto 71 => redist10_yip1_28_uid520_sincosTest_b_1_q(70)) & redist10_yip1_28_uid520_sincosTest_b_1_q));
    yip1E_29_uid532_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((72 downto 43 => twoToMiSiXip_uid527_sincosTest_b(42)) & twoToMiSiXip_uid527_sincosTest_b));
    yip1E_29_uid532_sincosTest_combproc: PROCESS (yip1E_29_uid532_sincosTest_a, yip1E_29_uid532_sincosTest_b, yip1E_29_uid532_sincosTest_s)
    BEGIN
        IF (yip1E_29_uid532_sincosTest_s = "1") THEN
            yip1E_29_uid532_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_29_uid532_sincosTest_a) + SIGNED(yip1E_29_uid532_sincosTest_b));
        ELSE
            yip1E_29_uid532_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_29_uid532_sincosTest_a) - SIGNED(yip1E_29_uid532_sincosTest_b));
        END IF;
    END PROCESS;
    yip1E_29_uid532_sincosTest_q <= yip1E_29_uid532_sincosTest_o(71 downto 0);

    -- yip1_29_uid539_sincosTest(BITSELECT,538)@8
    yip1_29_uid539_sincosTest_in <= STD_LOGIC_VECTOR(yip1E_29_uid532_sincosTest_q(70 downto 0));
    yip1_29_uid539_sincosTest_b <= STD_LOGIC_VECTOR(yip1_29_uid539_sincosTest_in(70 downto 0));

    -- yip1E_30_uid551_sincosTest(ADDSUB,550)@8
    yip1E_30_uid551_sincosTest_s <= signOfSelectionSignal_uid543_sincosTest_q;
    yip1E_30_uid551_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((72 downto 71 => yip1_29_uid539_sincosTest_b(70)) & yip1_29_uid539_sincosTest_b));
    yip1E_30_uid551_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((72 downto 42 => twoToMiSiXip_uid546_sincosTest_b(41)) & twoToMiSiXip_uid546_sincosTest_b));
    yip1E_30_uid551_sincosTest_combproc: PROCESS (yip1E_30_uid551_sincosTest_a, yip1E_30_uid551_sincosTest_b, yip1E_30_uid551_sincosTest_s)
    BEGIN
        IF (yip1E_30_uid551_sincosTest_s = "1") THEN
            yip1E_30_uid551_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_30_uid551_sincosTest_a) + SIGNED(yip1E_30_uid551_sincosTest_b));
        ELSE
            yip1E_30_uid551_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_30_uid551_sincosTest_a) - SIGNED(yip1E_30_uid551_sincosTest_b));
        END IF;
    END PROCESS;
    yip1E_30_uid551_sincosTest_q <= yip1E_30_uid551_sincosTest_o(71 downto 0);

    -- yip1_30_uid558_sincosTest(BITSELECT,557)@8
    yip1_30_uid558_sincosTest_in <= STD_LOGIC_VECTOR(yip1E_30_uid551_sincosTest_q(70 downto 0));
    yip1_30_uid558_sincosTest_b <= STD_LOGIC_VECTOR(yip1_30_uid558_sincosTest_in(70 downto 0));

    -- twoToMiSiYip_uid566_sincosTest(BITSELECT,565)@8
    twoToMiSiYip_uid566_sincosTest_b <= STD_LOGIC_VECTOR(yip1_30_uid558_sincosTest_b(70 downto 30));

    -- twoToMiSiYip_uid547_sincosTest(BITSELECT,546)@8
    twoToMiSiYip_uid547_sincosTest_b <= STD_LOGIC_VECTOR(yip1_29_uid539_sincosTest_b(70 downto 29));

    -- xip1E_30_uid550_sincosTest(ADDSUB,549)@8
    xip1E_30_uid550_sincosTest_s <= redist8_xMSB_uid541_sincosTest_b_2_q;
    xip1E_30_uid550_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((72 downto 71 => xip1_29_uid538_sincosTest_b(70)) & xip1_29_uid538_sincosTest_b));
    xip1E_30_uid550_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((72 downto 42 => twoToMiSiYip_uid547_sincosTest_b(41)) & twoToMiSiYip_uid547_sincosTest_b));
    xip1E_30_uid550_sincosTest_combproc: PROCESS (xip1E_30_uid550_sincosTest_a, xip1E_30_uid550_sincosTest_b, xip1E_30_uid550_sincosTest_s)
    BEGIN
        IF (xip1E_30_uid550_sincosTest_s = "1") THEN
            xip1E_30_uid550_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_30_uid550_sincosTest_a) + SIGNED(xip1E_30_uid550_sincosTest_b));
        ELSE
            xip1E_30_uid550_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_30_uid550_sincosTest_a) - SIGNED(xip1E_30_uid550_sincosTest_b));
        END IF;
    END PROCESS;
    xip1E_30_uid550_sincosTest_q <= xip1E_30_uid550_sincosTest_o(71 downto 0);

    -- xip1_30_uid557_sincosTest(BITSELECT,556)@8
    xip1_30_uid557_sincosTest_in <= STD_LOGIC_VECTOR(xip1E_30_uid550_sincosTest_q(70 downto 0));
    xip1_30_uid557_sincosTest_b <= STD_LOGIC_VECTOR(xip1_30_uid557_sincosTest_in(70 downto 0));

    -- xip1E_31_uid569_sincosTest(ADDSUB,568)@8
    xip1E_31_uid569_sincosTest_s <= redist7_xMSB_uid560_sincosTest_b_2_q;
    xip1E_31_uid569_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((72 downto 71 => xip1_30_uid557_sincosTest_b(70)) & xip1_30_uid557_sincosTest_b));
    xip1E_31_uid569_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((72 downto 41 => twoToMiSiYip_uid566_sincosTest_b(40)) & twoToMiSiYip_uid566_sincosTest_b));
    xip1E_31_uid569_sincosTest_combproc: PROCESS (xip1E_31_uid569_sincosTest_a, xip1E_31_uid569_sincosTest_b, xip1E_31_uid569_sincosTest_s)
    BEGIN
        IF (xip1E_31_uid569_sincosTest_s = "1") THEN
            xip1E_31_uid569_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_31_uid569_sincosTest_a) + SIGNED(xip1E_31_uid569_sincosTest_b));
        ELSE
            xip1E_31_uid569_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_31_uid569_sincosTest_a) - SIGNED(xip1E_31_uid569_sincosTest_b));
        END IF;
    END PROCESS;
    xip1E_31_uid569_sincosTest_q <= xip1E_31_uid569_sincosTest_o(71 downto 0);

    -- xip1_31_uid576_sincosTest(BITSELECT,575)@8
    xip1_31_uid576_sincosTest_in <= STD_LOGIC_VECTOR(xip1E_31_uid569_sincosTest_q(70 downto 0));
    xip1_31_uid576_sincosTest_b <= STD_LOGIC_VECTOR(xip1_31_uid576_sincosTest_in(70 downto 0));

    -- twoToMiSiXip_uid584_sincosTest(BITSELECT,583)@8
    twoToMiSiXip_uid584_sincosTest_b <= STD_LOGIC_VECTOR(xip1_31_uid576_sincosTest_b(70 downto 31));

    -- signOfSelectionSignal_uid562_sincosTest(LOGICAL,561)@8
    signOfSelectionSignal_uid562_sincosTest_q <= not (redist7_xMSB_uid560_sincosTest_b_2_q);

    -- twoToMiSiXip_uid565_sincosTest(BITSELECT,564)@8
    twoToMiSiXip_uid565_sincosTest_b <= STD_LOGIC_VECTOR(xip1_30_uid557_sincosTest_b(70 downto 30));

    -- yip1E_31_uid570_sincosTest(ADDSUB,569)@8
    yip1E_31_uid570_sincosTest_s <= signOfSelectionSignal_uid562_sincosTest_q;
    yip1E_31_uid570_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((72 downto 71 => yip1_30_uid558_sincosTest_b(70)) & yip1_30_uid558_sincosTest_b));
    yip1E_31_uid570_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((72 downto 41 => twoToMiSiXip_uid565_sincosTest_b(40)) & twoToMiSiXip_uid565_sincosTest_b));
    yip1E_31_uid570_sincosTest_combproc: PROCESS (yip1E_31_uid570_sincosTest_a, yip1E_31_uid570_sincosTest_b, yip1E_31_uid570_sincosTest_s)
    BEGIN
        IF (yip1E_31_uid570_sincosTest_s = "1") THEN
            yip1E_31_uid570_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_31_uid570_sincosTest_a) + SIGNED(yip1E_31_uid570_sincosTest_b));
        ELSE
            yip1E_31_uid570_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_31_uid570_sincosTest_a) - SIGNED(yip1E_31_uid570_sincosTest_b));
        END IF;
    END PROCESS;
    yip1E_31_uid570_sincosTest_q <= yip1E_31_uid570_sincosTest_o(71 downto 0);

    -- yip1_31_uid577_sincosTest(BITSELECT,576)@8
    yip1_31_uid577_sincosTest_in <= STD_LOGIC_VECTOR(yip1E_31_uid570_sincosTest_q(70 downto 0));
    yip1_31_uid577_sincosTest_b <= STD_LOGIC_VECTOR(yip1_31_uid577_sincosTest_in(70 downto 0));

    -- yip1E_32_uid589_sincosTest(ADDSUB,588)@8
    yip1E_32_uid589_sincosTest_s <= signOfSelectionSignal_uid581_sincosTest_q;
    yip1E_32_uid589_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((72 downto 71 => yip1_31_uid577_sincosTest_b(70)) & yip1_31_uid577_sincosTest_b));
    yip1E_32_uid589_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((72 downto 40 => twoToMiSiXip_uid584_sincosTest_b(39)) & twoToMiSiXip_uid584_sincosTest_b));
    yip1E_32_uid589_sincosTest_combproc: PROCESS (yip1E_32_uid589_sincosTest_a, yip1E_32_uid589_sincosTest_b, yip1E_32_uid589_sincosTest_s)
    BEGIN
        IF (yip1E_32_uid589_sincosTest_s = "1") THEN
            yip1E_32_uid589_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_32_uid589_sincosTest_a) + SIGNED(yip1E_32_uid589_sincosTest_b));
        ELSE
            yip1E_32_uid589_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_32_uid589_sincosTest_a) - SIGNED(yip1E_32_uid589_sincosTest_b));
        END IF;
    END PROCESS;
    yip1E_32_uid589_sincosTest_q <= yip1E_32_uid589_sincosTest_o(71 downto 0);

    -- yip1_32_uid596_sincosTest(BITSELECT,595)@8
    yip1_32_uid596_sincosTest_in <= STD_LOGIC_VECTOR(yip1E_32_uid589_sincosTest_q(70 downto 0));
    yip1_32_uid596_sincosTest_b <= STD_LOGIC_VECTOR(yip1_32_uid596_sincosTest_in(70 downto 0));

    -- redist4_yip1_32_uid596_sincosTest_b_1(DELAY,665)
    redist4_yip1_32_uid596_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 71, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => yip1_32_uid596_sincosTest_b, xout => redist4_yip1_32_uid596_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- twoToMiSiYip_uid604_sincosTest(BITSELECT,603)@9
    twoToMiSiYip_uid604_sincosTest_b <= STD_LOGIC_VECTOR(redist4_yip1_32_uid596_sincosTest_b_1_q(70 downto 32));

    -- twoToMiSiYip_uid585_sincosTest(BITSELECT,584)@8
    twoToMiSiYip_uid585_sincosTest_b <= STD_LOGIC_VECTOR(yip1_31_uid577_sincosTest_b(70 downto 31));

    -- xip1E_32_uid588_sincosTest(ADDSUB,587)@8
    xip1E_32_uid588_sincosTest_s <= redist6_xMSB_uid579_sincosTest_b_2_q;
    xip1E_32_uid588_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((72 downto 71 => xip1_31_uid576_sincosTest_b(70)) & xip1_31_uid576_sincosTest_b));
    xip1E_32_uid588_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((72 downto 40 => twoToMiSiYip_uid585_sincosTest_b(39)) & twoToMiSiYip_uid585_sincosTest_b));
    xip1E_32_uid588_sincosTest_combproc: PROCESS (xip1E_32_uid588_sincosTest_a, xip1E_32_uid588_sincosTest_b, xip1E_32_uid588_sincosTest_s)
    BEGIN
        IF (xip1E_32_uid588_sincosTest_s = "1") THEN
            xip1E_32_uid588_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_32_uid588_sincosTest_a) + SIGNED(xip1E_32_uid588_sincosTest_b));
        ELSE
            xip1E_32_uid588_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_32_uid588_sincosTest_a) - SIGNED(xip1E_32_uid588_sincosTest_b));
        END IF;
    END PROCESS;
    xip1E_32_uid588_sincosTest_q <= xip1E_32_uid588_sincosTest_o(71 downto 0);

    -- xip1_32_uid595_sincosTest(BITSELECT,594)@8
    xip1_32_uid595_sincosTest_in <= STD_LOGIC_VECTOR(xip1E_32_uid588_sincosTest_q(70 downto 0));
    xip1_32_uid595_sincosTest_b <= STD_LOGIC_VECTOR(xip1_32_uid595_sincosTest_in(70 downto 0));

    -- redist5_xip1_32_uid595_sincosTest_b_1(DELAY,666)
    redist5_xip1_32_uid595_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 71, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xip1_32_uid595_sincosTest_b, xout => redist5_xip1_32_uid595_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- xip1E_33_uid607_sincosTest(ADDSUB,606)@9
    xip1E_33_uid607_sincosTest_s <= redist3_xMSB_uid598_sincosTest_b_3_q;
    xip1E_33_uid607_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((72 downto 71 => redist5_xip1_32_uid595_sincosTest_b_1_q(70)) & redist5_xip1_32_uid595_sincosTest_b_1_q));
    xip1E_33_uid607_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((72 downto 39 => twoToMiSiYip_uid604_sincosTest_b(38)) & twoToMiSiYip_uid604_sincosTest_b));
    xip1E_33_uid607_sincosTest_combproc: PROCESS (xip1E_33_uid607_sincosTest_a, xip1E_33_uid607_sincosTest_b, xip1E_33_uid607_sincosTest_s)
    BEGIN
        IF (xip1E_33_uid607_sincosTest_s = "1") THEN
            xip1E_33_uid607_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_33_uid607_sincosTest_a) + SIGNED(xip1E_33_uid607_sincosTest_b));
        ELSE
            xip1E_33_uid607_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_33_uid607_sincosTest_a) - SIGNED(xip1E_33_uid607_sincosTest_b));
        END IF;
    END PROCESS;
    xip1E_33_uid607_sincosTest_q <= xip1E_33_uid607_sincosTest_o(71 downto 0);

    -- xip1_33_uid614_sincosTest(BITSELECT,613)@9
    xip1_33_uid614_sincosTest_in <= STD_LOGIC_VECTOR(xip1E_33_uid607_sincosTest_q(70 downto 0));
    xip1_33_uid614_sincosTest_b <= STD_LOGIC_VECTOR(xip1_33_uid614_sincosTest_in(70 downto 0));

    -- twoToMiSiXip_uid622_sincosTest(BITSELECT,621)@9
    twoToMiSiXip_uid622_sincosTest_b <= STD_LOGIC_VECTOR(xip1_33_uid614_sincosTest_b(70 downto 33));

    -- signOfSelectionSignal_uid600_sincosTest(LOGICAL,599)@9
    signOfSelectionSignal_uid600_sincosTest_q <= not (redist3_xMSB_uid598_sincosTest_b_3_q);

    -- twoToMiSiXip_uid603_sincosTest(BITSELECT,602)@9
    twoToMiSiXip_uid603_sincosTest_b <= STD_LOGIC_VECTOR(redist5_xip1_32_uid595_sincosTest_b_1_q(70 downto 32));

    -- yip1E_33_uid608_sincosTest(ADDSUB,607)@9
    yip1E_33_uid608_sincosTest_s <= signOfSelectionSignal_uid600_sincosTest_q;
    yip1E_33_uid608_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((72 downto 71 => redist4_yip1_32_uid596_sincosTest_b_1_q(70)) & redist4_yip1_32_uid596_sincosTest_b_1_q));
    yip1E_33_uid608_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((72 downto 39 => twoToMiSiXip_uid603_sincosTest_b(38)) & twoToMiSiXip_uid603_sincosTest_b));
    yip1E_33_uid608_sincosTest_combproc: PROCESS (yip1E_33_uid608_sincosTest_a, yip1E_33_uid608_sincosTest_b, yip1E_33_uid608_sincosTest_s)
    BEGIN
        IF (yip1E_33_uid608_sincosTest_s = "1") THEN
            yip1E_33_uid608_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_33_uid608_sincosTest_a) + SIGNED(yip1E_33_uid608_sincosTest_b));
        ELSE
            yip1E_33_uid608_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_33_uid608_sincosTest_a) - SIGNED(yip1E_33_uid608_sincosTest_b));
        END IF;
    END PROCESS;
    yip1E_33_uid608_sincosTest_q <= yip1E_33_uid608_sincosTest_o(71 downto 0);

    -- yip1_33_uid615_sincosTest(BITSELECT,614)@9
    yip1_33_uid615_sincosTest_in <= STD_LOGIC_VECTOR(yip1E_33_uid608_sincosTest_q(70 downto 0));
    yip1_33_uid615_sincosTest_b <= STD_LOGIC_VECTOR(yip1_33_uid615_sincosTest_in(70 downto 0));

    -- yip1E_34_uid627_sincosTest(ADDSUB,626)@9
    yip1E_34_uid627_sincosTest_s <= signOfSelectionSignal_uid619_sincosTest_q;
    yip1E_34_uid627_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((72 downto 71 => yip1_33_uid615_sincosTest_b(70)) & yip1_33_uid615_sincosTest_b));
    yip1E_34_uid627_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((72 downto 38 => twoToMiSiXip_uid622_sincosTest_b(37)) & twoToMiSiXip_uid622_sincosTest_b));
    yip1E_34_uid627_sincosTest_combproc: PROCESS (yip1E_34_uid627_sincosTest_a, yip1E_34_uid627_sincosTest_b, yip1E_34_uid627_sincosTest_s)
    BEGIN
        IF (yip1E_34_uid627_sincosTest_s = "1") THEN
            yip1E_34_uid627_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_34_uid627_sincosTest_a) + SIGNED(yip1E_34_uid627_sincosTest_b));
        ELSE
            yip1E_34_uid627_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_34_uid627_sincosTest_a) - SIGNED(yip1E_34_uid627_sincosTest_b));
        END IF;
    END PROCESS;
    yip1E_34_uid627_sincosTest_q <= yip1E_34_uid627_sincosTest_o(71 downto 0);

    -- yip1_34_uid634_sincosTest(BITSELECT,633)@9
    yip1_34_uid634_sincosTest_in <= STD_LOGIC_VECTOR(yip1E_34_uid627_sincosTest_q(70 downto 0));
    yip1_34_uid634_sincosTest_b <= STD_LOGIC_VECTOR(yip1_34_uid634_sincosTest_in(70 downto 0));

    -- ySumPreRnd_uid640_sincosTest(BITSELECT,639)@9
    ySumPreRnd_uid640_sincosTest_in <= yip1_34_uid634_sincosTest_b(69 downto 0);
    ySumPreRnd_uid640_sincosTest_b <= ySumPreRnd_uid640_sincosTest_in(69 downto 35);

    -- ySumPostRnd_uid643_sincosTest(ADD,642)@9
    ySumPostRnd_uid643_sincosTest_a <= STD_LOGIC_VECTOR("0" & ySumPreRnd_uid640_sincosTest_b);
    ySumPostRnd_uid643_sincosTest_b <= STD_LOGIC_VECTOR("00000000000000000000000000000000000" & VCC_q);
    ySumPostRnd_uid643_sincosTest_o <= STD_LOGIC_VECTOR(UNSIGNED(ySumPostRnd_uid643_sincosTest_a) + UNSIGNED(ySumPostRnd_uid643_sincosTest_b));
    ySumPostRnd_uid643_sincosTest_q <= ySumPostRnd_uid643_sincosTest_o(35 downto 0);

    -- yPostExc_uid645_sincosTest(BITSELECT,644)@9
    yPostExc_uid645_sincosTest_in <= STD_LOGIC_VECTOR(ySumPostRnd_uid643_sincosTest_q(34 downto 0));
    yPostExc_uid645_sincosTest_b <= STD_LOGIC_VECTOR(yPostExc_uid645_sincosTest_in(34 downto 1));

    -- cstZeroForAddSub_uid653_sincosTest(CONSTANT,652)
    cstZeroForAddSub_uid653_sincosTest_q <= "0000000000000000000000000000000000";

    -- sinPostNeg_uid655_sincosTest(ADDSUB,654)@9
    sinPostNeg_uid655_sincosTest_s <= invSinNegCond_uid654_sincosTest_q;
    sinPostNeg_uid655_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((35 downto 34 => cstZeroForAddSub_uid653_sincosTest_q(33)) & cstZeroForAddSub_uid653_sincosTest_q));
    sinPostNeg_uid655_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((35 downto 34 => yPostExc_uid645_sincosTest_b(33)) & yPostExc_uid645_sincosTest_b));
    sinPostNeg_uid655_sincosTest_combproc: PROCESS (sinPostNeg_uid655_sincosTest_a, sinPostNeg_uid655_sincosTest_b, sinPostNeg_uid655_sincosTest_s)
    BEGIN
        IF (sinPostNeg_uid655_sincosTest_s = "1") THEN
            sinPostNeg_uid655_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(sinPostNeg_uid655_sincosTest_a) + SIGNED(sinPostNeg_uid655_sincosTest_b));
        ELSE
            sinPostNeg_uid655_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(sinPostNeg_uid655_sincosTest_a) - SIGNED(sinPostNeg_uid655_sincosTest_b));
        END IF;
    END PROCESS;
    sinPostNeg_uid655_sincosTest_q <= sinPostNeg_uid655_sincosTest_o(34 downto 0);

    -- invCosNegCond_uid656_sincosTest(LOGICAL,655)@0 + 1
    invCosNegCond_uid656_sincosTest_qi <= not (sinNegCond2_uid647_sincosTest_q);
    invCosNegCond_uid656_sincosTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => invCosNegCond_uid656_sincosTest_qi, xout => invCosNegCond_uid656_sincosTest_q, clk => clk, aclr => areset );

    -- redist0_invCosNegCond_uid656_sincosTest_q_9(DELAY,661)
    redist0_invCosNegCond_uid656_sincosTest_q_9 : dspba_delay
    GENERIC MAP ( width => 1, depth => 8, reset_kind => "ASYNC" )
    PORT MAP ( xin => invCosNegCond_uid656_sincosTest_q, xout => redist0_invCosNegCond_uid656_sincosTest_q_9_q, clk => clk, aclr => areset );

    -- twoToMiSiYip_uid623_sincosTest(BITSELECT,622)@9
    twoToMiSiYip_uid623_sincosTest_b <= STD_LOGIC_VECTOR(yip1_33_uid615_sincosTest_b(70 downto 33));

    -- xip1E_34_uid626_sincosTest(ADDSUB,625)@9
    xip1E_34_uid626_sincosTest_s <= redist2_xMSB_uid617_sincosTest_b_3_q;
    xip1E_34_uid626_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((72 downto 71 => xip1_33_uid614_sincosTest_b(70)) & xip1_33_uid614_sincosTest_b));
    xip1E_34_uid626_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((72 downto 38 => twoToMiSiYip_uid623_sincosTest_b(37)) & twoToMiSiYip_uid623_sincosTest_b));
    xip1E_34_uid626_sincosTest_combproc: PROCESS (xip1E_34_uid626_sincosTest_a, xip1E_34_uid626_sincosTest_b, xip1E_34_uid626_sincosTest_s)
    BEGIN
        IF (xip1E_34_uid626_sincosTest_s = "1") THEN
            xip1E_34_uid626_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_34_uid626_sincosTest_a) + SIGNED(xip1E_34_uid626_sincosTest_b));
        ELSE
            xip1E_34_uid626_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_34_uid626_sincosTest_a) - SIGNED(xip1E_34_uid626_sincosTest_b));
        END IF;
    END PROCESS;
    xip1E_34_uid626_sincosTest_q <= xip1E_34_uid626_sincosTest_o(71 downto 0);

    -- xip1_34_uid633_sincosTest(BITSELECT,632)@9
    xip1_34_uid633_sincosTest_in <= STD_LOGIC_VECTOR(xip1E_34_uid626_sincosTest_q(70 downto 0));
    xip1_34_uid633_sincosTest_b <= STD_LOGIC_VECTOR(xip1_34_uid633_sincosTest_in(70 downto 0));

    -- xSumPreRnd_uid636_sincosTest(BITSELECT,635)@9
    xSumPreRnd_uid636_sincosTest_in <= xip1_34_uid633_sincosTest_b(69 downto 0);
    xSumPreRnd_uid636_sincosTest_b <= xSumPreRnd_uid636_sincosTest_in(69 downto 35);

    -- xSumPostRnd_uid639_sincosTest(ADD,638)@9
    xSumPostRnd_uid639_sincosTest_a <= STD_LOGIC_VECTOR("0" & xSumPreRnd_uid636_sincosTest_b);
    xSumPostRnd_uid639_sincosTest_b <= STD_LOGIC_VECTOR("00000000000000000000000000000000000" & VCC_q);
    xSumPostRnd_uid639_sincosTest_o <= STD_LOGIC_VECTOR(UNSIGNED(xSumPostRnd_uid639_sincosTest_a) + UNSIGNED(xSumPostRnd_uid639_sincosTest_b));
    xSumPostRnd_uid639_sincosTest_q <= xSumPostRnd_uid639_sincosTest_o(35 downto 0);

    -- xPostExc_uid644_sincosTest(BITSELECT,643)@9
    xPostExc_uid644_sincosTest_in <= STD_LOGIC_VECTOR(xSumPostRnd_uid639_sincosTest_q(34 downto 0));
    xPostExc_uid644_sincosTest_b <= STD_LOGIC_VECTOR(xPostExc_uid644_sincosTest_in(34 downto 1));

    -- cosPostNeg_uid657_sincosTest(ADDSUB,656)@9
    cosPostNeg_uid657_sincosTest_s <= redist0_invCosNegCond_uid656_sincosTest_q_9_q;
    cosPostNeg_uid657_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((35 downto 34 => cstZeroForAddSub_uid653_sincosTest_q(33)) & cstZeroForAddSub_uid653_sincosTest_q));
    cosPostNeg_uid657_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((35 downto 34 => xPostExc_uid644_sincosTest_b(33)) & xPostExc_uid644_sincosTest_b));
    cosPostNeg_uid657_sincosTest_combproc: PROCESS (cosPostNeg_uid657_sincosTest_a, cosPostNeg_uid657_sincosTest_b, cosPostNeg_uid657_sincosTest_s)
    BEGIN
        IF (cosPostNeg_uid657_sincosTest_s = "1") THEN
            cosPostNeg_uid657_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(cosPostNeg_uid657_sincosTest_a) + SIGNED(cosPostNeg_uid657_sincosTest_b));
        ELSE
            cosPostNeg_uid657_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(cosPostNeg_uid657_sincosTest_a) - SIGNED(cosPostNeg_uid657_sincosTest_b));
        END IF;
    END PROCESS;
    cosPostNeg_uid657_sincosTest_q <= cosPostNeg_uid657_sincosTest_o(34 downto 0);

    -- redist54_firstQuadrant_uid15_sincosTest_b_9(DELAY,715)
    redist54_firstQuadrant_uid15_sincosTest_b_9 : dspba_delay
    GENERIC MAP ( width => 1, depth => 9, reset_kind => "ASYNC" )
    PORT MAP ( xin => firstQuadrant_uid15_sincosTest_b, xout => redist54_firstQuadrant_uid15_sincosTest_b_9_q, clk => clk, aclr => areset );

    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- xPostRR_uid659_sincosTest(MUX,658)@9
    xPostRR_uid659_sincosTest_s <= redist54_firstQuadrant_uid15_sincosTest_b_9_q;
    xPostRR_uid659_sincosTest_combproc: PROCESS (xPostRR_uid659_sincosTest_s, cosPostNeg_uid657_sincosTest_q, sinPostNeg_uid655_sincosTest_q)
    BEGIN
        CASE (xPostRR_uid659_sincosTest_s) IS
            WHEN "0" => xPostRR_uid659_sincosTest_q <= cosPostNeg_uid657_sincosTest_q;
            WHEN "1" => xPostRR_uid659_sincosTest_q <= sinPostNeg_uid655_sincosTest_q;
            WHEN OTHERS => xPostRR_uid659_sincosTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- sin_uid661_sincosTest(BITSELECT,660)@9
    sin_uid661_sincosTest_in <= STD_LOGIC_VECTOR(xPostRR_uid659_sincosTest_q(33 downto 0));
    sin_uid661_sincosTest_b <= STD_LOGIC_VECTOR(sin_uid661_sincosTest_in(33 downto 0));

    -- xPostRR_uid658_sincosTest(MUX,657)@9
    xPostRR_uid658_sincosTest_s <= redist54_firstQuadrant_uid15_sincosTest_b_9_q;
    xPostRR_uid658_sincosTest_combproc: PROCESS (xPostRR_uid658_sincosTest_s, sinPostNeg_uid655_sincosTest_q, cosPostNeg_uid657_sincosTest_q)
    BEGIN
        CASE (xPostRR_uid658_sincosTest_s) IS
            WHEN "0" => xPostRR_uid658_sincosTest_q <= sinPostNeg_uid655_sincosTest_q;
            WHEN "1" => xPostRR_uid658_sincosTest_q <= cosPostNeg_uid657_sincosTest_q;
            WHEN OTHERS => xPostRR_uid658_sincosTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- cos_uid660_sincosTest(BITSELECT,659)@9
    cos_uid660_sincosTest_in <= STD_LOGIC_VECTOR(xPostRR_uid658_sincosTest_q(33 downto 0));
    cos_uid660_sincosTest_b <= STD_LOGIC_VECTOR(cos_uid660_sincosTest_in(33 downto 0));

    -- xOut(GPOUT,4)@9
    c <= cos_uid660_sincosTest_b;
    s <= sin_uid661_sincosTest_b;

END normal;
