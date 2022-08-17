classdef labeled_dense_matrix < handle
    %LABELED_DENSE_MATRIX Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        row_names {iscell} = {};
        column_names {iscell} = {}; 
        the_matrix {ismatrix} = [];
    end
    
    methods
        function obj = labeled_dense_matrix(new_row_names, new_column_names, new_matrix)
            %LABELED_DENSE_MATRIX Construct an instance of this class
            %   Detailed explanation goes here
            obj.row_names = new_row_names; 
            obj.column_names = new_column_names; 
            obj.the_matrix = new_matrix; 
        end
        



        function the_string = print(obj)
            %print
            %

            the_string = "Row names: ";
            for i = 1:size(obj.row_names,2)
                the_string = strcat(the_string, string(obj.row_names{i})); 
                if (i < size(obj.row_names,2))
                    the_string = strcat(the_string, " , "); 
                else 
                    the_string = strcat(the_string, sprintf("\n\n"));
                end
            end

            the_string = strcat(the_string, "Column names: ");
            for i = 1:size(obj.column_names,2)
                the_string = strcat(the_string, string(obj.column_names{i})); 
                if (i < size(obj.column_names,2))
                    the_string = strcat(the_string, " , "); 
                else 
                    the_string = strcat(the_string, sprintf("\n\n"));
                end
            end

            for i = 1:size(obj.the_matrix,1)
                for j = 1:size(obj.the_matrix,2)
                    the_string = strcat(the_string, sprintf("%.2f", obj.the_matrix(i,j))); 
                    if (j < size(obj.the_matrix,2))
                        the_string = strcat(the_string, " , "); 
                    else 
                        the_string = strcat(the_string, sprintf("\n"));
                    end
                end
                if (i < size(obj.the_matrix,1))
                    the_string = strcat(the_string, sprintf("\n")); 
                else 
                    the_string = strcat(the_string, sprintf("\n\n"));
                end
            end
        end




        function set_entry(obj, query_row_name, query_column_name, new_entry)
            %set_entry 
            %   

            row_index = -1;
            for i = 1:size(obj.row_names,2)
                if (strcmp(obj.row_names{i},query_row_name))
                    row_index = i;
                    break;
                end
            end
            if (row_index == -1) 
                row_index = size(obj.row_names,2) + 1;
                obj.row_names = cat(2, obj.row_names, {query_row_name}); 
            end

            column_index = -1;
            for i = 1:size(obj.column_names,2)
                if (strcmp(obj.column_names{i},query_column_name))
                    column_index = i;
                    break;
                end
            end
            if (column_index == -1) 
                column_index = size(obj.column_names,2) + 1;
                obj.column_names = cat(2, obj.column_names, {query_column_name}); 
            end

            obj.the_matrix(row_index, column_index) = new_entry;
        end




        function existing_entry = get_entry(obj, query_row_name, query_column_name)
            %get_entry 
            %   

            row_index = -1;
            for i = 1:size(obj.row_names,2)
                if (strcmp(obj.row_names{i},query_row_name))
                    row_index = i;
                    break;
                end
            end
            if (row_index == -1) 
                row_index = size(obj.row_names,2) + 1;
                obj.row_names = cat(2, obj.row_names, {query_row_name}); 
            end

            column_index = -1;
            for i = 1:size(obj.column_names,2)
                if (strcmp(obj.column_names{i},query_column_name))
                    column_index = i;
                    break;
                end
            end
            if (column_index == -1) 
                column_index = size(obj.column_names,2) + 1;
                obj.column_names = cat(2, obj.column_names, {query_column_name}); 
            end

            existing_entry = obj.the_matrix(row_index, column_index);
        end
    end
end





