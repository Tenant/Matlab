% Dynamic Memory Management
% 动态内存管理

neg_free = 10000; %动态分配内存的时候每次申请的连续空间大小  
neg_list = zeros(neg_free,3); 
neg_pos = 0; %用于记录neg_list中的元素的个数
% your code
 if (neg_pos+10>neg_free)  
        neg_free = neg_free + 100000;  
        neg_list((neg_pos +1):neg_free,:) = 0;  
 end  