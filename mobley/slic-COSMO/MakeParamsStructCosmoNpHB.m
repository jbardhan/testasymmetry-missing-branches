function Params = MakeParamsStructCosmoNpHB(x)
Params = struct('dispCoeffs',x(1:17),'q_s',x(18),...
        'hbondCoeffs',x(19:30),...
        'zComb',x(31),'cavity_coeff',x(32));
        
fprintf('Params: c-sp_coeff = %f\tc-sp2_coeff = %f\tc-sp3_coeff = %f\tcl_coeff = %f\n',x(1),x(2), ...
	x(3),x(4));




%'br_coeff', x(6), 'c-sp_coeff', x(7), 'c-sp2_coeff', x(8),...
%        'c-sp3_coeff', x(9), 'cl_coeff', x(10), 'f_coeff', x(11),...
%        'h_coeff', x(12), 'i_coeff', x(13), 'n-sp_coeff', x(14),...
%        'n-sp2_coeff', x(15), 'n-sp3_coeff', x(16), 'o-sp2_coeff', x(17),...
%        'o-sp2-n_coeff', x(18), 'o-sp3_coeff', x(19),'o-sp3-h_coeff', x(20),...
%        'p_coeff', x(21), 's_coeff', x(22),'q_s_coeff', x(23),...
%        'z_comb_coeff', x(24));