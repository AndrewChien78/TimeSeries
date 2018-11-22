% Finds the weight on smoothing (called lambda) such that
% the constructed cycle is uncorrelated with the difference between the 
% current trend  and the average of the trend v periods before 
% and v periods hence.

% Operates on the series ly, which must be provided by the user.

% The output of the program is the smoothing parameter lambda as well as
% the smoothed series lytr and a plot of ly and lytr.

% This program calls the program betav. 

% A key parameter, k (which is described in my paper) must be specified
% in the first line.  Its default value is 16.  In my experience, the results become 
% insensitive to k as soon as k is above some critical value which
% is about 12 in the US macro series I have looked at.  

% It is also possible to modify the parameter v (whose default is set equal to 5). 
% To do this, the second line of the program must be modified. 



k=16;
v=5;



ob=length(ly);
jam =8e11;
jamh=jam;
betah=betav(ly,k,jam,v);
if betah<0
   'The trend is probably linear'
   ind=1;
else jam=10;
   jaml=jam;
   betal=betav(ly,k,jam,v);
   if betal>0
      'There are problems, lamda is very low'
      ind=1;
   else ind=0;
   end;
end;
if ind<1
   for i=1:50,
      jam=(jaml+jamh)/2;
      betax=betav(ly,k,jam,v);
      'iteration number',i
      lambda=jam
      beta=betax
      if betax <0
         jaml=jam;betal=betax;
      elseif betax>0
         jamh=jam;betah=betax;
      else jaml=jam;jamh=jam;betah=betax;betal=betax;
      end;
   end;
end;
'Final estimate of lambda is'
lambda
'with associated beta of'
beta

lye=[ly(k+1:ob,1);zeros(k,1)];
lya=[zeros(k,1);ly(1:ob-k)];


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
lytr=ccj*((lye+lya)/2);

plot([ly,lytr]);

      
