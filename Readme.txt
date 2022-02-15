Title 
A healthy comparison between Logistic regression and Random forest techniques to predict the Rain for tomorrow


Description
“Will it rain tomorrow? “ is one of the most asked question asked by most of us, everyday on every single area across the face of the world. 
In this project we attempt to predict the rain for tomorrow classification problem using Logistic regression and Random Forest techniques and
compare them later using Parislab @ UCLA  model .There has been many Machine learning classification models predicting the rain based on various 
attributes of temperature, windflaw, direction, cloud position etc. but since there has been very few attempts to predict the same using the average 
humidity and pressure recorded on the said day we set the goal of predicting the rain using the two attributes alone

Getting Started

Dependencies
OS version : Mac mountan lain and  above /Windown 10 and above. 
Anaconda navigator3
Python 3.0 and above
Matlab R2020a
pip install numpy
pip install pandas
OS version : Mac mountan lain and  above /Windown 10 and above. 

Installing

OS needs to be pre installed.
Anaconda naigator is a free install on the internet.
Matlab R2020a is a licensed version and wpould be available on a paid basis.Trail version for 30 days available for free online.
Pls note that online trail version cannot run all the codes effectrively.

How/where to download your program
All the main run executable folders are placed in the same folder as this readme file.


Executing program

1.Open Anaconda navigator 
2.Open Jupyter notebook
3.File open the Rain_prediction_1of3.ipynb code file to execute the python code.
4.Installing all the said librabries 
5.Import weatherAUS dataset
6.Run code.
7.Code saved a fully preprocess EDA completed data set and saves it into a new CSV file name : rain_prediction1.csv  
8.rain_prediction1.csv consists of the fully clean dataset.
9.Open Matlab R2020a in the same folder directory
10.Load LRmodel loads the Logistic regression model
11.Load RFmodel loads the random forest model.
12.Xtest and Y test (csv table )are the testing set for the given prediction
13.Rain_prediction_2of3 matlab code  is the Feature engineering and training model of the dataset and the logistic regression model respectively
14:Rain_preciction_2of3 matlab code saves a new_train_data.csv after normalisation
15.Rain_prediction3of3 is the Training model of the Random Forest model whbich loads the normalised data new_train_csv.
16:The last part of the matlab code saves the model and test set again.make sure to rename the same.
17.Rain_prediction_Python code is the enitre project done in Python code with respect to MATLAB
None of the new techniqes other than the ones executed in MATALAB are implented and Confusion matrix and ROC curves are identified later.


Help
1.The file directory should be maintained to run the said code in the system for both python and Matlab functions.
2.The training set in randomm forest take more than 5 mintues to train.hence please note..


Authors
Vivek Kanna Jayaprakash
vivekkanna.j@gmail.com


Version History
2.0
Various bug fixes and optimizations


Initial Release
1.0

License
This project is licensed under the [Vivek Kanna Jayaprakash] License .Contact onwer for license.md

Acknowledgments
The main inspiration is the desire to predict rain when looking at the the sky.
In tropical countires like mine rain is a gift of nature and to preict it is coming is a importat process especially with regards to farming.
The course work is done for the main purpose of the first semester Machine learning model coursework.
