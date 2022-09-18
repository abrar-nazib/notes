# Notes on opencv

## Getting started

```python

import cv2  # Importing opencv module
```

## Reading Image/Video/Webcam

**Capturing Images:**

```python
image = cv2.imread("image/path")    # Import image

cv2.imshow("windowName", image) # Show image

cv2.waitKey(delay)  # if delay is set to zero, the window will wait for infinity
                    # if delay is set to any number, the window will wait for that much miliseconds
```

**Capturing Video:**

```python
cap = cv2.VideoCapture("path/to/video")
while True:
    success, img = cap.read()   # will read the frame if the video import is successful
    cv2.imshow("windowName", img)   # will show the image
    if cv2.waitKey & 0xFF == ord('q')"
        break   # stop executing if button 'q' is pressed
```

**Using Webcam:**

```python
cap = cv2.VideoCapture(cameraId)
    # if cameraId is 0, it selects the default webcam, If more are connected, it goes with 1, 2, 3,....
cap.set(3, width)   # 3 points to width
cap.set(4, height)  # 4 points to height
cap.set(10, brightness) # 5 points to brightness
```

## Basic Functions

**Creating Gray Image:**

```python
imGray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)  # converts image into gray {grayscaling}
    # cvtColor converts colors into different color spaces
```

**Blurring Image:**

```python
imgBlur = cv2.GaussianBlur(img, (7, 7), 0) # Second parameter is Karnel size. It can be any odd number pair
```

**Detecting Edges:**

```python
imgCanny = cv2.Canny(img, 150, 200)
```

**Image Dialation and Erotion:**

```python
kernel = np.ones((5, 5), np.uint8)

imgDialation = cv2.dialate(imgCanny, kernel, iterations=N)  # N is the number of iterations to take
imgEroded = cv2.erode(imgDialation, kernel, iterations=N)
```

## Cropping Images

**Getting information of an imgage:**

```python
img.size #  returns a tuple of the number of rows(HEIGHT of the photo), columns(WIDTH of the photo), and channels (if the image is color)
```

**Resizing Image:**

```python
resizedImage = cv2.resize(img, (width, height))
```

**Cropping Image:**

```python
imgCropped = img[0:height][0:width] # Images are nothing but arrays
```

## Shapes and Texts

**Lines:**

```python
cv2.line(img, (x1, y1), (x2, y2), (B, G, R), thickness)
```

**Rectangles:**

```python
cv2.rectangle(img, (x1, y1), (x2, y2), (B, G, R), thickness) # Here (x2, y2) is the point across the diagonal of (x1, y1)
cv2.rectangle(img, (x1, y1), (x2, y2), (B, G, R), cv2.FILLED) # Here cv2.FILLED makes the rectangle filled with specifided color
```

**Circle:**

```python
cv2.circle(img, (centreX1, centreX2), radius, (B, G, R), thickness) #cv2.FILLED for filling the circle with color
```

**Text:**

```python
cv2.putText(img, "TEXT", (x1, y1), cv2.FONT_FONTNAME, scale, (B, G, R), thickness)
```

## Warp Perspective

```python

src = np.float32([[111, 219], [287, 188], [154, 482], [352, 440]])  # points from source image to transform
dest = np.float32([[0, 0], [width, 0], [0, height], [width, height]])   # destination image points

transform_mat = cv2.getPerspectiveTransform(src, dst)   # Transform matrix generation
dst = cv.warpPerspective(img, transform_mat, (width, height) )  # transforming the image

# src: input image
# M: Transformation matrix
# dsize: size of the output image
# flags: interpolation method to be used
# src: coordinates in the source image
# dst: coordinates in the output image
```

## Not understood things

```python
import numpy as np

kernel = np.ones((5, 5), np.uint8)
    # WTF is kernel?
cv2.Canny()
cv2.dilate()
cv2.erode()
```

```python
np.zeros((rows, columns))
```
