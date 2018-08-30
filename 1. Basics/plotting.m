% Plotting
x = -5:0.1:14;
y = 3*x + 6;
 
figure; hold on;
plot([-5,14],[0,0],'k--'); title('3*x + 6, x\in[-5,14]');
plot(x,y,'b-');
