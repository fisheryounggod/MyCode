
#%% 计算 Gamma(0.5)
import numpy as np

dt = 0.00001
z = 0.5
t0, t1 = dt, 1e3

t = np.arange(t0,t1,dt)
y = np.power(t, z-1) * np.power(np.e,-t)

print(sum(y*dt)**2)