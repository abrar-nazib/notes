# Opencv From Udemy

## Anaconda

- `conda env create -f configfile.yml` creates an virtual environment from .yml file.
- `conda activate python-cvcourse` for activating environment
- `conda info --envs` shows information about the environment
- `conda deactivate` to deactivate environment.

## Jupyterlab

- `jupyter-lab` for starting jupyter lab in browser
- `shift+enter` to execute code in jupyter lab.

## Numpy

- [numpy docs](https://numpy.org/doc/stable/user/quickstart.html)

**Numpy Arrays:**

```python
import numpy as np

pylist = [1, 2, 3, 4]
type(pylist) # returns list
nparray = np.array(pylist)
newArray = nparray.copy()   # Creating a copy of npArray
type(nparray)   # returns numpy.ndarray
```

```python
np.arange(0, 5) # 0=>starting point, 5=>ending point(not includes 5)
    # array([0, 1, 2, 3, 4])
np.arange(0, 10, 2) # 2=> step size
    # array([0, 2, 4, 6, 8])

np.zeros(shape=(rows, columns))     # creates multidimentional array full of zeros (float type by default)
np.zeros(shape=(rows, columns), dtype=np.int16) # for specified data typed array

np.ones(shape=(rows, columns))
    # same as np zeros
```

```python
np.random.seed(101) # Provide a seed for the numpy random array
arr =  np.random.randint(lowestRange, HighestRange, numberOfElements)
    # randint -> random integer
arr.max() # returns the maximum value present in an array
arr.min()

arr.argmax() # returns the index of the maximum value in the array
arr.argmin()

meanValue = arr.mean()  # calculates the average value of the array elements
arrShape = arr.shape # returns the shape of the array
reshapedArray = arr.reshape((row, column)) # returns the reshaped array
```

```python
mat = [[    ],
       [    ],
       [    ],
       ]
# here mat is multi dimentional array

# To access an element of the array,
mat[row, column]
mat[row][column]
```

**Slicing:**

```python
arr[:, 1]   # Shows all the elements in column 1 -> I want elements of every row && column == 1
arr[1, :]  # shows all elements in row 1 -> I want elemnts of every column && row == 1
arr[0:5, 0:5] = 0 # makes all values in this range = 0
```

## Images and numpy

![Image](assets/image.png)

- Cannot directly use numpy on images. Need PIL (Python Imaging Library) for working with images

**matplotlib pyplot:**

- matplotlib is the library that will Plot out and display image in the notebook

```python
import matplotlib.pyplot as plt
```

**PIL:**

```python
import PIL
```

- Opening Images with PIL that numpy can understand

```python
pic = PIL.Image.open("imagepath") # Opens the image in a way numpy can understand

pic_arr = np.asarray(pic)   # Converting opened pic to numpy array which numpy can handle

pic.show()  # Shows the image in image viewer

plt.imshow(pic_arr) # for showing numpy array as image
plt.show()  # This line is also needed

plt.imshow(pic_arr, cmap='gray')    # For showing image in gray colormap
```

## OpenCV and Images


### **Read and Write Image:**

```python
import cv2  # to import opencv

img = cv2.imread("path/to/img.ext")

imgRGB = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)

cv2.imwrite("image_name.ext", imgFile) # Saves the image as a file. Need to convert in RGB before saving
```

```python
imgGrey = cv2.imread("path/to/image", cv2.IMREAD_GRAYSCALE)
```

**Resize Image:**

```python
imgResized = cv2.resize(img, (width, height))

width_ratio = 0.5
height_ratio = 0.5
imgResizedRatio = cv2.resize(img, (0, 0), img, width_ratio, height_ratio)
```

**Rotating and Flipping Image:**

```python
imgflip_x = cv2.flip(img, 0)    # Flip with respect to x axis

imgflip_y = cv2.flip(img, 1)    # Flip with respect to y axis

imgflip_xy cv2.flip(img, -1)    # Flips with respect to both axes
```

**Showing Image Output:**

```python

cv2.imshow("window_name", img)

while True:
    # If we've waited atleast 1ms and Esc key was placed
    if cv2.waitKey(1) & 0xFF == 27: # ord('q') will also do the job
        break
cv2.destroyAllWindows()
```

## Drawing Shapes using opencv

**Rectangle:**

```python
cv2.rectangle(img, pt1=(x, y), pt2=(x, y), color=(r, g, b), thickness=10) # pt1 = top left, pt2 = top right
    # thickness=-1 for filled in rectangle
```

**Circle:**

```python
cv2.circle(img, center=(x, y), color=(), radius=100, thickness=10)
    # thickness=-1 
```

**Line:**

```python
cv2.line(img, pt1=(x, y), pt2=(x, y), color=(r, g, b), thickness=10)
```