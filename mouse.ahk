MouseUpKey1 := "NumpadUp"
MouseUpKey2 := "Numpad8"

MouseDownKey1 := "NumpadDown"
MouseDownKey2 := "Numpad2"

MouseLeftKey1 := "NumpadLeft"
MouseLeftKey2 := "Numpad4"

MouseRightKey1 := "NumpadRight"
MouseRightKey2 := "Numpad6"

MinSpeed := 5
MouseMoveDelay := 25
MaxSpeed := 80
Acceleration := 3

GlobalSpeed := MinSpeed


MouseMoveIfPressed(key1, key2, dx, dy) {
    if (GetKeyState(key1, "p") || GetKeyState(key2, "p")) {
        MouseMove dx, dy, 0, "R"
    }
}

MoveMouseIfNeeded(MouseSpeed) {
    global MouseUpKey1
    global MouseUpKey2
    global MouseDownKey1
    global MouseDownKey2
    global MouseLeftKey1
    global MouseLeftKey2
    global MouseRightKey1
    global MouseRightKey2

    MouseMoveIfPressed(MouseUpKey1, MouseUpKey2, 0, -MouseSpeed)
    MouseMoveIfPressed(MouseDownKey1, MouseDownKey2, 0, MouseSpeed)
    MouseMoveIfPressed(MouseRightKey1, MouseRightKey2, MouseSpeed, 0)
    MouseMoveIfPressed(MouseLeftKey1, MouseLeftKey2, -MouseSpeed, 0)
}

MouseMoveAction(pressedKey) {
    global MouseUpKey1
    global MouseUpKey2
    global MouseDownKey1
    global MouseDownKey2
    global MouseLeftKey1
    global MouseLeftKey2
    global MouseRightKey1
    global MouseRightKey2

    global MinSpeed
    global MaxSpeed
    global MouseMoveDelay
    global Acceleration

    global GlobalSpeed

    while (GetKeyState(pressedKey, "p")) {
        MoveMouseIfNeeded(GlobalSpeed)
        GlobalSpeed := Min(GlobalSpeed + Acceleration, MaxSpeed)
        sleep MouseMoveDelay
    }
    if (
        GetKeyState(MouseUpKey1, "p") = 0 &&
        GetKeyState(MouseUpKey2, "p") = 0 &&
        GetKeyState(MouseDownKey1, "p") = 0 &&
        GetKeyState(MouseDownKey2, "p") = 0 &&
        GetKeyState(MouseLeftKey1, "p") = 0 &&
        GetKeyState(MouseLeftKey2, "p") = 0 &&
        GetKeyState(MouseRightKey1, "p") = 0 &&
        GetKeyState(MouseRightKey2, "p") = 0
    ) {
        GlobalSpeed := MinSpeed
    }
}

Hotkey MouseUpKey1, MouseMoveAction
Hotkey MouseUpKey2, MouseMoveAction
Hotkey MouseRightKey1, MouseMoveAction
Hotkey MouseRightKey2, MouseMoveAction
Hotkey MouseLeftKey1, MouseMoveAction
Hotkey MouseLeftKey2, MouseMoveAction
Hotkey MouseDownKey1, MouseMoveAction
Hotkey MouseDownKey2, MouseMoveAction
