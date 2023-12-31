function Eps_t = epsilon_t(t)
%Eps_t           Returns the value of the dielectric constant for water at
%a given temperature t in Kelvin.  This formula comes from
%Malmberg56.

Eps_t = 87.740 - 0.4008.*(t-273.15) + 9.398e-4.*((t-273.15).^2) ...
    - 1.410e-6.*((t-273.15).^3);

end