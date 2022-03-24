function [Tc]=cylsolve(t,Ti,Tinf,h,rho,cp,k,D)
rho = 8960;
k = 398;
cp = 389;
D = 0.01242;
h = 70.94;
Tinf = 21.5; % in [C]
Ti = 83.7; % in [C]
t = 0:160;
% Determine temperature at r=0 for time span vector
% t for a cylinder in cross flow.
% Inputs:
% Ti = Initial cylinder uniform temperature [K]
% or [C]
% Tinf = Fluid temperature [K] or [C]
% h = Convection cooling coefficient [W/m/K]
% rho = Density of cylinder [kg/m^3]
% cp = Specific heat of cylinder [J/kg/K]
% k = Thermal conductivity of cylinder [W/m/K]
% D = Diameter of cylinder [m]
% Returns:
% T = Temperature at core T(t) [K]

% Generate a linear distribution of 100 points from
% r=0 to r=r_o
r=linspace(0,D/2,100);
disp(r);
% Call pdepe to solve the PDE problem described by
% the cylPDE, cylIC, cylBC functions. The solution
% will be described by a matrix ’sol’ where the
% solution at location r_j and time t_n can be found
% at the entry sol(n,j).
% For more information, type ’help pdepe’ or
% ’doc pdepe’.
sol=pdepe(1,@cylPDE,@cylIC,@cylBC,r,t);

% Return the centerline temperature as a function of
% time span t (i.e. the first column of ’sol’)
Tc=sol(:,1);
% Define the PDE sub-function ’cylPDE’.
% Note that all the above variables
% (eg. Ti,Tinf,h,rho,cp,k, and D)
% are defined for this function.
% -------------------------------------------------


function [c,f,s] = cylPDE(r,t,T,dTdr)
% return c,f,s according to Eq. 6.4-6.8 as a
% function of the given r,t,T,dTdr
c = rho*cp;
f = k*dTdr;
s = 0;
% End of cylPDE
end
% Define the initial conditions sub function
% ’cylIC’.
% Note that all the above variables
% (eg. Ti,Tinf,h,rho,cp,k, and D)
% are defined for this function.
% -------------------------------------------------
function T0 = cylIC(r)
[n,m]=size(r);
T0=ones(n,m)*Ti;
% End of cylIC
end


% Define the boundary conditions sub function
% ’cylBC’.
% Note that all the above variables
% (eg. Ti,Tinf,h,rho,cp,k, and D)
% are defined for this function.
% -------------------------------------------------
function [pl,ql,pr,qr] = cylBC(rl,Tl,rr,Tr,t)
% Define the left boundary conditions at r=0,
% according to Eq. 6.9, as a function of the given
% left boundary values rl and Tl.
pl = 0;
ql = 1;
% Define the right boundary conditions at r=r_o,
% according to Eq. 6.9-6.11, as a function of the
% given right boundary values rr and Tr.
pr = h*(Tr-Tinf);
qr = 1;
% End of cylBC
end

% End of cylsolve
end