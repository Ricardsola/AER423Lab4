close;
clf;

X=dlmread('AER423Lab2Dataxlsx.csv',',');
rho = 8960;
k = 398;
cp = 389;
D = 0.01242;
h1 = 70.9;
h2 = 65.8;
h3 = 64.43;
h4 = 54.49;
h5 = 36.33;
h6=  74.71;
h = [70.94 65.8 64.43 54.49 36.33 74.71];
Tinf = 21.5; % in [C]
t = 0:10:160;
Tnum=zeros(6,17);
for i=1:6
    T = X(:,2*i);
    sol = cylsolve(t, T(1),Tinf,h(i),rho,cp,k,D);
    for j=1:17
        Tnum(i,j)=sol(j);
    end
end
T = [X(:,2) X(:,4) X(:,6) X(:,8) X(:,10) X(:,12)];
plot(t,T,'*',t,Tnum,'-'); % Plot both data sets
xlabel('t [s]'); % Label for x-axis
ylabel('T [C]'); % Label for y-axis
legend('Trial 1','Trial 2','Trial 3','Trial 4','Trial 5','Trial 6'); % Add a legend
title('h=70.94 [W/m/K]'); % Add a title