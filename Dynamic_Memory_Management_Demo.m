% Dynamic Memory Management
% ��̬�ڴ����

neg_free = 10000; %��̬�����ڴ��ʱ��ÿ������������ռ��С  
neg_list = zeros(neg_free,3); 
neg_pos = 0; %���ڼ�¼neg_list�е�Ԫ�صĸ���
% your code
 if (neg_pos+10>neg_free)  
        neg_free = neg_free + 100000;  
        neg_list((neg_pos +1):neg_free,:) = 0;  
 end  