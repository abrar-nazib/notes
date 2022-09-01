import numpy as np

mat = np.arange(0, 100).reshape(10, 10)
mat[3:6, 3:6] = 0
print(mat)
