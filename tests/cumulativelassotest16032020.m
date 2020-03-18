% Cumulative test runs

n_vec = [1000*ones(1,550),2000*ones(1,550),5000*ones(1,550)];
p_vec = [50*ones(1,275),100*ones(1,275),150*ones(1,275),200*ones(1,275),250*ones(1,275),300*ones(1,275)];
s_vec = [10*ones(1,137),20*ones(1,138),20*ones(1,137),50*ones(1,138),20*ones(1,137),50*ones(1,138),...
        50*ones(1,137),100*ones(1,138),50*ones(1,137),100*ones(1,138),50*ones(1,137),100*ones(1,138)];
b_vec = [1*ones(1,45),2*ones(1,45),5*ones(1,47),...
         1*ones(1,45),2*ones(1,46),5*ones(1,47),...
         1*ones(1,45),2*ones(1,45),5*ones(1,47),...
         1*ones(1,45),2*ones(1,46),5*ones(1,47),...
         1*ones(1,45),2*ones(1,45),5*ones(1,47),...
         1*ones(1,45),2*ones(1,46),5*ones(1,47),...
         1*ones(1,45),2*ones(1,45),5*ones(1,47),...
         1*ones(1,45),2*ones(1,46),5*ones(1,47),...
         1*ones(1,45),2*ones(1,45),5*ones(1,47),...
         1*ones(1,45),2*ones(1,46),5*ones(1,47),...
         1*ones(1,45),2*ones(1,45),5*ones(1,47),...
         1*ones(1,45),2*ones(1,46),5*ones(1,47)];     
rho_vec = repmat([zeros(1,11),0.6*ones(1,11)],1,75);
mew_vec = repmat([5*ones(1,5),10*ones(1,5),5*ones(1,6),10*ones(1,6)],1,75);
max_iter = 20;
split = 0.5;

Beta = zeros(300, 3, size(n_vec,2));
Beta0 = zeros(300, 1, size(n_vec,2)); 
Lambda = zeros(1,3, size(n_vec,2));
Time = zeros(1,3, size(n_vec,2));

ABeta = zeros(300, 3, size(n_vec,2));
ABeta0 = zeros(300, 1, size(n_vec,2)); 
ALambda = zeros(1,3, size(n_vec,2));
ATime = zeros(1,3, size(n_vec,2));



for i=1:10
    disp("The current iteration is ");
    disp(i);
    
    n = n_vec(1,i);
    p = p_vec(1,i);
    s = s_vec(1,i);
    beta_type = b_vec(1,i);
    rho = rho_vec(1,i);
    mew = mew_vec(1,i);
%     [Lambda(:,:,i), Beta(1:p,:,i), Time(:,:,i), Beta0(1:p,:,i)] = ...
%         lassotest(n, p, s, beta_type, rho, mew, max_iter, split);
    [ALambda(:,:,i), ABeta(1:p,:,i), ATime(:,:,i), ABeta0(1:p,:,i)] = ...
        adaptivelassotest(n, p, s, beta_type, rho, mew, max_iter, split);
end