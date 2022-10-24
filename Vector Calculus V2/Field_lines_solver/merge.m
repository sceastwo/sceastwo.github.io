function [w_new, u_new, v_new, separation_flag] = merge(w_old, u_old, v_old, dir, w_delta)
%MERGE Summary of this function goes here
%   (u_old,v_old) = the old % vector
%   (u_new,v_new) = the new % vector
% dir = 
%   1 = -u 
%   2 = +u 
%   3 = -v 
%   4 = +v 
%   5 = through
%   6 = center

    % default values: 
    w_new = w_old;
    u_new = u_old; 
    v_new = v_old; 
    separation_flag = 0;

    if (dir == 6)
        return;
    end

    % important intermediates:
    if (w_old >= 0)
        direction_sign = 1.0;
    else
        direction_sign = -1.0;
    end
    if (w_old * w_delta >= 0)
        merge_flag = 1;
    else
        merge_flag = -1;
    end
    mass_old = abs(w_old); 
    mass_delta = abs(w_delta);
    mass_total = mass_old + mass_delta;
    mass_difference = max(0, mass_old - mass_delta);
    mass_neg_u = mass_old * u_old; 
    mass_pos_u = mass_old * (1 - u_old);
    mass_neg_v = mass_old * v_old; 
    mass_pos_v = mass_old * (1 - v_old);

    if (merge_flag == 1)

        if ((dir == 1) || (dir == 2) || (dir == 5))
            if ((dir == 1) || (dir == 5))
                u_new = (mass_delta + mass_neg_u)/mass_total;
            else
                u_new = mass_neg_u/mass_total;
            end
        else
            if (dir == 3)
                v_new = (mass_delta + mass_neg_v)/mass_total;
            else
                v_new = mass_neg_v/mass_total;
            end
        end

    else

        if ((dir == 1) || (dir == 5))
            if (mass_neg_u <= mass_delta)
                u_new = mass_neg_u/mass_delta;
                separation_flag = 1;
            else
                u_new = (mass_neg_u - mass_delta)/mass_difference;
            end
        elseif (dir == 2) 
            if (mass_pos_u <= mass_delta)
                u_new = (mass_delta - mass_pos_u)/mass_delta;
                separation_flag = 1;
            else
                u_new = mass_neg_u/mass_difference;   
            end
        elseif (dir == 3)
            if (mass_neg_v <= mass_delta)
                v_new = mass_neg_v/mass_delta;
                separation_flag = 1;
            else
                v_new = (mass_neg_v - mass_delta)/mass_difference;
            end
        elseif (dir == 4) 
            if (mass_pos_v <= mass_delta)
                v_new = (mass_delta - mass_pos_v)/mass_delta;
                separation_flag = 1;
            else
                v_new = mass_neg_v/mass_difference;   
            end
        end
    end
    
    % Finally compute the new weight based on outcomes:
    if (separation_flag == 0)
        w_new = w_old + w_delta;
    else
        w_new = direction_sign * mass_delta;
    end


end






