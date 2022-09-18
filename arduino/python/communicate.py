#! /usr/bin/python3

import serial
from tkinter import *
import tkinter as tk

commPort = '/dev/ttyACM0'   # Selecting port where the arduino is connected
ser = serial.Serial(commPort, baudrate=9600, timeout=1)


def turnOnLED():
    ser.write(b'o')  # Write in form of binay bytes


def turnOffLED():
    ser.write(b'x')  # Write in form of binary bytes

# Creating a tkinter window


root = Tk()  # Initialize window
root.title('Blink GUI')

btn_On = tk.Button(root, text='Turn On', command=turnOnLED)
btn_On.grid(row=0, column=0)

btn_Off = tk.Button(root, text="Turn Off", command=turnOffLED)
btn_Off.grid(row=0, column=1)

root.geometry("350x350")
root.mainloop()
