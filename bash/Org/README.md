# Command wise note

## ```ps```

```bash
ps          # shows all the process of current session of the user
ps aux      # shows processes of other users and other programs(regardless of session)
```

## ```top```

```bash
top         # Shows all the running processes
```

## ```kill```

```bash
# SIGTERM - Kill the process, but allow it to do some cleanup tasks beforehand
# SIGKILL - Kill the process - doesn't do any cleanup after the fact
# SIGSTOP - Stop/suspend a process

kill PID    # kills the process specified with PID
```

## ```systemctl```

```bash
systemctl [option] [service]
#[options]:
# start: starts specified service 
# stop: stops specified service
# enable: starts specified service at boot
# disable: stops specified service at boot
```
