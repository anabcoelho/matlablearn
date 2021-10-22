function count=find_zerocerossing(signal,epsilon)
sum=0;
%figure
%plot(signal)

for i=1:length(signal)-1
    if (abs(signal(i)-signal(i+1))>epsilon) && ((signal(i)*signal(i+1))<0)
%sum=sum+sign(-signal(i)*signal(i+1));
%hold on
%plot(i,0,'*')
       sum=sum+1;
    end
end
count=sum;
