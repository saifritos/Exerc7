function x = production(C,d)
n=size(C,2);
x=[]; 
check_C = 1;
check_d = 1;
check_sum = 1;
sum_C = sum(C);
I = eye(n);
for i=1:n
        for j=1:n
            if C(i,j)<0 
                disp('C contains negative element')
                check_C = 0;
            elseif d(j)<0
                disp('d contains negative element')
                check_d = 0;
            elseif sum_C(j)>=1
                disp('Column sum of C has elements >=1')
                check_sum = 0;
            end     
        end
end

if (check_C | check_d | check_sum) ~=1
    x = [];
    disp('x=[]')
    return;
else  
    x = inv(I - C)*d;
    for i=1:n
        if x(i)<0 
            disp('check the code!')
            x = [];
            return;
        end
    end
end

disp('the unique production vector is')
x 

for k=1:n
x0=d;
x_n = x0 + C*x.^(k-1);
xx = x - x_n;

if closetozeroroundoff(xx,1)==0
    x1=x_n;
    disp('the production vector calculated by recurrence relation is')
    x1
    fprintf('the number of iteration to match the output x is %i\n',k)
    return;
end
end


end
                    