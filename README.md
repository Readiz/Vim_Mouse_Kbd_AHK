# Vim_Mouse_Kbd_AHK with Capslock Key

* Mouse Move Source by 4strid (https://github.com/4strid/vim_mouse_2.ahk)

As many people knows, `Capslock` Key is not used many times for normal people.

So, I made a simple vim-styled Mouse / Keyboard mapper with `Capslock` KeyDown.

Below is the key guide.

## Move Mouse 

```
Capslock + W/A/S/D : Move Mouse by normal speed
Capslock + Tab + W/A/S/D : Move Mouse by slow speed
Capslock + Alt + W/A/S/D : Move Mouse by fast speed
Capslock + C : Move Mouse to Center
Capslock + Q : Left Click (Hold for Mouse Down)
Capslock + E : Right Click (Hold for Mouse Down)
Capslock + R : Middle Click (Hold for Mouse Down)
Capslock + B : Back Click
Capslock + N : Forward Click
```

## Keyboard Arrow + ETC

```
Capslock + H/J/K/L : Move Cursor (Left / Down / Up / Right)
Capslock + Alt + H/J/K/L : Mouse Wheel * 3 (Left / Down / Up / Right)
Capslock + U : PgDn
Capslock + I : PgUp
Capslock + Y : Home
Capslock + O : End
```

And, Capslock key is not working anymore with below lines:
```
CapsLock::
+CapsLock:: ; Shift
!CapsLock:: ; Alt
^CapsLock:: ; Ctrl
#CapsLock:: ; Win
^!CapsLock:: ; Ctrl + Alt
^!#CapsLock:: ; Ctrl + Alt + Win
Return
```

If you don't want to disable `Capslock` Key, then please remove those lines.


