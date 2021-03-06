-- VHDL Entity r65c02_tc.regbank_axy.symbol
--
-- Created:
--          by - jens
--          at - 15:17:32 07/21/13
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2012.2a (Build 3)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY regbank_axy IS
   PORT( 
      clk_clk_i    : IN     std_logic;
      d_regs_in_i  : IN     std_logic_vector (7 DOWNTO 0);
      load_regs_i  : IN     std_logic;
      rst_rst_n_i  : IN     std_logic;
      sel_rb_in_i  : IN     std_logic_vector (1 DOWNTO 0);
      sel_rb_out_i : IN     std_logic_vector (1 DOWNTO 0);
      sel_reg_i    : IN     std_logic_vector (1 DOWNTO 0);
      d_regs_out_o : OUT    std_logic_vector (7 DOWNTO 0);
      q_a_o        : OUT    std_logic_vector (7 DOWNTO 0);
      q_x_o        : OUT    std_logic_vector (7 DOWNTO 0);
      q_y_o        : OUT    std_logic_vector (7 DOWNTO 0)
   );

-- Declarations

END regbank_axy ;

-- (C) 2008 - 2013 Jens Gutschmidt
-- (email: scantara2003@yahoo.de)
-- 
-- Versions:
-- Revision 1.7  2013/07/21 11:11:00  jens
-- - Changing the title block and internal revision history
-- 
-- Revision 1.6  2009/01/04 10:20:47  eda
-- Changes for cosmetic issues only
-- 
-- Revision 1.5  2009/01/04 09:23:10  eda
-- - Delete unused nets and blocks (same as R6502_TC)
-- - Rename blocks
-- 
-- Revision 1.4  2009/01/03 16:53:02  eda
-- - Unused nets and blocks deleted
-- - Renamed blocks
-- 
-- Revision 1.3  2009/01/03 16:42:02  eda
-- - Unused nets and blocks deleted
-- - Renamed blocks
-- 
-- Revision 1.2  2008/12/31 19:31:24  eda
-- Production Release
--  
-- 
--
-- VHDL Architecture r65c02_tc.regbank_axy.struct
--
-- Created:
--          by - jens
--          at - 15:17:34 07/21/13
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2012.2a (Build 3)
--
-- COPYRIGHT (C) 2008 - 2013 by Jens Gutschmidt and OPENCORES.ORG
-- 
-- This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or any later version.
-- 
-- This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.
-- 
-- You should have received a copy of the GNU General Public License along with this program.  If not, see <http://www.gnu.org/licenses/>.
-- 
-- 
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;


ARCHITECTURE struct OF regbank_axy IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL ld        : std_logic_vector(2 DOWNTO 0);
   SIGNAL load1_o_i : std_logic;
   SIGNAL load2_o_i : std_logic;
   SIGNAL load_o_i  : std_logic;
   SIGNAL q_mux_o_i : std_logic_vector(7 DOWNTO 0);
   SIGNAL val_zero  : std_logic_vector(7 DOWNTO 0);

   -- Implicit buffer signal declarations
   SIGNAL q_a_o_internal : std_logic_vector (7 DOWNTO 0);
   SIGNAL q_x_o_internal : std_logic_vector (7 DOWNTO 0);
   SIGNAL q_y_o_internal : std_logic_vector (7 DOWNTO 0);


   -- ModuleWare signal declarations(v1.12) for instance 'U_0' of 'adff'
   SIGNAL mw_U_0reg_cval : std_logic_vector(7 DOWNTO 0);

   -- ModuleWare signal declarations(v1.12) for instance 'U_4' of 'adff'
   SIGNAL mw_U_4reg_cval : std_logic_vector(7 DOWNTO 0);

   -- ModuleWare signal declarations(v1.12) for instance 'U_5' of 'adff'
   SIGNAL mw_U_5reg_cval : std_logic_vector(7 DOWNTO 0);


BEGIN

   -- ModuleWare code(v1.12) for instance 'U_0' of 'adff'
   q_a_o_internal <= mw_U_0reg_cval;
   u_0seq_proc: PROCESS (clk_clk_i, rst_rst_n_i)
   BEGIN
      IF (rst_rst_n_i = '0') THEN
         mw_U_0reg_cval <= "00000000";
      ELSIF (clk_clk_i'EVENT AND clk_clk_i='1') THEN
         IF (load_o_i = '1') THEN
            mw_U_0reg_cval <= q_mux_o_i;
         END IF;
      END IF;
   END PROCESS u_0seq_proc;

   -- ModuleWare code(v1.12) for instance 'U_4' of 'adff'
   q_x_o_internal <= mw_U_4reg_cval;
   u_4seq_proc: PROCESS (clk_clk_i, rst_rst_n_i)
   BEGIN
      IF (rst_rst_n_i = '0') THEN
         mw_U_4reg_cval <= "00000000";
      ELSIF (clk_clk_i'EVENT AND clk_clk_i='1') THEN
         IF (load1_o_i = '1') THEN
            mw_U_4reg_cval <= q_mux_o_i;
         END IF;
      END IF;
   END PROCESS u_4seq_proc;

   -- ModuleWare code(v1.12) for instance 'U_5' of 'adff'
   q_y_o_internal <= mw_U_5reg_cval;
   u_5seq_proc: PROCESS (clk_clk_i, rst_rst_n_i)
   BEGIN
      IF (rst_rst_n_i = '0') THEN
         mw_U_5reg_cval <= "00000000";
      ELSIF (clk_clk_i'EVENT AND clk_clk_i='1') THEN
         IF (load2_o_i = '1') THEN
            mw_U_5reg_cval <= q_mux_o_i;
         END IF;
      END IF;
   END PROCESS u_5seq_proc;

   -- ModuleWare code(v1.12) for instance 'U_6' of 'and'
   load_o_i <= load_regs_i AND ld(0);

   -- ModuleWare code(v1.12) for instance 'U_7' of 'and'
   load1_o_i <= load_regs_i AND ld(1);

   -- ModuleWare code(v1.12) for instance 'U_8' of 'and'
   load2_o_i <= load_regs_i AND ld(2);

   -- ModuleWare code(v1.12) for instance 'U_11' of 'constval'
   val_zero <= "00000000";

   -- ModuleWare code(v1.12) for instance 'U_1' of 'decoder1'
   u_1combo_proc: PROCESS (sel_reg_i)
   BEGIN
      ld <= (OTHERS => '0');
      CASE sel_reg_i IS
         WHEN "00" => ld(0) <= '1';
         WHEN "01" => ld(1) <= '1';
         WHEN "10" => ld(2) <= '1';
         WHEN OTHERS => ld <= (OTHERS => '0');
      END CASE;
   END PROCESS u_1combo_proc;

   -- ModuleWare code(v1.12) for instance 'U_2' of 'mux'
   u_2combo_proc: PROCESS(q_a_o_internal, q_x_o_internal, q_y_o_internal, 
                          val_zero, sel_rb_out_i)
   BEGIN
      CASE sel_rb_out_i IS
      WHEN "00" => d_regs_out_o <= q_a_o_internal;
      WHEN "01" => d_regs_out_o <= q_x_o_internal;
      WHEN "10" => d_regs_out_o <= q_y_o_internal;
      WHEN "11" => d_regs_out_o <= val_zero;
      WHEN OTHERS => d_regs_out_o <= (OTHERS => 'X');
      END CASE;
   END PROCESS u_2combo_proc;

   -- ModuleWare code(v1.12) for instance 'U_3' of 'mux'
   u_3combo_proc: PROCESS(q_a_o_internal, q_y_o_internal, q_x_o_internal, 
                          d_regs_in_i, sel_rb_in_i)
   BEGIN
      CASE sel_rb_in_i IS
      WHEN "00" => q_mux_o_i <= q_a_o_internal;
      WHEN "01" => q_mux_o_i <= q_y_o_internal;
      WHEN "10" => q_mux_o_i <= q_x_o_internal;
      WHEN "11" => q_mux_o_i <= d_regs_in_i;
      WHEN OTHERS => q_mux_o_i <= (OTHERS => 'X');
      END CASE;
   END PROCESS u_3combo_proc;

   -- Instance port mappings.

   -- Implicit buffered output assignments
   q_a_o <= q_a_o_internal;
   q_x_o <= q_x_o_internal;
   q_y_o <= q_y_o_internal;

END struct;
