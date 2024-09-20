% Projectile Motion
v0 = input('intial velocity (m/s)=');
a = input('angle of projectile(in degree)=');
h = input('time step (in second)=');
h2 = input('time step 2 (in second)=');
h3 = input('time step 3 (in second)=');
a = a*pi/180;
g = 9.8;
xmax = v0^2*sin(2*a)/g; % Range Formula
ymax = v0^2*sin(a)^2/(2*g); % Height Formula
td = 2*v0*sin(a)/g; % Time

x1 = 0;
y1 = 0;
v1 = v0*sin(a);
figure('color','white');
hold on
for t=0:h:td+h
    x_analytic = v0*t*cos(a); % Analytic Solution for x
    y_analytic = v0*t*sin(a)-(g*t^2)/2; % Analytic Solution for y
   
    plot(x_analytic,y_analytic, 'r*') % Plot Analytical Solution
    x1 = x1+(h*v0*cos(a)); % Euler Method for x
    y1 = y1+(h*v1); % Euler Method for y
    v1 = v1 - (h*g);

    if y1 < 0
        break;
    end
    xlim([0 1.1*xmax]) % Limit x-axis
    ylim([0 1.1*ymax]) % Limit y-axis
    title('projectile motion');
    xlabel('distance in meter');
    ylabel('height in meter');
    getframe;

end