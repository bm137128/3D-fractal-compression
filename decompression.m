%�ָ�ԭͼ��
RRR=R;
nrx=xx/4;
nry=yy/4;
nrz=zz/4;
% RRR=zeros(nry,nrx,nrz,6);
% for i=1:nry
%     for j=1:nrx
%         RRR(i,j,1)=view(i,j,1);
%         RRR(i,j,2)=view(i,j,2);
%         RRR(i,j,3)=view(i,j,3);
%         RRR(i,j,4)=view(i,j+nrx,1);
%         RRR(i,j,5)=view(i,j+nrx,2);
%         RRR(i,j,6)=view(i,j+nrx,3);
%     end;
% end;
huifu=ones(yy,xx,zz);    
a=50;
for iter=1:a
for f =1:nrz
for i=1:nry
    for j=1:nrx
        st=RRR(i,j,f,1);
        ot=RRR(i,j,f,2);
        dy=RRR(i,j,f,3);
        dx=RRR(i,j,f,4);
%          dy=xy(i,j,1);
%          dx=xy(i,j,2);
        dz=RRR(i,j,f,6);
        ut=RRR(i,j,f,5);
        cund1=huifu(1+4*(dy-1):8+4*(dy-1),1+4*(dx-1):8+4*(dx-1),1+4*(dz-1):8+4*(dz-1));
       % cund1=im(1+4*(i-1):8+4*(i-1),1+4*(j-1):8+4*(j-1),1+4*(z-1):8+4*(z-1));
        if f ==2
           jishu = i;
        end
        for l=1:4
            for m=1:4
                 cund2(l,m,1)=(cund1(1+2*(l-1),1+2*(m-1),1)+cund1(2+2*(l-1),2+2*(m-1),1)+cund1(2+2*(l-1),1+2*(m-1),1)+cund1(1+2*(l-1),2+2*(m-1),1))/4;
                 cund2(l,m,2)=(cund1(1+2*(l-1),1+2*(m-1),2)+cund1(2+2*(l-1),2+2*(m-1),2)+cund1(2+2*(l-1),1+2*(m-1),2)+cund1(1+2*(l-1),2+2*(m-1),2))/4;
                 cund2(l,m,3)=(cund1(1+2*(l-1),1+2*(m-1),3)+cund1(2+2*(l-1),2+2*(m-1),3)+cund1(2+2*(l-1),1+2*(m-1),3)+cund1(1+2*(l-1),2+2*(m-1),3))/4;
                 cund2(l,m,4)=(cund1(1+2*(l-1),1+2*(m-1),4)+cund1(2+2*(l-1),2+2*(m-1),4)+cund1(2+2*(l-1),1+2*(m-1),4)+cund1(1+2*(l-1),2+2*(m-1),4))/4;
                 cund2(l,m,5)=(cund1(1+2*(l-1),1+2*(m-1),5)+cund1(2+2*(l-1),2+2*(m-1),5)+cund1(2+2*(l-1),1+2*(m-1),5)+cund1(1+2*(l-1),2+2*(m-1),5))/4;
                 cund2(l,m,6)=(cund1(1+2*(l-1),1+2*(m-1),6)+cund1(2+2*(l-1),2+2*(m-1),6)+cund1(2+2*(l-1),1+2*(m-1),6)+cund1(1+2*(l-1),2+2*(m-1),6))/4;
                 cund2(l,m,7)=(cund1(1+2*(l-1),1+2*(m-1),7)+cund1(2+2*(l-1),2+2*(m-1),7)+cund1(2+2*(l-1),1+2*(m-1),7)+cund1(1+2*(l-1),2+2*(m-1),7))/4;
                 cund2(l,m,8)=(cund1(1+2*(l-1),1+2*(m-1),8)+cund1(2+2*(l-1),2+2*(m-1),8)+cund1(2+2*(l-1),1+2*(m-1),8)+cund1(1+2*(l-1),2+2*(m-1),8))/4;
            end;
        end;
        cund22(:,:,1) = (cund2(:,:,1)+cund2(:,:,2))/2;
        cund22(:,:,2) = (cund2(:,:,3)+cund2(:,:,4))/2;
        cund22(:,:,3) = (cund2(:,:,5)+cund2(:,:,6))/2;
        cund22(:,:,4) = (cund2(:,:,7)+cund2(:,:,8))/2;
        switch ut         %8�ֱ任
        case 1 
                cund4=cund22;
        %�ڶ��ֱ任���൱�ھ������ҷ�ת
        case 2
                cund4=fliplr(cund22);%��cund2�������ҷ�ת���൱�ھ���ˮƽ���߷��䣬fliplr(A)��flip(A,2)
        case 3 
        %�����ֱ任��cund2�������·�ת
                cund4=flipud(cund22);%��cund2�������·�ת���൱�ھ���ֱ���߷��䣬flipud(A)��flip(A,1)
                case 4
        %���ı任������ǰ��ת��
        cund4=flip(cund22,3);
        case 5
        %�����ֱ任��ת90��
        cund4=rot90_3D(cund22,3,1);%xyƽ����ת90�� 

        case 6
        cund4=rot90_3D(cund22,2,1);%xzƽ����ת90�� 

        case 7
        cund4=rot90_3D(cund22,1,3);%yzƽ����ת90�� 
        case 8
        %��6�ֱ任��ת180��
        cund4=rot90_3D(cund22,3,2);%xyƽ����ת180�� 

        case 9
        cund4=rot90_3D(cund22,2,2);%xzƽ����ת180�� 

        case 10
        cund4=rot90_3D(cund22,1,2);%yzƽ����ת180�� 
        case 11
        %��7�ֱ任��ת270��
        cund4=rot90_3D(cund22,3,3);%xyƽ����ת270�� 

        case 12
        cund4=rot90_3D(cund22,2,3);%xzƽ����ת270�� 

        case 13
        cund4=rot90_3D(cund22,1,1);%yzƽ����ת270�� 
        case 14
        %��8�ֱ任�������45�ȷ���
        cund4=permute(cund22, [2, 1, 3]);%xy��������任

        case 15
        cund4=permute(cund22, [3, 2, 1]);%xz��������任

        case 16
        cund4=permute(cund22, [1, 3, 2]);%yz��������任
        case 17
        %��9�ֱ任���������135�ȷ���
        cund4=rot90_3D(flipud(cund22),3,1);%xy��������135�ȷ���
    
        case 18
        cund4=rot90_3D(flipud(cund22),2,1);%xz��������135�ȷ���
  
        case 19
        cund4=rot90_3D(flip(cund22,3),1,3);%yz��������135�ȷ���;
        end;
        huifu(1+4*(i-1):4+4*(i-1),1+4*(j-1):4+4*(j-1),1+4*(f-1):4*(f-1)+4)=st*cund4+ot;
    end;
   
end;
end

end;
psnr1=psnr(im(:,:,7),huifu(:,:,7),yy,xx)