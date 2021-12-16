%% this script plots the normalized gaussian distributions for the endpoints redox raio and NADH a1 for different population combinations
% with specific mean and with specific variance
rng(0,'twister')

%% modeling NAD(P)H a1  
%% Trastuzumab Responsive & CD3+ T cells 
mumain = 69.2;  
sigmamain = 2.9;    
musub = 80.57;
sigmasub = 3.78;  
y = sigmamain.*randn(100000,1) + mumain;
y2 = sigmasub.*randn(10000,1) + musub; % 10% of total popuation


figure(1)
sgtitle('NAD(P)H a1', 'FontSize',25, 'FontWeight','Bold')

subplot(2,2,1) % top left
h1 = histogram(y,100);
hold on
h2 = histogram(y2, 100);
set(h2,'FaceColor','green');
hold off
title('A. Drug Responsive Cancer Cell and CD3+ T Cells','FontSize',20, 'FontWeight','Normal')
xlabel('values','FontSize',20)
ylabel('probability density','FontSize',20)
%legend('Drug Responsive: 1117 +/- 94.53','CD3+ T Cells: 605.93 +/- 86.76','FontSize',15)

%% Trastuzumab Resistant & CD3+ T cells
mumain = 74.2;  
sigmamain = 3;    
musub = 80.57;
sigmasub = 3.78;  
y = sigmamain.*randn(100000,1) + mumain;
y2 = sigmasub.*randn(10000,1) + musub; % 1% of total popuation

figure(1)
subplot(2,2,2) % top right
h1 = histogram(y,100);
hold on
h2 = histogram(y2, 100);
set(h2,'FaceColor','green');
hold off
title('B. Drug Resistant Cancer Cell and CD3+ T Cells','FontSize',20, 'FontWeight','Normal')
xlabel('values','FontSize',20)
ylabel('probability density','FontSize',20)
%legend('Drug Responsive: 1117 +/- 94.53','CD3+ T Cells: 605.93 +/- 86.76','FontSize',15)

%% Quiescent and Activated CD3+ T cells
mumain = 79.14;  
sigmamain = 3.29;    
musub = 83.36;
sigmasub = 3.05;  
y = sigmamain.*randn(100000,1) + mumain;
y2 = sigmasub.*randn(10000,1) + musub; % 1% of total popuation

figure(1)
subplot(2,2,3) % bottom left
h1 = histogram(y,100);
hold on
h2 = histogram(y2, 100);
set(h2,'FaceColor','green');
hold off
title('C. Quiescent & Activated CD3+ T Cells','FontSize',20, 'FontWeight','Normal')
xlabel('values','FontSize',20)
ylabel('probability density','FontSize',20)
%legend('Drug Responsive: 1117 +/- 94.53','CD3+ T Cells: 605.93 +/- 86.76','FontSize',15)


%% Trastuzumab Responsive & Resistant
mumain = 69.2;  
sigmamain = 2.9;    
musub = 74.2;
sigmasub = 3;  
y = sigmamain.*randn(100000,1) + mumain;
y2 = sigmasub.*randn(10000,1) + musub; % 1% of total popuation


figure(1)
subplot(2,2,4) % bottom right
h1 = histogram(y,100);
hold on
h2 = histogram(y2, 100);
set(h2,'FaceColor','green');
hold off
title('D. Drug Responsive & Resistant Cancer Cell','FontSize',20, 'FontWeight','Normal')
xlabel('values','FontSize',20)
ylabel('probability density','FontSize',20)
%legend('Drug Responsive: 1117 +/- 94.53','CD3+ T Cells: 605.93 +/- 86.76','FontSize',15)





%% modeling Redox Ratio  
%% Trastuzumab Responsive & CD3+ T cells 
mumain = 1;  
sigmamain = 0.4225;    
musub = 0.86;
sigmasub = 0.08;  
y = sigmamain.*randn(100000,1) + mumain;
y2 = sigmasub.*randn(10000,1) + musub; % 1% of total popuation

figure(2)
sgtitle('Redox Ratio', 'FontSize',25, 'FontWeight','Bold')
subplot(2,2,1) % top left
h1 = histogram(y,100);
hold on
h2 = histogram(y2, 100);
set(h2,'FaceColor','green');
hold off
title('E. Drug Responsive Cancer Cell and CD3+ T Cells','FontSize',20, 'FontWeight','Normal')
xlabel('values','FontSize',20)
ylabel('probability density','FontSize',20)
%legend('Drug Responsive: 1117 +/- 94.53','CD3+ T Cells: 605.93 +/- 86.76','FontSize',15)

%% Trastuzumab Resistant & CD3+ T cells
mumain = 1;  
sigmamain = 0.5486;    
musub = 0.86;
sigmasub = 0.08;  
y = sigmamain.*randn(100000,1) + mumain;
y2 = sigmasub.*randn(10000,1) + musub; % 1% of total popuation


figure(2)
subplot(2,2,2) % top right
h1 = histogram(y,100);
hold on
h2 = histogram(y2, 100);
set(h2,'FaceColor','green');
hold off
title('F. Drug Resistant Cancer Cell and CD3+ T Cells','FontSize',20, 'FontWeight','Normal')
xlabel('values','FontSize',20)
ylabel('probability density','FontSize',20)
%legend('Drug Responsive: 1117 +/- 94.53','CD3+ T Cells: 605.93 +/- 86.76','FontSize',15)

%% Quiescent and Activated CD3+ T cells
mumain = 0.83;  
sigmamain = 0.07;    
musub = 0.9;
sigmasub = 0.07;  
y = sigmamain.*randn(100000,1) + mumain;
y2 = sigmasub.*randn(10000,1) + musub; % 1% of total popuation


figure(2)
subplot(2,2,3) % bottom left
h1 = histogram(y,100);
hold on
h2 = histogram(y2, 100);
set(h2,'FaceColor','green');
hold off
title('G. Quiescent & Activated CD3+ T Cells','FontSize',20, 'FontWeight','Normal')
xlabel('values','FontSize',20)
ylabel('probability density','FontSize',20)
%legend('Drug Responsive: 1117 +/- 94.53','CD3+ T Cells: 605.93 +/- 86.76','FontSize',15)

%% Trastuzumab Responsive & Resistant
mumain = 1;  
sigmamain = 0.4225;    
musub = 1;
sigmasub = 0.5486;  
y = sigmamain.*randn(100000,1) + mumain;
y2 = sigmasub.*randn(10000,1) + musub; % 1% of total popuation


figure(2)
subplot(2,2,4) % bottom right
h1 = histogram(y,100);
hold on
h2 = histogram(y2, 100);
set(h2,'FaceColor','green');
hold off
title('H. Drug Responsive & Resistant Cancer Cell','FontSize',20, 'FontWeight','Normal')
xlabel('values','FontSize',20)
ylabel('probability density','FontSize',20)
%legend('Drug Responsive: 1117 +/- 94.53','CD3+ T Cells: 605.93 +/-%86.76','FontSize',15)









%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% modeling Redox Ratio & NADH (A, D, E, H)
%% NADH a1 Trastuzumab Responsive & CD3+ T cells 
mumain = 69.2;  
sigmamain = 2.9;    
musub = 80.57;
sigmasub = 3.78;  
y = sigmamain.*randn(100000,1) + mumain;
y2 = sigmasub.*randn(10000,1) + musub; % 10% of total popuation


figure(3)
%sgtitle('NAD(P)H a1', 'FontSize',25, 'FontWeight','Bold')
%legend('Drug Responsive: 1117 +/- 94.53','CD3+ T Cells: 605.93 +/- 86.76','Drug Responsive: 69.2 +/- 2.9','Drug Resistant: 74.2 +/- 3','FontSize',15)

subplot(2,2,1) % top left
h1 = histogram(y,100);
hold on
h2 = histogram(y2, 100);
set(h2,'FaceColor','black');
hold off
%title('A. Drug Responsive Cancer Cell and CD3+ T Cells','FontSize',20, 'FontWeight','Normal')
title('I','FontSize', 30)
ylabel('Number of Cells','FontSize',20)
xlabel('NADH α1 (%)','FontSize',20)
%legend('Drug Responsive: 1117 +/- 94.53','CD3+ T Cells: 605.93 +/- 86.76','FontSize',15)

%% NADH a1 Trastuzumab Responsive & Resistant
mumain = 69.2;  
sigmamain = 2.9;    
musub = 74.2;
sigmasub = 3;  
y = sigmamain.*randn(100000,1) + mumain;
y2 = sigmasub.*randn(10000,1) + musub; % 1% of total popuation


figure(3)

subplot(2,2,2) %top right
h3 = histogram(y,100);
hold on
h4 = histogram(y2, 100);
set(h4,'FaceColor','red');
hold off
%title('D. Drug Responsive & Resistant Cancer Cell','FontSize',20, 'FontWeight','Normal')
title('II','FontSize',30)
ylabel('Number of Cells','FontSize',20)
xlabel('NADH α1 (%)','FontSize',20)
%legend('Drug Responsive: 69.2 +/- 2.9','Drug Resistant: 74.2 +/- 3','FontSize',15)


%% RR Trastuzumab Responsive & CD3+ T cells 
mumain = 1;  
sigmamain = 0.4225;    
musub = 0.86;
sigmasub = 0.08; 

% musub = 0.83;
% sigmasub = 0.07; 
y = sigmamain.*randn(100000,1) + mumain;
y2 = sigmasub.*randn(10000,1) + musub; % 1% of total popuation

figure(3)

subplot(2,2,3) % bottom left
h5 = histogram(y,100);
hold on
h5 = histogram(y2, 75);
set(h5,'FaceColor','black');
hold off
%title('E. Drug Responsive Cancer Cell and CD3+ T Cells','FontSize',20, 'FontWeight','Normal')
title('III','FontSize',30)

ylabel('Number of Cells','FontSize',20)
xlabel('Redox Ratio (AU)','FontSize',20)

%% R3 Trastuzumab Responsive & Resistant
mumain = 1;  
sigmamain = 0.4225;    
musub = 1;
sigmasub = 0.5486;  
y = sigmamain.*randn(100000,1) + mumain;
y2 = sigmasub.*randn(10000,1) + musub; % 1% of total popuation


figure(3)
subplot(2,2,4) % bottom right
h6 = histogram(y,100);
hold on
h7 = histogram(y2, 100);
set(h7,'FaceColor','red');
hold off
%title('H. Drug Responsive & Resistant Cancer Cell','FontSize',20, 'FontWeight','Normal')
title('IV','FontSize',30)

ylabel('Number of Cells','FontSize',20)
xlabel('Redox Ratio (AU)','FontSize',20)
%legend('Drug Responsive: 1117 +/- 94.53','CD3+ T Cells: 605.93 +/-%86.76','FontSize',15)



% Construct a Legend with the data from the sub-plots
hL = legend([h1,h2,h4],{'Drug Responsive Cancer Cell','CD3+ T Cell','Drug Resistant Cancer Cell'},'FontSize',15);
% Programatically move the Legend
newPosition = [0.85 0.9 0.1 0.1];
newUnits = 'normalized';
set(hL,'Position', newPosition,'Units', newUnits);

