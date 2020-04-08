
tic
clear all
clc
format long
Visual=2.5;
Step=0.3;
N=100; %50
Try_number=100;
d=[];
h=1e-1;    
Friend_number=50;
a=[977,977,977,977,977,977,977,957,977,970,977,977];         %%[898,898,898,898,898,898,893,892,892,898,898,898];
b=[970,970,970,970,952,952,952,952,952,952,970,970];         %%[888,888,888,888,888,893,888,888,888,888,888,888];
k=0; ，m
m=50;
X1=rand(N,1)*(a(1)-b(1))+b(1);    
X2=rand(N,1)*(a(2)-b(2))+b(2);    
X3=rand(N,1)*(a(3)-b(3))+b(3);   
X4=rand(N,1)*(a(4)-b(4))+b(4);   
X5=rand(N,1)*(a(5)-b(5))+b(5);   
X6=rand(N,1)*(a(6)-b(6))+b(6);   
X7=rand(N,1)*(a(7)-b(7))+b(7);   
X8=rand(N,1)*(a(8)-b(8))+b(8);    
X9=rand(N,1)*(a(9)-b(9))+b(9);    
X10=rand(N,1)*(a(10)-b(10))+b(10);
X11=rand(N,1)*(a(11)-b(11))+b(11);
X12=rand(N,1)*(a(12)-b(12))+b(12);
X=[X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12];50，
for i=1:N
wwww=[X(i,1),X(i,2),X(i,3),X(i,4),X(i,5),X(i,6),X(i,7),X(i,8),X(i,9),X(i,10),X(i,11),X(i,12)];  
d(i)=maxf(wwww);   
end
[w,i]=max(d);  
maxX=[X(i,1),X(i,2),X(i,3),X(i,4),X(i,5),X(i,6),X(i,7),X(i,8),X(i,9),X(i,10),X(i,11),X(i,12)]; 
       
maxY=w;  
figurex1=[];figurex2=[];figurex3=[];figurex4=[];figurex5=[];figurex6=[];figurex7=[];figurex8=[];figurex9=[];figurex10=[];figurex11=[];figurex12=[]; 
figurez=[];            
figurex1(numel(figurex1)+1)=maxX(1);  %figurex1(numel(figurex1)+1) figurex1(1)，X(i,1)，4
figurex2(numel(figurex2)+1)=maxX(2);   
figurex3(numel(figurex3)+1)=maxX(3);figurex4(numel(figurex4)+1)=maxX(4);figurex5(numel(figurex5)+1)=maxX(5);figurex6(numel(figurex6)+1)=maxX(6);
figurex7(numel(figurex7)+1)=maxX(7);figurex8(numel(figurex8)+1)=maxX(8);figurex9(numel(figurex9)+1)=maxX(9);figurex10(numel(figurex10)+1)=maxX(10);
figurex11(numel(figurex11)+1)=maxX(11);figurex12(numel(figurex12)+1)=maxX(12);
figurez(numel(figurez)+1)=maxY;    
kkk=0;
for p=1:3
while(k<m)
    for i=1:N  %
    XX=[X(i,1),X(i,2),X(i,3),X(i,4),X(i,5),X(i,6),X(i,7),X(i,8),X(i,9),X(i,10),X(i,11),X(i,12)];
        
    nf=0;
    Xc=0;
    for j=1:N  %
       XXX=[X(j,1),X(j,2),X(j,3),X(j,4),X(j,5),X(j,6),X(j,7),X(j,8),X(j,9),X(j,10),X(j,11),X(j,12)];
       if(norm(XXX-XX)<Visual)   
       nf=nf+1;
       Xc=Xc+XXX;
       end
    end
    Xc=Xc/nf;  
   if((maxf(Xc))>maxf(XX))
        XXnext1=XX+rand*Step*(Xc-XX)/norm(Xc-XX);
        XXnext1=xianzhi(XXnext1);
   else
       XXnext1=gmjprey(XX,Try_number,Visual,Step); 
       XXnext1=xianzhi(XXnext1);
   end
   %maxX=XX;%
   %maxY=maxf(XX);
   for j=1:Friend_number
     XXX=[X(j,1),X(j,2),X(j,3),X(j,4),X(j,5),X(j,6),X(j,7),X(j,8),X(j,9),X(j,10),X(j,11),X(j,12)];
     if(norm(XXX-XX)<Visual & maxf(XXX)>maxY)
         maxX=XXX;
         maxY=maxf(XXX); 
     end
   end
   if((maxY)>maxf(XX))
       XXnext2=XX+rand*Step*(maxX-XX)/norm(maxX-XX); 
       XXnext2=xianzhi(XXnext2);
   else
      XXnext2 =gmjprey(XX,Try_number,Visual,Step);
      XXnext2=xianzhi(XXnext2);
   end
   if(maxf(XXnext1)>maxf(XXnext2)) 
     for j=1:12
     X(i,j)=XXnext1(j);
     end
   else
     for j=1:12
     X(i,j)=XXnext2(j);
     end
   end
end 

for i=1:N
    XXXX=[X(i,1),X(i,2),X(i,3),X(i,4),X(i,5),X(i,6),X(i,7),X(i,8),X(i,9),X(i,10),X(i,11),X(i,12)];
       if maxf(XXXX)>maxY  
            maxY=maxf(XXXX);
            maxX=XXXX;
            figurex1(numel(figurex1)+1)=maxX(1);figurex2(numel(figurex2)+1)=maxX(2);  
            figurex3(numel(figurex3)+1)=maxX(3);figurex4(numel(figurex4)+1)=maxX(4);figurex5(numel(figurex5)+1)=maxX(5);figurex6(numel(figurex6)+1)=maxX(6);
            figurex7(numel(figurex7)+1)=maxX(7);figurex8(numel(figurex8)+1)=maxX(8);figurex9(numel(figurex9)+1)=maxX(9);figurex10(numel(figurex10)+1)=maxX(10);
            figurex11(numel(figurex11)+1)=maxX(11);figurex12(numel(figurex12)+1)=maxX(12);
            figurez(numel(figurez)+1)=maxY;
       end
end
    k=k+1; 
    
end 
a1(p)=maxY;
end

u=length(a1);
          for i=1:u-1    
                for j=i+1:u         
                   if a1(i)>a1(j)
                        b1=a1(i);
                        a1(i)=a1(j);
                        a1(j)=b1; 
                   end
                end
          end    
c1=[1:1:u];
%plot(c1,a1);
b=length(a1);
disp('：')
maxX   
disp('：')
maxY   
toc


        

    
    
    
