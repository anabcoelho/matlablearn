function EDR = find_EDR(QRS_array_i, signal,PQoff, jOff)

w=round(2*(PQoff+jOff));
windows=[];
hight=[];
area=[];
for j=1:length(QRS_array_i)   
    area=[area sum(signal((QRS_array_i(j)-round(w/2):QRS_array_i(j)+round(w/2))))];
end
EDR=area;

% figure
% plot(signal)
% hold on
% plot((1:length(signal)),EDR)
% hold on
% plot(QRS_array_i,area,'*')

