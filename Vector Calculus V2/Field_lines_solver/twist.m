function [u_new,v_new] = twist(u_old,v_old,dir_in,dir_out)
%TWIST Summary of this function goes here
% direction:
%   1 = -x 
%   2 = +x 
%   3 = -y 
%   4 = +y 
%   5 = -z 
%   6 = +z 
%   7 = center

% 2D axes:
%   1 = -u 
%   2 = +u 
%   3 = -v 
%   4 = +v 
%   5 = through
%   6 = center

    u_new = u_old; 
    v_new = v_old;
    
    if ((dir_in == 7) || (dir_out == 7))
        return;
    end

    if (opposite3(dir_in) == dir_out)
        return;
    end

    if (dir_in == 1)
        if (dir_out == 3)
            u_new = u_old; 
            v_new = v_old;
            return;
        elseif (dir_out == 4)
            u_new = 1 - u_old; 
            v_new = v_old;
            return;
        elseif (dir_out == 5)
            u_new = v_old; 
            v_new = u_old; 
            return;
        elseif (dir_out == 6)
            u_new = 1 - v_old; 
            v_new = u_old;
            return;
        end
    elseif (dir_in == 2)
        if (dir_out == 3)
            u_new = 1 - u_old; 
            v_new = v_old;
            return;
        elseif (dir_out == 4)
            u_new = u_old; 
            v_new = v_old;
            return;
        elseif (dir_out == 5)
            u_new = 1 - v_old; 
            v_new = u_old; 
            return;
        elseif (dir_out == 6)
            u_new = v_old; 
            v_new = u_old;
            return;
        end
    elseif (dir_in == 3)
        if (dir_out == 1)
            u_new = u_old;
            v_new = v_old;
            return;
        elseif (dir_out == 2)
            u_new = 1 - u_old;
            v_new = v_old;
            return;
        elseif (dir_out == 5)
            u_new = u_old;
            v_new = v_old;
            return;
        elseif (dir_out == 6) 
            u_new = u_old; 
            v_new = 1 - v_old;
            return;
        end
    elseif (dir_in == 4)
        if (dir_out == 1)
            u_new = 1 - u_old;
            v_new = v_old;
            return;
        elseif (dir_out == 2)
            u_new = u_old;
            v_new = v_old;
            return;
        elseif (dir_out == 5)
            u_new = u_old;
            v_new = 1 - v_old;
            return;
        elseif (dir_out == 6) 
            u_new = u_old; 
            v_new = v_old;
            return;
        end
    elseif (dir_in == 5)
        if (dir_out == 1)
            u_new = v_old;
            v_new = u_old;
            return;
        elseif (dir_out == 2)
            u_new = v_old;
            v_new = 1 - u_old;
            return;
        elseif (dir_out == 3)
            u_new = u_old;
            v_new = v_old;
            return;
        elseif (dir_out == 4)
            u_new = u_old;
            v_new = 1 - v_old;
            return;
        end
    elseif (dir_in == 6)
        if (dir_out == 1)
            u_new = v_old;
            v_new = 1 - u_old;
            return;
        elseif (dir_out == 2)
            u_new = v_old;
            v_new = u_old;
            return;
        elseif (dir_out == 3)
            u_new = u_old;
            v_new = 1 - v_old;
            return;
        elseif (dir_out == 4)
            u_new = u_old;
            v_new = v_old;
            return;
        end
    end
end



