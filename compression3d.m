clear;clc
tic
load('im_b.mat')
%load('E:\DD\DD1.mat')%����ѹ��������ͼ��
size1=size(im);
xx=size1(2);%ͼ�������������
yy=size1(1);%ͼ��������������
zz=size1(3);
nrx=xx/4;%��ԭʼͼ�񻮷ֳ�8*8�����ؾ���
nry=yy/4;%��ԭʼͼ�񻮷ֳ�8*8�����ؾ���
nrz=zz/4;
ndx=(xx-8)/4+1;%�������򻮷ֳ�16*16�����ؾ���,����Ϊ1
ndy=(yy-8)/4+1;%�������򻮷ֳ�16*16�����ؾ��󣬲���Ϊ1
ndz=(zz-8)/4+1;
DD=zeros(ndy,ndx,ndz,19,64);%���ڴ��ڶ�����ѹ����8*8�����8�ֶ�Ӧ�ı任��ʽ
cund1=zeros(8,8,8);%���ڴ��16*16�Ķ��������ؿ�
cund2=zeros(4,4,4);%���ڴ����16*16�Ķ��������ؿ�ѹ�����γɵ�8*8���ؿ�
cund3=zeros(1,64);
cund33=zeros(1,64);
cund4=zeros(4,4,4);


RRR=zeros(nry,nrx,nrz,6); 
error=zeros(nry,nrx,nrz,1);%���ֿ�
cunr=zeros(1,64);

for z =1:ndz
  for i=1:ndy
    for j=1:ndx
        cund1=im(1+4*(i-1):8+4*(i-1),1+4*(j-1):8+4*(j-1),1+4*(z-1):8+4*(z-1));%ȡ������ͼ��ԭʼͼ����16*16�����ؾ���
        for l=1:4
            for m=1:4
                %����������ÿ�ٽ��ĸ����ص��ƽ��ֵ�����Խ�16*16�Ķ������ת����8*8�Ŀ�
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
        %���Ͻ�8*8*4�ľ��ο�ת����4*4*2�ľ��ο�
        %����19�ֱ任
        DD = affchange(DD,i,j,z,cund22);
    end;
  end;
end

% ���Ϲ������� �뱾
tic
for f = 1:nrz
  for i=1:nry%������ѭ����i��j����֤�˶���ÿ��ֵ��鶼�ҵ�����Ӧ�Ķ�����飬��������˸ö������
    for j=1:nrx%��һϵ�б任����
        %��ֵ���8*8������ֵ�������г�һ�У��ŵ�cunr
        cunr=reshape(im(1+4*(i-1):4+4*(i-1),1+4*(j-1):4+4*(j-1),1+4*(f-1):4*(f-1)+4),[1,64]);
        sumalpha=sum(cunr);   %cunr  is ri��ֵ����ֵ��
        sumalpha2=norm(cunr)^2;%cunr�и�����ֵ��ƽ����������2������ƽ�������൱����ֵ������ÿ��Ԫ�ص�ƽ�������
        dx=1;%�⼸���������Ƿ��α���������������ǵĳ�ֵ�������ⶨ����¼l��ֵ
        dy=1;%��¼k��ֵ
        dz=1;
        ut=1;%��¼m��ֵ
        minH=10^20;%��¼��С�ľ��������Rֵ
        minot=0;%����minot��¼���뵱ǰֵ����ܹ����ƥ��Ķ�������±任��������ȵ���    o
        minst=0;%����minst��¼���뵱ǰֵ����ܹ����ƥ��Ķ�������±任����ĶԱȶȵ���   s
      for z=1:ndz  
        for k=1:ndy%����k��l��¼���뵱ǰֵ����ܹ����ƥ��Ķ����������
            for l=1:ndx%
                for m=1:19%����m��¼���뵱ǰֵ����ܹ����ƥ��Ķ�������19�ֻ������ε����
                    cund3(1:64)=DD(k,l,z,m,1:64);
                    sumbeta=sum(cund3);  % cund3 is di����������ֵ��
                    sumbeta2=norm(cund3)^2;%���������2�������൱�ڶ����������ÿ��Ԫ�ص�ƽ�������
                    alphabeta=cunr*cund3';
                     if (64*sumbeta2-sumbeta^2)~=0
                        st=(64*alphabeta-sumalpha*sumbeta)/(64*sumbeta2-sumbeta^2);%st���ǶԱȶȵ���ϵ��s
                     end;
                     if (64*sumbeta2-sumbeta^2)==0||st > 1 || st < -1
                             st=0;
                     end;
                    ot=(sumalpha-st*sumbeta)/64;%ot��ʹ���ȵ���ϵ��
                    H=(sumalpha2+st*(st*sumbeta2-2*alphabeta+2*ot*sumbeta)+ot*(64*ot-2*sumalpha))/64;%�ڵ�ǰs��o�������µ�R
                    if H<minH    %Ѱ���������ֵ�������ƥ�䣬����¼�����ƥ��Ĳ���ֵ
                        dx=l;
                        dy=k;
                        dz=z;
                        ut=m;
                        minot=ot;
                        minst=st;
                        minH=H;
                        cund33=cund3;
                    end;
                end;
            end;
        end;
      end
        RRR(i,j,f,1)=minst;
        RRR(i,j,f,2)=minot;
        RRR(i,j,f,3)=dy;
        RRR(i,j,f,4)=dx;
        RRR(i,j,f,5)=ut;
        RRR(i,j,f,6)=dz;
        error(i,j,f,1) = minH;
    end;
  end
end;
%save(currentFileDD,'RRR')
toc