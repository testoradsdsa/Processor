library	ieee;
use	ieee.std_logic_1164.all;	
use	ieee.numeric_std.all;
use	work.mips_pkg.all;

entity	c_ula	is
port	(
func	 	:	in	std_logic_vector(5	downto	0);
opUla 	:	in	std_logic_vector(1	downto	0);
ctrula	:	out	std_logic_vector(3	downto	0)
);
end	c_ula;

architecture behavioral of	c_ula is
	signal	tmp	:	std_logic_vector(5	downto	0);
	
	begin
	tmp	<=	std_logic_vector(func and "001111");
	
	proc_c_ula:	process(func, opUla)
	begin 
	
	if opUla = "10" then
		case tmp is
			when "000000" => ctrula <= ULA_ADD;
			when "000010" => ctrula <= ULA_SUB;
			when "000100" => ctrula <= ULA_AND;
			when "000101" => ctrula <= ULA_OR;
			when "001010" => ctrula <= ULA_SLT;
			when "001100" => ctrula <= ULA_NOR;
			when others => ctrula <= ULA_UKW;
		end case;
	else
		case opUla is
			when "00" => ctrula <= ULA_ADD;
			when "01" => ctrula <= ULA_SUB;
			when	others	=>	ctrula <= ULA_AND;
		end	case;
	end if;
		
	end	process;

end	architecture	behavioral;