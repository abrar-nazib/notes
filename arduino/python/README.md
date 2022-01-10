# Python for Arduino

## Serial Communication

### ```pyserial```

[Link to pyserial doc](https://pyserial.readthedocs.io/en/latest/)

```python
import serial # Import pyserial module


commPort = '/dev/comportName'   # Selecting the port where the arduino is connected
ser = serial.Serial(commPort, baudrate = 9600, timeout = 1) # Setting up the serial

ser.write(b'X') # write to the serial. Must send as binary data. b'X' is send as binary data
```

## GUI

### ```tkinter```

[Link to tkinter doc](https://docs.python.org/3/library/tkinter.html)

```python
from tkinter import *
import tkinter as tk    # Aliasing the import


root = TK() # Initialize window
root.title('Blink GUI')

# Button Element Handling
btn = tk.Button(root, text="Text To Show On Button Element", command = functionToExecuteWhenPressed)
    # putting root there 
btn.grid(row = x, column = y)   # Set button location on GUI

root.geometry("100x100")    # Window size
root.mainloop()     # Loop the main window 
```