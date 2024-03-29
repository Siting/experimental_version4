clear all
clc

configID = 41;
series = 3;
stage = 2;
time = 2;
sampleSize = 100;
linkID = 1;

load(['.\ResultCollection\series' num2str(series) '\-sampledAndPertubed-stage-'...
    num2str(stage) '-time-' num2str(time) '.mat']);

population_1 = POPULATION_1(linkID).samples(:,1:sampleSize);
population_2 = POPULATION_2(linkID).samples(:,1:sampleSize);
population_3 = POPULATION_3(linkID).samples;


%2D
figure
h1 = scatter(population_1(2,:),population_1(3,:),'r', 'filled');    % previous
hold on

S = repmat([3]*10,numel(population_2(1,:)),1);
h2 = scatter(population_2(2,:),population_2(3,:),S(:),'b', 'filled');    % perturbed

h3 = scatter(population_3(2,:),population_3(3,:),'k');          % accepted
keyboard
legend([h1 h3 h4], 'previous','perturbed', 'accepted');
xlabel('\rho_{max}');
ylabel('\rho_c');
title(['2D plot of samples at one stage' num2str(stage) 'of link ' num2str(linkID) ' using ABC SMC method.']);

saveas(gcf, ['.\Plots\case' num2str(series) '\link' num2str(linkID) '_2D_pops_stage_' num2str(stage) '_time_' num2str(time) '_dmaxdc.pdf']);
saveas(gcf, ['.\Plots\case' num2str(series) '\link' num2str(linkID) '_2D_pops_stage_' num2str(stage) '_time_' num2str(time) '_dmaxdc.fig']);
saveas(gcf, ['.\Plots\case' num2str(series) '\link' num2str(linkID) '_2D_pops_stage_' num2str(stage) '_time_' num2str(time) '_dmaxdc.eps'], 'epsc');