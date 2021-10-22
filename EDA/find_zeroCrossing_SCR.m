function [Begin,End]=find_zeroCrossing_SCR(signal)
begin_end=zeros(length(signal)-1,2);
Begin=[];
End=[];
i=1;
while(i<length(signal))
    
 if  (signal(i)<=0 && signal(i+1)>0)
     Begin=[Begin i];
   while(i<length(signal)-1)
       i=i+1;
      if  (signal(i)<=0 && signal(i+1)>0)
      Begin(end)=i;
      elseif (signal(i)>=0 && signal(i+1)<0) 
      End=[End i];
      break;    
      end
   end
 end
 i=i+1;
end
u=0;