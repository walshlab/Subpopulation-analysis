% This script manually find the number of components (alongside found means
% and proportions) for whatever population combination and endpoint is given

% the second portion makes a heatmap of population combinations and endpoints and the found number of components for 1% and 5% subpopulations 
                        
%% define known constants
rng(0,'twister')
n_main = 100000;
n_sub = 5000; %1% of the main population
mu_main = 68.9;
sigma_main = 4.2;

mu_sub = 91.64;
sigma_sub = 2.69;

%% fit to a model 
y = sigma_main.*randn(n_main,1) + mu_main;    %100000 main cells
y2 = sigma_sub.*randn(n_sub,1) + mu_sub; %10000 sub cells
C = cat(1, y, y2);
  
   
   AIC = zeros(1,4); % create an ouput array for AIC
   GMModels = cell(1,4); %pre allocate GMModels (1x4 cell)
   options = statset('MaxIter',00); % add optitons here to better/refine the model
   for k = 1:4
       GMModels{k} = fitgmdist(C,k);
       AIC(k)= GMModels{k}.AIC;
     
   end
   [minAIC,numComponents] = min(AIC);
   numComponents;
   BestModel = GMModels{numComponents};
   
   %% create heatmap for 1% of total population
cdata = [1 3 2 3 2 2 4;1 3 3 3 2 2 2;1 3 2 3 2 2 3;1 3 3 3 2 3 2;1 2 1 3 1 1 1;1 1 1 1 1 1 1];
xvalues = {'Redox Ratio','NAD(P)H τ1','NAD(P)H τ2','NAD(P)H α1','FAD τ1','FAD τ2','FAD α1'};
yvalues = {'Drug Responsive Cells & CD3+ T cells','Drug Resistant Cells & CD3+ T Cells', 'Drug Responsive Cells & Quiescent CD3+ T Cells','Drug Responsive Cells & Activated CD3+ T Cells','Drug Responsive Cells & Drug Resistant Cells','Quiescent & Activated T Cells'};
h = heatmap(xvalues, yvalues, cdata, 'FontSize',18);

%h.Title = 'A. number of components for subpopulation = 1% of total population';
%h.XLabel = 'Sizes';
%h.YLabel = 'Cell Combinations';

   %% create heatmap for 5% of total population
cdata = [4 2 2 2 2 2 2;4 3 2 2 2 2 2;4 2 2 2 2 2 2;4 2 2 2 2 2 2;1 1 2 3 1 2 2;2 2 2 4 1 1 2;];
xvalues = {'Redox Ratio','NAD(P)H τ1','NAD(P)H τ2','NAD(P)H α1','FAD τ1','FAD τ2','FAD α1'};
yvalues = {'Drug Responsive Cells & CD3+ T cells','Drug Resistant Cells & CD3+ T Cells', 'Drug Responsive Cells & Quiescent CD3+ T Cells','Drug Responsive Cells & Activated CD3+ T Cells','Drug Responsive Cells & Drug Resistant Cells','Quiescent & Activated T Cells'};
h = heatmap(xvalues, yvalues, cdata, 'FontSize',18);

%h.Title = 'B. number of components for subpopulation = 5% of total population';
%h.XLabel = 'Sizes';
%h.YLabel = 'Cell Combinations';