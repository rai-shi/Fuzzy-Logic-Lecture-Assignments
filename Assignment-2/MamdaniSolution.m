% solar radiation space and set
% X = [50,60,70,80,90,100,110,120,130,140,150,160,170,180,190,200];
% A = [50,50,100];
% B = [50,100,150];
% C = [100,150,200];
% D = [150,200,200];

% Temperature space and sets
% X = [-20,-10,0,10,20,30,40];
% A = [-20,-20,0];
% B = [-20,0,20];
% C = [0,20,40];
% D = [20,40,40];

% Power space and sets
X = [0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1];
A = [0,0,0.3];
B = [0,0.3,0.6];
C = [0.3,0.6,0.9];
D = [0.6,1,1];

draw_triangles(X, A, B, C,D);

function draw_triangles(X, A, B, C, D)
    % X: Space
    % U : Set Lists
    U = [A;B;C;D];
    
    figure;
    hold on;
    plot(X, zeros(size(X)), 'k--'); % X axis
    colors = {'r', 'g', 'b', 'y'};

    for i = 1:length(U)
        x = zeros(1,3);
        y = zeros(1,3); % Y vector to 0
        for j = 1:3
            x(j) = U(i,j);
        end
        if i == 1 % Right boundary triangle               
            y = [1,1,0];
        elseif i == length(U)              
            y = [0,1,1]; % Left boundary triangle 
        else   
            y = [0,1,0]; % Middle triangles
        end

        plot(x, y, colors{i}); % triangle i
    end
    % xlabel('Solar Radiation');
    % xlabel('Temperature');
    xlabel('Power');

    ylabel('Membership Degree');
    
    % title('Solar Radiation Fuzzy Sets');
    % title('Temperature Fuzzy Sets');
    title('Power Fuzzy Sets');
    
    axis([min(X)-1 max(X)+1 -1 5]);
    grid on;
    hold off;
end
