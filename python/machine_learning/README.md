# Machine Learning and AI notes

## Matplotlib

### Installation

- `pip install matplotlib` installs the library.
- `from matplotlib import pyplot as plt` to import the file

### Basic plotting

```python
x_array = [elem, elem, elem]
y_array = [elem, elem, elem]

plt.plot(x_array, y_array)  # crates the plot
plt.show() # shows the plot in the screen
```

- `plt.xlabel('Label For X Axis')` Shows label for x axis
- `plt.ylabel('Label For Y Axis')` Shows label for y axis
- `plt.title("Plot Title")` Shows title over the plot
- labels and titles are to be set after `plt.plot()` function is called
- Can plot multiple graph with same x/y axis value.

### Legends

```python
plt.legend(['Legend for first plot', 'Legend for second plot', ...])
    # The legends will be marked according to the first come first serve strategy
```

But There is a way for doing it in a better way

```python
plt.plog(x_array, y_array, label="Label For the plot")

```

### Line Styling

[Details of Format Strings](https://matplotlib.org/stable/api/_as_gen/matplotlib.pyplot.plot.html)

```python
# Needs to be added as third parameter in the plt() function
# fmt = '[marker][line][color]' but the string has to be backwards, like [color][line][marker]
# '-' for solid lines, '--' for dashed line
# 'b' for blue, 'k' for black line, 'r' for red line
# '.' for dot marker, 'o' for little big dotted marker.
```

But It can be done in more readable way

```python
plt.plot(x_array, y_array, color="colorCharacter", lineStyle="lineStyleChar", marker="Marker")
# Hex values can be used in colors as well
```

**Line Thickness:**

```python
plt.plot(x_array, y_array, linewidth=2) # The default is 1
```

**Grid:**

```python
plt.grid(True) # shows grids in the plot
```

### Default Styles

```python
print(plt.style.available)  # Shows the available styles

plt.style.use("style-name") # Have to put this in the beginning part
plt.xkcd()  # uses nice looking UI like comic book

plt.tight_layout() # Needed for small screens
```

### Saving plot file

```python
plt.savefig('plot.png') # Saves the plot as png file, Needed to have at the end
```
