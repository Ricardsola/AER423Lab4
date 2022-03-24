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
        Tnum(j,i)=sol(j);
    end
end
T = [X(:,2) X(:,4) X(:,6) X(:,8) X(:,10) X(:,12)];

tiledlayout(2,3)

nexttile;
plot(t,T(:,1),'*',t,Tnum(:,1),'-'); % Plot both data sets
xlabel('t [s]'); % Label for x-axis
ylabel('T [C]'); % Label for y-axis
legend('Experimental','Numerical'); % Add a legend
title('h=70.94 [W/m/K]'); % Add a title

nexttile;
plot(t,T(:,2),'*',t,Tnum(:,2),'-'); % Plot both data sets
xlabel('t [s]'); % Label for x-axis
ylabel('T [C]'); % Label for y-axis
legend('Experimental','Numerical'); % Add a legend
title('h=65.8 [W/m/K]'); % Add a title

nexttile;
plot(t,T(:,3),'*',t,Tnum(:,3),'-'); % Plot both data sets
xlabel('t [s]'); % Label for x-axis
ylabel('T [C]'); % Label for y-axis
legend('Experimental','Numerical'); % Add a legend
title('h=64.43 [W/m/K]'); % Add a title
nexttile;
plot(t,T(:,4),'*',t,Tnum(:,4),'-'); % Plot both data sets
xlabel('t [s]'); % Label for x-axis
ylabel('T [C]'); % Label for y-axis
legend('Experimental','Numerical'); % Add a legend
title('h=54.49 [W/m/K]'); % Add a title
nexttile;
plot(t,T(:,5),'*',t,Tnum(:,5),'-'); % Plot both data sets
xlabel('t [s]'); % Label for x-axis
ylabel('T [C]'); % Label for y-axis
legend('Experimental','Numerical'); % Add a legend
title('h=36.33 [W/m/K]'); % Add a title
nexttile;
plot(t,T(:,6),'*',t,Tnum(:,6),'-'); % Plot both data sets
xlabel('t [s]'); % Label for x-axis
ylabel('T [C]'); % Label for y-axis
legend('Experimental','Numerical'); % Add a legend
title('h=74.71 [W/m/K]'); % Add a title