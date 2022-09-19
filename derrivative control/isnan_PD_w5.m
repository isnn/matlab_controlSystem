% Isnan Firmansyah

s = tf('s');

Kp= 1;
Ki = 0;
Kd = [1, 3, 5, 7, 9]

T =1; 
num = 1;
den = [T T/16 1];    
sys = tf(num, den) % system

% find tf for every Kd value

for i = 1:5;
    sys_c(i) = tf([Kd(i) Kp Ki], [1 0]);
    complete(i) = feedback(sys*sys_c(i), 1)
end

sys_c(1)
sys_c(2)
sys_c(3)


figure(1)
hold all
step(complete(1))
step(complete(2))
step(complete(3))
step(complete(4))
step(complete(5))
title('Step Response All')
legend('sys-i1', 'sys-i3', 'sys-i5', 'sys-i7', 'sys-i9')

figure(2)
hold all
impulse(complete(1))
impulse(complete(2))
impulse(complete(3))
impulse(complete(4))
impulse(complete(5))
title('Impulse Response All')
legend('sys-i1', 'sys-i3', 'sys-i5', 'sys-i7', 'sys-i9')

figure(3)
hold all
step(complete(1)/s)
step(complete(2)/s)
step(complete(3)/s)
step(complete(4)/s)
step(complete(5)/s)
title('Ramp Response All')
legend('sys-i1', 'sys-i3', 'sys-i5', 'sys-i7', 'sys-i9')
xlim([0 50]) 
ylim([0 50])

%coba buat mode lsim()


figure(9)
sys_raw = tf([Kp]) % Kp only
complete_raw = feedback(sys*sys_raw, 1)
step(complete_raw)

% impulse(complete)
% step(complete/s) %ramp response

for i = 1:5;
    stepinfo(complete(i))
end

% xlim([0 500]) 
% ylim([-2 2])
