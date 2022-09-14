% Isnan Firmansyah

s = tf('s');

Kp= 1;
Ti = 3;

% Ki = Kp/Ti;
Ki = 0;

T =1; 
num = 1;
den = [T T/16 1];    
sys = tf(num, den) % system

sys_c = tf([Ki Kp], [1 0]) % Kp & Ki
% sys_c = tf([Kp]) % Kp only

complete = feedback(sys*sys_c, 1)

step(complete)
% impulse(complete)
% step(complete/s) %ramp response

stepinfo(complete)
% xlim([0 500]) 
% ylim([-2 2])


% 1. P: 1
% 2. I : (1, 3, 5, 7, 9)
% Simulate by using mentioned input
% 1. Step
% 2. Ramp
% 3. Impulse
% And analyze the response based on :
% 1. Rise time
% 2. Settling time
% 3. Overshoot
% 4. Steady-state Error
