clc;
clear all;

rec = [1:1:29];
rssi = [-94:1:-76];
tpkts = 1500;
sample = 29;
data = xlsread('SKY_REC_MOD.xlsx');

data = data(2:end,:);

per = data./tpkts;

meandata = mean(per);
stdev = std(per);

se = stdev./sqrt(sample);

tscr = tinv([0.025 0.975],(sample-1));

%CI1 = meandata + tscr(1).*se;
%CI2 = meandata + tscr(2).*se;

yCI = bsxfun(@times, se, tscr(:));

h = errorbar(rssi,meandata,yCI(1,:),yCI(2,:),'*');

set(gca,'yscale','log');
grid on
axis([-94 -78 10^-3 10^0])