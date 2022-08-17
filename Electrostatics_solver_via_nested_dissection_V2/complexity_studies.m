
clear;
clc;



k = 5:100;

log_comp_1 = 2 + 7 * k;

log_comp_2 = zeros(size(k));
for i = 1:size(k,2)
    log_comp_2(i) = log2(compute_nested_dissection_complexity(k(i)));
end

% subplot(1,2,1); 
plot(k,log_comp_1,'Color',[1 0 0],'LineWidth',1); 
hold on; 
plot(k,log_comp_2,'Color',[0 1 0],'LineWidth',1); 
% 
% subplot(1,2,2); 
% plot(k(2:end),(log_comp_1(2:end) - log_comp_1(1:(end-1)))./(k(2:end) - k(1:(end-1))),'Color',[1 0 0],'LineWidth',1); 
% hold on; 
% plot(k(2:end),(log_comp_2(2:end) - log_comp_2(1:(end-1)))./(k(2:end) - k(1:(end-1))),'Color',[0 1 0],'LineWidth',1); 

compute_nested_dissection_complexity(100)/(2^(6*100))

