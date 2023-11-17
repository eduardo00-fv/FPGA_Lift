# FPGA_Lift
The system includes inputs from external floor buttons, internal elevator buttons, and sensors, along with a set of sophisticated logic rules to prioritize requests

## Inputs

External Floor Buttons
Floor 1: Up button only.
Floors 2, 3, and 4: Up and Down buttons with corresponding request LEDs.
Floor 5: Down button only.
Internal Elevator Buttons
Open Door Button
Close Door Button
Floor Buttons (1 to 5): Each button has an associated LED. Double pressing a floor button deselects the floor.

## Outputs

Floor Indicators: 7-segment displays showing the current floor.
Direction Animation: A visual animation on the display indicating upward or downward movement.

## Logic of Priority

Elevator moves to the requested floor and turns off the request light upon arrival.
If an upward request is made while the elevator is going up, it's serviced immediately. For downward requests, they are queued and addressed after the current upward movement completes.
Similar priority logic applies when the elevator is moving downward.

## Wating Logic

Elevator waits for ten seconds at each floor to allow passengers to board.
LED indicates door status: 2 seconds of blinking while opening, 6 seconds lit while fully open, and 2 seconds of blinking while closing.
Pressing the "Open Door" button during this sequence resets the 10-second timer, with the LED staying steady as the door is open.
Pressing the "Close Door" button skips to the final 2 seconds of the door closing, and the elevator continues its journey.
Passengers can change their selected floor during the waiting sequence, but the elevator processes the new request only after the doors are fully closed.


## Contribuidores

- [Ángel Eduardo Fallas Valverde](eduardo00-fv): .
- [Nombre del Colaborador 2](enlace al perfil de GitHub):
  - Developed the Door FSM.
  - Contributed to the implementation and enhancement of the Elevator FSM.
  - Created animation modules.
  - Implemented the debounce mechanism.
- ...