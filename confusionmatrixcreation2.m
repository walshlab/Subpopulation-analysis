%% this script creates confusion matrices for the downselection of the best algorithm 
% it also plots confusion matrices for all the datasets 
rng default
%% 66 percentage split
%random forest
figure(1)
ClassLabels = ["..", ",,", ".", ","];
subplot(3,1,1)
A=[1985 81 0 0;61 1584 0 0;0 0 1013 91;0 0 125 458];
cm = confusionchart(A);
cm.RowSummary = 'row-normalized';
%cm.ColumnSummary = 'column-normalized';
%title('A. Random Forest')

cm.FontSize = 30;
cm.XLabel = '';
cm.YLabel = '';

%logistic classifier
figure(1)
subplot(3,1,2)
A=[1980 86 0 0;54 1591 0 0;0 0 1004 100;0 0 120 463];
cm = confusionchart(A);
cm.RowSummary = 'row-normalized';
%cm.ColumnSummary = 'column-normalized';
%title('B. Logistic Classifier')
cm.FontSize = 30;
cm.XLabel = '';
cm.YLabel = '';

%multilayer perceptron
figure(1)
subplot(3,1,3)
A=[1989 77 0 0;55 1590 0 2;0 0 1022 82;0 0 130 453];
cm = confusionchart(A);
cm.RowSummary = 'row-normalized';
%cm.ColumnSummary = 'column-normalized';
%title('C. Multilayer Perceptron')
cm.FontSize = 30;
cm.XLabel = '';
cm.YLabel = '';

%% 10-fold cross validation

%random forest
figure(2)
subplot(3,1,1)
A=[5821 179 0 0;223 4777 0 0;0 0 3002 232;0 0 306 1337];
cm = confusionchart(A);
cm.RowSummary = 'row-normalized';
%cm.ColumnSummary = 'column-normalized';
%title('A. Random Forest')
cm.FontSize = 30;
cm.XLabel = '';
cm.YLabel = '';

%logistic classifier
figure(2)
subplot(3,1,2)
A=[5798 202 0 0;197 4803 0 0;0 0 2967 267;0 0 317 1326];
cm = confusionchart(A);
cm.RowSummary = 'row-normalized';
%cm.ColumnSummary = 'column-normalized';
%title('B. Logistic Classifier')
cm.FontSize = 30;
cm.XLabel = '';
cm.YLabel = '';

%multilayer perceptron
figure(2)
subplot(3,1,3)
A=[5830 169 1 0;198 4799 1 2;0 0 2910 324;0 0 270 1373];
cm = confusionchart(A);
cm.RowSummary = 'row-normalized';
%cm.ColumnSummary = 'column-normalized';
%title('C. Multilayer Perceptron')
cm.FontSize = 30;
cm.XLabel = '';
cm.YLabel = '';

%% 70/30% split
figure(3)
ClassLabels = ["..", ",,", ".", ","];
subplot(4,1,1)
A=[3392 113 0 0;125 3397 0 0;0 0 3109 366;0 0 356 3142];
cm = confusionchart(A);
cm.RowSummary = 'row-normalized';
%cm.ColumnSummary = 'column-normalized';
%title('A')
cm.FontSize = 30;
cm.XLabel = '';
cm.YLabel = '';


% 30 test
figure(3)

subplot(4,1,2)
A=[1436 59 0 0;66 1412 0 0;0 0 1365 160;0 0 169 1333];
cm = confusionchart(A);
cm.RowSummary = 'row-normalized';
%cm.ColumnSummary = 'column-normalized';
%title('B')
cm.FontSize = 30;
cm.XLabel = '';
cm.YLabel = '';


% unseen 90/10 4 populations
figure(3)
subplot(4,1,3)
A=[8694 306 0 0;385 8615 0 0;0 0 921 79;0 0 96 904];
cm = confusionchart(A);
cm.RowSummary = 'row-normalized';
%cm.ColumnSummary = 'column-normalized';
%title('C')
cm.FontSize = 30;
cm.XLabel = '';
cm.YLabel = '';

%unseen 90/10 2 populations
figure(3)
subplot(4,1,4)

A=[17369 631 0 0;0 0 0 0;0 0 1374 626;0 0 0 0];
cm = confusionchart(A);
cm.RowSummary = 'row-normalized';
%cm.ColumnSummary = 'column-normalized';
%title('D')
cm.FontSize = 30;
cm.XLabel = '';
cm.YLabel = '';







%% 90/10% split
figure(4)
subplot(4,1,1)
A=[4354 158 0 0;165 4352 0 0;0 0 3977 474;0 0 442 4076];
ClassLabels = ["..", ",,", ".", ","];

cm = confusionchart(A);
cm.RowSummary = 'row-normalized';
%cm.ColumnSummary = 'column-normalized';
%title('A. Model (90% Train)')
cm.FontSize = 30;
%title('A')
cm.XLabel = '';
cm.YLabel = '';

%30 test
figure(4)
subplot(4,1,2)
A=[470 18 0 0;22 461 0 0;0 0 489 60;0 0 58 422];
cm = confusionchart(A);
cm.RowSummary = 'row-normalized';
%cm.ColumnSummary = 'column-normalized';
%title('B. 10% Test')
cm.FontSize = 30;
%title('B')
cm.XLabel = '';
cm.YLabel = '';


%unseen 90/10 4 populations
figure(4)
subplot(4,1,3)
A=[8685 306 0 0;368 8632 0 0;0 0 919 81;0 0 91 909];
cm = confusionchart(A);
cm.RowSummary = 'row-normalized';
%cm.ColumnSummary = 'column-normalized';
%title('C. Unseen 4 populations')
cm.FontSize = 30;
%title('C')
cm.XLabel = '';
cm.YLabel = '';

%unseen 90/10 2 populations
figure(4)
subplot(4,1,4)
A=[17378 622 0 0;0 0 0 0;0 0 1358 642;0 0 0 0];
cm = confusionchart(A);
cm.RowSummary = 'row-normalized';
%cm.ColumnSummary = 'column-normalized';
%title('D. Unseen 2 populations')
cm.FontSize = 30;
%title('D')
cm.XLabel = '';
cm.YLabel = '';

%% 05/20 New Experiment 70/30% split
figure(3)
ClassLabels = ["..", ",,", ".", ","];
subplot(7,1,1)
A=[3392 113 0 0;125 3397 0 0;0 0 3109 366;0 0 356 3142];
cm = confusionchart(A);
cm.RowSummary = 'row-normalized';
%cm.ColumnSummary = 'column-normalized';
%title('A')
cm.FontSize = 30;
cm.XLabel = '';
cm.YLabel = '';


% 30 test
figure(3)

subplot(7,1,2)
A=[1436 59 0 0;66 1412 0 0;0 0 1365 160;0 0 169 1333];
cm = confusionchart(A);
cm.RowSummary = 'row-normalized';
%cm.ColumnSummary = 'column-normalized';
%title('B')
cm.FontSize = 30;
cm.XLabel = '';
cm.YLabel = '';


% unseen 90/10 4 populations
figure(3)
subplot(7,1,3)
A=[8694 306 0 0;385 8615 0 0;0 0 921 79;0 0 96 904];
cm = confusionchart(A);
cm.RowSummary = 'row-normalized';
%cm.ColumnSummary = 'column-normalized';
%title('C')
cm.FontSize = 30;
cm.XLabel = '';
cm.YLabel = '';



% NEW unseen 95/5 4 populations
figure(3)
subplot(7,1,4)
A=[9155 345 0 0;395 9105 0 0;0 0 452 48;0 0 67 433];
cm = confusionchart(A);
cm.RowSummary = 'row-normalized';
%cm.ColumnSummary = 'column-normalized';
%title('C')
cm.FontSize = 30;
cm.XLabel = '';
cm.YLabel = '';


% unseen 99/1 4 populations
figure(3)
subplot(7,1,5)
A=[9545 355 0 0;415 9485 0 0;0 0 87 13;0 0 5 95];
cm = confusionchart(A);
cm.RowSummary = 'row-normalized';
%cm.ColumnSummary = 'column-normalized';
%title('C')
cm.FontSize = 30;
cm.XLabel = '';
cm.YLabel = '';

% unseen 75/25 4 populations
figure(3)
subplot(7,1,6)
A=[13492 508 0 0;41 959 0 0;0 0 3570 430;0 0 104 896];
cm = confusionchart(A);
cm.RowSummary = 'row-normalized';
%cm.ColumnSummary = 'column-normalized';
%title('C')
cm.FontSize = 30;
cm.XLabel = '';
cm.YLabel = '';


% 12.11 unseen T cell population
figure(3)
subplot(7,1,7)
A=[0 0 0 0;0 0 0 0;0 1 315 15;0 0 27 338];
cm = confusionchart(A);
cm.RowSummary = 'row-normalized';
%cm.ColumnSummary = 'column-normalized';
%title('C')
cm.FontSize = 30;
cm.XLabel = '';
cm.YLabel = '';
