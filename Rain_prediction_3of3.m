%Load data

clc
clear all
close all
warning off
%% 
data = readtable("new_rain_data.csv");


%% Randomizing 
cv = cvpartition(size(data,1),'HoldOut',0.3);
idx = cv.test;
dataTrain=data(~idx,:);
dataTest=data(idx,:);
testing=dataTest(1:end,1:end-1);
%% 
dataTrain
%% 
%
dataTest
%% 

testing
%% 
model=fitensemble(dataTrain,'RainTomorrow','Bag',100,'Tree','Type','classification');
%model1 = Treebagger(100, dataTrain,'RainTomorrow' , 'Prior' , [0.70,0.3]); 
prediction=predict(model,testing);
ms=(sum(prediction==table2array(dataTest(:,end)))/size(dataTest,1))*100
%% 

prediction
%% 
e=min(data.Humidity):0.01:max(data.Humidity);
f=min(data.Pressure):0.01:max(data.Pressure);
[x1 x2]=meshgrid(e,f);
x=[x1(:) x2(:)];
ms=predict(model,x);
gscatter(x1(:),x2(:),ms,'cym');
hold on;
gscatter(dataTrain.Humidity,dataTrain.Pressure,dataTrain.RainTomorrow,'rg','.',30);
title("Random forest decisio boundry")



%% 
Prediction_table = array2table(prediction)
%% 
Prediction_array = table2array(Prediction_table)
%% 
figure(4)
confusionchart(dataTest.RainTomorrow,(Prediction_array))
%% 

confusion_matrix_RF = confusionmat(dataTest.RainTomorrow,(Prediction_array));
%% 
confusion_matrix_RF_table = array2table(confusion_matrix_RF)
%% 
confusion_matrix_RF_array = table2array(confusion_matrix_RF_table)

%% 

%% 

true_rain = 4923
predicted_rain = 3340
True_positves = 3017


%Precision 
Precision = True_positves/predicted_rain

%recall
Recall = True_positves/true_rain

%Recall is low and precision is high

%model is too conservation hence less risky model evaluation.

%since we are worried that our prediction should be right we take less risk
%and wehn it acuatlly rained we could oredict only with the accuracy of 40
%percent

%F1 Score 
F1 = 2*Precision*Recall / (Precision+Recall)
%% 

save model.m
%% %% ROC curve 

[datatrain,datatest] = perfcurve((RainTomorrow,posclass); scores)

AUC

plot(datatrain,datatest)
xlabel('False positive rate') 
ylabel('True positive rate')
title('ROC for Classification by Random Forest')





