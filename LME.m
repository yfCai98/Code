%% LME
load('LME_demo.mat');
[Tsave,Psave,lmeModel_now] = LMEquick(data1,data2,cond1,cond2,sub1,sub2,contact1,contact2);
lmeModel_now = lmeModel_now{1};