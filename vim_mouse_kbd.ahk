#InstallKeybdHook

; Mouse move source by 4strid
; https://github.com/4strid/vim_mouse_2.ahk
global FORCE := 8
global RESISTANCE := 0.982
global VELOCITY_X := 0
global VELOCITY_Y := 0
global POP_UP := False

StartMouseHook()

Accelerate(velocity, pos, neg) {
    If (pos == 0 && neg == 0) {
        Return 0
    }

    Else If (pos + neg == 0) {
        Return velocity * 0.666
    }

    Else {
        Return velocity * RESISTANCE + FORCE * (pos + neg)
    }
}

MoveCursor() {
    LEFT := 0
    DOWN := 0
    UP := 0
    RIGHT := 0

    UP := UP - GetKeyState("w", "P")
    DOWN := DOWN + GetKeyState("s", "P")
    LEFT := LEFT - GetKeyState("a", "P")
    RIGHT := RIGHT + GetKeyState("d", "P")

    If (GetKeyState("Tab", "P")) {
        FORCE := 1
    } Else If (GetKeyState("Alt", "P")) {
        FORCE := 30
    } Else {
        FORCE := 8
    }

    VELOCITY_X := Accelerate(VELOCITY_X, LEFT, RIGHT)
    VELOCITY_Y := Accelerate(VELOCITY_Y, UP, DOWN)

    If (GetKeyState("CapsLock", "P")) {
        MouseMove, %VELOCITY_X%, %VELOCITY_Y%, 0, R
    }
}

StartMouseHook() {
    msg := "Quick Ctrl by Max"
    ShowModePopup(msg)
    SetTimer, MoveCursor, 16
}

ShowModePopup(msg) {
    ClosePopup()
    center := MonitorLeftEdge() + (A_ScreenWidth // 2)
    popx := center - 200
    popy := (A_ScreenHeight // 2) - 28
    Progress, b x%popx% y%popy% zh0 w400 h56 fm24,, %msg%,,SimSun
    SetTimer, ClosePopup, -1600
    POP_UP := true
}

ClosePopup() {
    Progress, Off
    POP_UP := false
}

JustMiddle() {
    CoordMode, Mouse, Screen
    MouseMove, (A_ScreenWidth // 2), (A_ScreenHeight // 2)
}
MonitorLeftEdge() {
    mx := 0
    CoordMode, Mouse, Screen
    MouseGetPos, mx
    monitor := (mx // A_ScreenWidth)

    Return monitor * A_ScreenWidth
}



#if (GetKeyState("CapsLock", "P"))
Tab::
w::
a::
s::
d::
!w::
!a::
!s::
!d::
Return
c::
!c::
JustMiddle()
Return
q::
!q::
Click, Down
Return
e::
!e::
Click, Right, Down
Return
r::
!r::
Click, Middle, Down
Return
q Up::
!q Up::
Click, Up
Return
e Up::
!e Up::
Click, Right, Up
Return
r Up::
!r Up::
Click, Middle, Up
Return
n::
!n::
Click, X2
Return
b::
!b::
Click, X1
Return
h::Left
j::Down
k::Up
l::Right
u::PgDn
i::PgUp
y::Home
o::End
!h::
!j::
!k::
!l::
Return
!h Up::
Send {WheelLeft}
Send {WheelLeft}
Send {WheelLeft}
Return
!j Up::
Send {WheelDown}
Send {WheelDown}
Send {WheelDown}
Return
!k Up::
Send {WheelUp}
Send {WheelUp}
Send {WheelUp}
Return
!l Up::
Send {WheelRight}
Send {WheelRight}
Send {WheelRight}
Return
#If (POP_UP)
Escape:: ClosePopup()
Return
#If GetKeyState("CapsLock", "P") && GetKeyState("Tab", "P")

#If



CapsLock::
+CapsLock:: ; Shift
!CapsLock:: ; Alt
^CapsLock:: ; Ctrl
#CapsLock:: ; Win
^!CapsLock:: ; Ctrl + Alt
^!#CapsLock:: ; Ctrl + Alt + Win
Return
