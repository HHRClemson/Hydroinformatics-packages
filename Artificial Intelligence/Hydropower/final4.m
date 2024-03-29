clc
clear
close all


Delta=10;
Smin=957.41;
Smax=1608.5;
htail=722;
hloss=2;
Hmax=850;
Hmin=830;


s=0;
for Reliability=0.95:-0.05:0.75;
    l=2;
    Pmax(1)=50;
    Pmax(2)=100;
while abs(Pmax(l)-Pmax(l-1))>20
    
    Pmax(l)=Pmax(l-1)+10;
    Emax=Pmax(l)*24*30;
eff=0.8;
load IData.mat
St(1)=Smax;

It=IData;              % Inflow (MCM)
FE(1)=2.72*eff*min(min(It))*(Hmax-Hmin)/2;
j=1;
Rel(1)=0;
while (abs(Rel(j)-Reliability)>0.01)
    
    
    for y=1:45
        
        for m=1:12
            
            
            k=2;
            S(k-1)=St((y-1)*12+m);
            S(k)=S(k-1)+0.02;
            while abs(S(k)-S(k-1))>0.01
                
                S(k+1)=(S(k-1)+S(k))/2;
                h(k) = 9E-08*S(k+1)^3 - 0.0003*S(k+1)^2 + 0.2746*S(k+1) + 732.82;
                h(k)=h(k)-htail-hloss;
                R(k)=FE(j)/(2.725*h(k)*eff);
                
                
                S(k+1)=St((y-1)*12+m)+It(y,m)-R(k);
                
                if S(k+1)>Smax
                    S(k+1)=Smax;
                    R(k)=R(k)+(S(k+1)-Smax);
                    h(k)=Hmax;
                elseif S(k+1)<Smin
                    S(k+1)=Smin;
                    R(k)=R(k)-(Smin-S(k+1));
                    h(k)=Hmin;
                end
                
                k=k+1;
            end
            St((y-1)*12+m+1)=S(k);
            Rstr(y,m)=Emax/(2.725*h(k-1)*eff);
            
            Rt(y,m)=St((y-1)*12+m)+It(y,m)-St((y-1)*12+m+1);
            E(y,m)=2.725*Rt(y,m)*h(k-1)*eff;
            if E(y,m)>Emax
                E(y,m)=Emax;
                Spill(y,m)= Rt(y,m)-Rstr(y,m);
            else
                Spill(y,m)=0;
            end
            
            if E(y,m)>=FE(j)
                Z(y,m)=1;
            else
                Z(y,m)=0;
            end
            
        end
    end
    
    Rel(j+1)= sum(sum(Z,1))/(45*12);
    
    if (Rel(j+1)-Reliability)>0.01
        FE(j+1)=FE(j)+Delta;
    elseif (Rel(j+1)-Reliability)<-0.01
        FE(j+1)=FE(j)-Delta;
    end
    
    j=j+1;
end
Pmax(l+1)=FE(j-1)/(0.35*24);
l=l+1;
end

s=s+1;
Pm(s)=Pmax(end);
Pmax(1,:)=0;
Rely(s)=Reliability
end
figure(1)
plot(Rely,Pm)
title('Sensetivity Analysis')
xlabel('Reliability')
ylabel('Pmax')