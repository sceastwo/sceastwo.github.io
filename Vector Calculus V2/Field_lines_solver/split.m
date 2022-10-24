function [w_new,u_new,v_new,separation_flag] = split(w_old,u_old,v_old,dir,w_delta)
%SPLIT Summary of this function goes here
%   (u_old,v_old) = the old % vector
%   (u_new,v_new) = the new % vector
% dir = 
%   1 = -u 
%   2 = +u 
%   3 = -v 
%   4 = +v 
%   5 = through

    [w_new,u_new,v_new,separation_flag] = merge(w_old,u_old,v_old,dir,-w_delta);
    
end





