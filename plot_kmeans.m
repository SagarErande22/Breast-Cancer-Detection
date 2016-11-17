testp(:,1) = feature_vector(:,78);
%testp(:,2) = feature_vector(:,75);
X = testp;
figure;

plot(X(:,1),'.');
title 'data';
opts = statset('Display','final');
[IDX,C] = kmeans(X,2,'Distance','cityblock','Replicates',5,'Options',opts);
figure;
plot(X(IDX==1,1),'r.')
hold on
plot(X(IDX==2,1),'b.')
plot(C(:,1),'kx','MarkerSize',15,'LineWidth',3)
axis([1 288 0.98 1]);
legend('c1','c2','cl','loc','nw')
hold off