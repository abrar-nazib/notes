import numpy as np
import matplotlib.pyplot as plt
from PIL import Image

pic = Image.open(
    "C:\\Users\\nazib\\notes\\python\\image_processing\\assets\\00-puppy.jpg")
# pic.show()
npPic = np.asarray(pic)

pic_red = npPic.copy()

pic_red[:, :, 1:4] = 0

# print(npPic.shape)
plt.imshow(pic_red)
plt.show()
