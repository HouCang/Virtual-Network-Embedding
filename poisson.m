clear
lamda=2;Tmax=50;
delta_t=0.01;%ʱ�侫��
i=1;a=random('exponential',lamda);
T(1)=round(a*10)/10;
w(1)=T(1);%��ʼ��
%%%%%%%%%%%%%%���ɹ���ģ��%%%%%%%%%%%%%%%
while(w(i)<Tmax)
T(i)=random('exponential',lamda);%�������ָ���ֲ���ʱ��������Tn
   T(i)=round(T(i)*10)/10;
   w(i+1)=w(i)+T(i);%����ȴ�ʱ��
   i=i+1;
end
w=w';
x=zeros(w(1)/delta_t,1);
for k=1:size(w,1)-1
length=w(k+1)/delta_t-w(k)/delta_t;
x=[x;ones(length,1)*k];%�õ����ɷֲ�X(t)����
shuai=mean(x);
end
%%%%%%%%%%%���ɹ��̼���%%%%%%%%%%%%%%%%%
alpha=0.05;
lamda1=poissfit(x,alpha);%��MLE�㷨��������ɷֲ���ǿ��lamda����������Ϊ1-lamda
p=poisscdf(x,lamda1);%�����ۼƷֲ�
[H,s]=kstest(x,[x,p],alpha)%����Kolmogorov-Smirnov���飬��������Ϊ1-lamda
if H==1;
disp('������Դ���Ӳ��ɷֲ���') 
else
disp('������Դ�����Ӳ��ɷֲ���') 
end
figure(1)
plot(x,'b')
xlabel('T')
ylabel('X(t)')

figure(2)
a=var(x)
plot(a,'*')
title('�����')

ylabel('var(x)')
figure(3)
b=xcorr(x)
plot(b)
title('����غ���')
xlabel('T')
ylabel('xcorr(x)')
figure(4)
c=mean(x);
plot(c,'+')
title('ƽ��ֵ')
ylabel('mean(x)')



