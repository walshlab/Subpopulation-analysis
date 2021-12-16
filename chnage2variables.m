%% this script finds the number of components for varying means and standard deviations of a sub population
%% define known constants
% rng(0,'twister')
n_main = 100000; %100k or 1 million
n_sub = 5000; %can change this to 1000 or 5000 to represent 1% or 5% sub

sigma_main = 0.1;
sigma_sub = 0.01;

mu_main = 1;
mu_sub = 0.01;
%% change 2 variables and run model
sigmasub_val = 0.01:0.02:1; %you can change this to 0.5
musub_val = 0.01:0.02:3;

outputData = zeros(length(sigmasub_val), 3);% create an output array for (length mumain_val),numComponents (10x3 double)
BestModel = cell(numel(sigma_sub),1); % pre-allocate array to hold fitgmdist outputs (1x19 cell)
allMus    = cell(numel(sigma_sub),1); %pre-allocate array to hold mu outputs (1x19 cell)


for i = 1:length(sigmasub_val)
    sigmasub_pos = i; %iteration
    sigma_sub = sigmasub_val(sigmasub_pos); % sigma main from every iteration %Finding the position
   
    for j = 1:length(musub_val)
       musub_pos = j; %iteration
       mu_sub = musub_val(musub_pos); % sigma main from every iteration

       y = sigma_main.*randn(n_main,1) + mu_main;    
       y2 = sigma_sub.*randn(n_sub,1) + mu_sub;
       C = cat(1, y, y2);
 
   
           AIC = zeros(1,4); % create an ouput array for AIC
           GMModels = cell(1,4); %pre allocate GMModels (1x4 cell)
           options = statset('MaxIter',00); % add optitons here to better/refine the model
               for k = 1:4
                   GMModels{k} = fitgmdist(C,k);
                   AIC(k)= GMModels{k}.AIC;
               end
           
               
       [minAIC,numComponents] = min(AIC); %take the min AIC as best model
    
       outputData((i*length(musub_val))-((length(musub_val)-j)),1) = sigma_sub;  %(row, Column)
       outputData((i*length(musub_val))-((length(musub_val)-j)),2) = mu_sub;
       outputData((i*length(musub_val))-((length(musub_val)-j)),3) = numComponents;

       
       BestModel{i} = GMModels{outputData(i,3)}; %1x19 cell with gm distributions
       allMus{i} = BestModel{i}.mu; % 1 x 19 cell with mus
    end
% uncomment to see the plot the real (input) mu vs what the model finds
%        plot mu_main vs Model mu
%        figure(1),
%            for idx=1:length(BestModel)
%            mu = BestModel{idx}.mu; % get all mu's
%            plot(ones(size(mu,1),1)*sigmasub_val(idx),mu,'bo') % plot all in the same sigma value as scatter plot
%            hold on
%            end
%        xlabel('mu main')
%        ylabel('mu')
 
end
%% plot changing variables vs numComponents
figure(2)
scatter3(outputData(:,1),outputData(:,2),outputData(:,3))
xlabel('sigma sub','FontSize',30) 
ylabel('mu sub','FontSize',30)
zlabel('numComponents','FontSize',30)
title('Sub Population = 5% of Total Population 05/19','FontSize',30)
