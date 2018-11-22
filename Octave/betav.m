function[beta]=detren(y,k,jam,kk);
ob=length(y);

lye=[y(k+1:ob,1);zeros(k,1)];
lya=[zeros(k,1);y(1:ob-k)];


bas1=[jam*eye(ob-4),zeros(ob-4,4)];
bas2=[zeros(ob-4,1),-4*jam*eye(ob-4),zeros(ob-4,3)];
bas3=[zeros(ob-4,2),(0+6*jam)*eye(ob-4),zeros(ob-4,2)];
bas4=[zeros(ob-4,3),-4*jam*eye(ob-4),zeros(ob-4,1)];
bas5=[zeros(ob-4,4),jam*eye(ob-4)];
bb=bas1+bas2+bas3+bas4+bas5;
bb1=[0+jam,-2*jam,jam,zeros(1,ob-3)];
bb2=[-2*jam,0+5*jam,-4*jam,jam,zeros(1,ob-4)];
bbl1=[zeros(1,ob-3),jam,-2*jam,0+jam];
bbl2=[zeros(1,ob-4),jam,-4*jam,0+5*jam,-2*jam];
bbb=[bb1;bb2;bb;bbl2;bbl1];
klas=[zeros(ob-k,k),.5*eye(ob-k);zeros(k,ob)];
kfis=[zeros(k,ob);.5*eye(ob-k),zeros(ob-k,k)];
bbnh=bbb+klas+kfis;
ccj=inv(bbnh);
jtr=ccj*((lye+lya)/2);
jcy=y-jtr;
 
djtb=jtr(2*kk+1+k:ob-k)-2*jtr(kk+1+k:ob-kk-k)+jtr(1+k:ob-2*kk-k);
djcb=-jcy(kk+1+k:ob-kk-k);
cotcjb=cov(djtb,djcb);betcjb(kk,1)=cotcjb(1,2)/cotcjb(2,2);
beta=cotcjb(1,2)/cotcjb(2,2);
