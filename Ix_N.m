function w = Ix_N(n,P,X,Y,kol,b,a,mas,i_edge,i_tip1,i_tip2,Xc,Yc)
key = 0;
for i=1:length(Y)-1
    if (key==0)&&((Y(i)<=Yc(1))&&(Y(i+1)>Yc(1)))
        step=Y(i+1)-Y(i);
        ycen=Y(i)+step/2;
        key = 1;
    end
end
y_=b/a*kol*step;
F= @(x) N(n,x,y_,P,X,Y,kol,a,i_edge,i_tip1,i_tip2,Xc,Yc);

nn=kol; %���������� ������ �������

aa=0;
h=(kol*step-aa)/(2*nn); %���������� ���

integ = F(aa);

for i=1:1:(nn-1) %��� �������� ��������

x=aa+2*h*i;

integ=integ+2*F(x)+4*F(x-h);

end

integ=integ+4*F(aa+h*(2*nn-1))+F(aa+h*2*nn);

integ=h*integ/3;

w=integ';

end