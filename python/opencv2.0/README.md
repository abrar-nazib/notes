# opencv backup from nafis's computer

## Functions

**`cvtcolor`**

- Used for converting image from one color space to another color space.

```python
cv2.cvtColor(srcImage, ConversionCode ,[destImage]) # the destImage is optional

# Some conversioncodes
cv2.COLOR_BGR2GRAY #  For converting rgb color to gray colored image

```

**`GaussianBlur`**

```python
kernel = (5, 5) 
    # kernel size for pixelating
    # kernel is the value of the square pixel which is taken around the pixel of interest to calculated a waighted average of the pixel
cv2.GaussianBlur(srcImage, kernel, sigmaX)  
    # SigmaX is the variations allowed around the mean value
```

**`Canny`**

- Canny is an edge detection algorithm

```python
cv2.Canny(srcImage, T_lower, T_upper)
    # Any line with more than intensity gradient of t_upper 
```
