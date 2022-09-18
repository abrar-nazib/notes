# Notes on my learnings in godot

## Overview of the GUI

- **Main workspace area:** Where the 3D is shown.
- **Docks:** Panel in left, right, bottom.
- **Debugger:** In the bottom portion.

### **Mouse Movement:**

- Mouse wheel button -> orbit
- Shift+Wheel button -> drag.
- Right button -> look around.
- Right button -> fly through mode (Looks like first person shooter) {e for up, q for down}

## Basics of a scene

- **Rigidbody:** Physics Body whose position is determined through physics simulation in 3D space.
- **CollisionShape:** Node that represent collision shape data in 3D space.
- **MeshInstance:** Node that instances meshes into a scenario. Meshes are the skins.

## Programming Uncategorized Basics

Right click on any function and it'll take to the documentation of that function.\

### Variables

```GDscript
var variable_name = "variable_value" # String type variable
var variable_name = Vector3(x, y, z) # Ordered pair type variable(3D)
                                     # Vector3 is a constructor
var CONSTANTVARIABLE = "value"       # Constant variables are conventionally named in all capital form 

```

### Basic functions

**`void _ready()`**

```GDscript
func _ready():
    # do stuffs when the node is ready in the game
```

**`void print()`**

```GDscript
var stringVariable = "Godot"
print("Hello " + stringVariable) # Prints stuffs in godot console
```

**`void _physics_process(delta: float) virtual`**

```GDscript
func _physics_process():
    # Acts as a game loop. Any code put inside this function will be run in solid 60 fps.
```

## Keyboard Methods

```GDscript
Input.is_action_pressed("ui_left")  # returns boolean for left key is pressed
# "ui_right"
# "ui_up"
# "ui_down"
```

## KinematicBody Methods

```GDscript
move_and_slide(velocity)    # Used for moving a 3D object in 3D space. Velocity is a 3 dimentional vector.
lerp(from, to, change_in_percentange_decimal)
```
