function [XXnext] = gmjprey(XX,Try_number,Visual,Step)  %��ʳ��Ϊ 
pp=0;
for j=1:Try_number
    XXj=XX+rand*Step*Visual;
    if(maxf(XX)<maxf(XXj))
        XXnext=XX+rand*Step*(XXj-XX)/norm(XXj-XX);  %������
        pp=1;
        break
    end
end
if(~pp)  %��Ϊpp������0��ʱ��
   XXnext=XX+rand*Step;
end