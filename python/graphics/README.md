# Python OpenGL

[Python-Opengl-Book](https://www.labri.fr/perso/nrougier/python-opengl/)
[Khronos](https://www.khronos.org/)

## `glfw`

```python
glfw.init()
    # glfw session initialization
glfw.terminate()
    # terminate the glfw session
window = glfw.create_window(width, height, "window title", None, None)
    # Create a glfw window
glfw.set_window_pos(window_object, xFromTopLeft, yFromTopLeft)
    # Set window location from top left position
glfw.make_context_current(window)
while not glfw.window_should_close(window)
    glfw.poll_events()  # Will poll all the events from the keyboard and mouse

    glfw.swap_buffers()
        # glfw has two buffers, One the user sees and the other in which OpenGL draws stuffs
        #
```

## `OpenGL.GL`

```python
from OpenGL.GL import *

# glClearColor — specify clear values for the color buffers
glClearColor(red, green, blue, alpha) # :: void

# glClear — clear buffers to preset values
# glClear takes a single argument that is the bitwise OR of several values indicating which buffer is to be cleared.
glClear(GLbitfield mask) # :: void
    # GL_COLOR_BUFFER_BIT   Indicates the buffers currently enabled for color writing.


```
