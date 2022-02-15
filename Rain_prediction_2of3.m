%Load data

clc
clear all
close all
warning off
%%


df = readtable("Rain_prediction1.csv");
df

df(:,1)
df(:,2)

df.Humidity

%Normlise the dataset: 

df.Humidity = (df.Humidity - min(df.Humidity)) / (max(df.Humidity) - min(df.Humidity));
df.Humidity
%%

df.Pressure = (df.Pressure - min(df.Pressure)) / (max(df.Pressure) - min(df.Pressure));
df.Pressure

writetable(df,'new_rain_data.csv');
%%

df = readmatrix("new_rain_data.csv");
df
X = df(:,1:2);
Y = df(:,3); 


Count  = length(Y);
%%

%% Visualisation of thr data

histogram(X(:,1),10)
%%
histogram(X(:,2),10)
%% plot

plot(X(:,1),X(:,2),"X")

histogram(Y(:),10)
%% Scatter plot visulaize

gscatter(X(:,1), X(:,2),Y)
legend("No rain" , "Rain")
xlabel("Relative Humidity (%)")
ylabel("Pressure (Hpa)")
%% Training the model

%we train 70% of the data

Percentage = 0.7;
%shuffling the data so we get randomosied data
Index = randperm(Count); 

Xtrain = X(Index(1:round(Percentage * Count)) , : );
Ytrain = Y(Index(1:round(Percentage * Count)) , : );

Xtest = X(Index(round(Percentage * Count)+1:end) , : );
Ytest = Y(Index(round(Percentage * Count)+1:end) , : );

Beta = mnrfit(Xtrain , Ytrain) ;
%%
Xtrain
%%
Xtest
%%
Ytest
%%
Ytrain
%% Training set allocation

Mtrain = length(Ytrain);
Xtrain2 = [ones(Mtrain,1),Xtrain];
% To calulcate Z

Ztrain = Xtrain2*Beta;
%Hypothesis of signmoid z
Htrain = 1.0./(1.0+exp(-Ztrain));
%% Testing set alogrithm

Mtest = length(Ytest);
Xtest2 = [ones(Mtest,1),Xtest];%% To calulcate Z

Ztest = Xtest2*Beta;
%Hypothesis of signmoid z
Htest = 1.0./(1.0+exp(-Ztest));
%% Histogram plot

histogram(Htest,10)
%%
histogram(Htrain,10)
%% Visulaize the model

scatter(Xtrain(:,1), Xtrain(:,2),100,Htrain);
coloured = colorbar();
%%
scatter(Xtest(:,1), Xtest(:,2),100,Htest);
coloured1 = colorbar();
%% Visulising the decision boundry

gscatter(X(:,1), X(:,2),Y); hold on;
legend("No rain" , "Rain")
xlabel("Relative Humidity (%)")
ylabel("Pressure (Hpa)")
plot(X(:,1),-(Beta(1)*1 + Beta(2)*X(:,1))/Beta(3)); hold off;
%% Evaluate the training model

%training set

Ytrainpred = Htrain < 0.5;
Ytrainpred = Ytrainpred + 1;
gscatter(Xtrain(:,1), Xtrain(:,2),Ytrainpred);
% Check the accuracy
Ytrainpred == Ytrain
Accuracy_training = mean(double(Ytrainpred == Ytrain))*100
%% Evaluate the testing model

%training set

Ytestpred = Htest < 0.5;
Ytestpred = Ytestpred + 1;
gscatter(Xtest(:,1), Xtest(:,2),Ytestpred);
% Check the accuracy
Ytestpred == Ytest
Accuracy_testing = mean(double(Ytestpred == Ytest))*100


%% Calculating precision and recall

true_rain = sum(double(Ytest == 2))
predicted_rain = sum(double(Ytestpred == 2))
True_positves = sum(double(Ytest == 2).*double(Ytestpred == 2))


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

save Beta.m
%% 
Xtest_table = array2table(Xtest)
writetable(Xtest_table,'Xtest.csv');
%% 
Ytest_table = array2table(Ytest)
writetable(Ytest_table,'Ytest.csv');
%% 
%% ROC curve 

[Xtrain,Ytrain] = perfcurve((RainTomorrow,posclass), scores)

AUC

plot(Xtrain,Ytrain)
xlabel('False positive rate') 
ylabel('True positive rate')
title('ROC for Classification by Logistic Regression')
%% 