function DD = affchange(DD,i,j,z,cund22)
       %��һ�ֱ仯���൱��ԭͼ��û�б�
        DD(i,j,z,1,1:64)=reshape(cund22,[1,64]);%��cund2�����������г�һ��
        %�ڶ��ֱ任���൱�ھ������ҷ�ת
        cund4=fliplr(cund22);%��cund2�������ҷ�ת���൱�ھ���ˮƽ���߷��䣬fliplr(A)��flip(A,2)
        DD(i,j,z,2,1:64)=reshape(cund4,[1,64]);
        %�����ֱ任��cund2�������·�ת
        cund4=flipud(cund22);%��cund2�������·�ת���൱�ھ���ֱ���߷��䣬flipud(A)��flip(A,1)
        DD(i,j,z,3,1:64)=reshape(cund4,[1,64]);
        %���ı任������ǰ��ת��
        cund4=flip(cund22,3);
        DD(i,j,z,4,1:64)=reshape(cund4,[1,64]);
        %�����ֱ任��ת90��
        cund4=rot90_3D(cund22,3,1);%xyƽ����ת90�� 
        DD(i,j,z,5,1:64)=reshape(cund4,[1,64]);
        
        cund4=rot90_3D(cund22,2,1);%xzƽ����ת90�� 
        DD(i,j,z,6,1:64)=reshape(cund4,[1,64]);
        
        cund4=rot90_3D(cund22,1,3);%yzƽ����ת90�� 
        DD(i,j,z,7,1:64)=reshape(cund4,[1,64]);
        %��6�ֱ任��ת180��
        cund4=rot90_3D(cund22,3,2);%xyƽ����ת180�� 
        DD(i,j,z,8,1:64)=reshape(cund4,[1,64]);
        
        cund4=rot90_3D(cund22,2,2);%xzƽ����ת180�� 
        DD(i,j,z,9,1:64)=reshape(cund4,[1,64]);
        
        cund4=rot90_3D(cund22,1,2);%yzƽ����ת180�� 
        DD(i,j,z,10,1:64)=reshape(cund4,[1,64]);
        %��7�ֱ任��ת270��
        cund4=rot90_3D(cund22,3,3);%xyƽ����ת270�� 
        DD(i,j,z,11,1:64)=reshape(cund4,[1,64]);
        
        cund4=rot90_3D(cund22,2,3);%xzƽ����ת270�� 
        DD(i,j,z,12,1:64)=reshape(cund4,[1,64]);
        
        cund4=rot90_3D(cund22,1,1);%yzƽ����ת270�� 
        DD(i,j,z,13,1:64)=reshape(cund4,[1,64]);
        %��8�ֱ任�������45�ȷ���
        cund4=permute(cund22, [2, 1, 3]);%xy��������任
        DD(i,j,z,14,1:64)=reshape(cund4,[1,64]);
        
        cund4=permute(cund22, [3, 2, 1]);%xz��������任
        DD(i,j,z,15,1:64)=reshape(cund4,[1,64]);
        
        cund4=permute(cund22, [1, 3, 2]);%yz��������任
        DD(i,j,z,16,1:64)=reshape(cund4,[1,64]);
        %��9�ֱ任���������135�ȷ���
        cund4=rot90_3D(flipud(cund22),3,1);%xy��������135�ȷ���
        DD(i,j,z,17,1:64)=reshape(cund4,[1,64]);
        
        cund4=rot90_3D(flipud(cund22),2,1);%xz��������135�ȷ���
        DD(i,j,z,18,1:64)=reshape(cund4,[1,64]);
        
        cund4=rot90_3D(flip(cund22,3),1,3);%yz��������135�ȷ���
        DD(i,j,z,19,1:64)=reshape(cund4,[1,64]);