Y = ones(288,1);
Y(145:288) = 2;
c = zeros(1,140);
for i= 1:140
    count1 = 0;
    count2 =0;
    testf(:,i) = feature_vector(:,i);
    newx(:,i) = feature_vector2(:,i);
    
   SVMModel = fitcsvm(testf,Y,'KernelFunction','rbf','Standardize',true,'ClassNames',{'1','2'});
   
   [label,score]=predict(SVMModel,newx);
   
   label = cell2mat(label);
  for j=1:16
    if(label(j,1)=='1')
        count1=count1+1;
    end
  end
for j=17:32
    if(label(j,1)=='2')
        count2=count2+1;
    end
end
c(1,i) = count1 + count2;
p(1,i) = (c(1,i)/32) * 100;
end

large = zeros(1,9);
max=0;

for j=1:9
max = p(1,1);
index = 1;
for i=1:140
if(max<p(1,i))
max=p(1,i);
index=i;
end
end
large(1,j) = max;
indice(1,j) = index;
p(1,index) = 0;
end

Y=zeros(288,1);
for i=1:144
Y(i,1)=1;
end
for i=145:288
Y(i,1)=2;
end

opt_feature=zeros(288,9);
opt_feature(:,1)=feature_vector(:,indice(1,1));
opt_feature(:,2)=feature_vector(:,indice(1,2));
opt_feature(:,3)=feature_vector(:,indice(1,3));
opt_feature(:,4)=feature_vector(:,indice(1,4));
opt_feature(:,5)=feature_vector(:,indice(1,5));
opt_feature(:,6)=feature_vector(:,indice(1,6));
opt_feature(:,7)=feature_vector(:,indice(1,7));
opt_feature(:,8)=feature_vector(:,indice(1,8));
opt_feature(:,9)=feature_vector(:,indice(1,9));
newX=zeros(32,9);
newX(:,1)=feature_vector2(:,indice(1,1));
newX(:,2)=feature_vector2(:,indice(1,2));
newX(:,3)=feature_vector2(:,indice(1,3));
newX(:,4)=feature_vector2(:,indice(1,4));
newX(:,5)=feature_vector2(:,indice(1,5));
newX(:,6)=feature_vector2(:,indice(1,6));
newX(:,7)=feature_vector2(:,indice(1,7));
newX(:,8)=feature_vector2(:,indice(1,8));
newX(:,9)=feature_vector2(:,indice(1,9));

SVMModel = fitcsvm(opt_feature,Y,'KernelFunction','rbf','Standardize',true,'ClassNames',{'1','2'});
[label,score]=predict(SVMModel,newX);
label=cell2mat(label);
count=0;
count1=0;
count2=0;
for i=1:16
    if(label(i,1)=='1')
        count1=count1+1;
    end
end
for i=17:32
    if(label(i,1)=='2')
        count2=count2+1;
    end
end
count=count1+count2;
s=sprintf('Accuracy is %f %.',(count/length(label))*100);
h = msgbox(s);



