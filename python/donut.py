import math
import os
import time

def main():
    A = 0.0
    B = 0.0
    
    # Clears the terminal screen before starting
    os.system('cls' if os.name == 'nt' else 'clear')

    while True:
        # Initialize the 1D screen buffer and depth buffer (z-buffer)
        b = [' '] * 1760
        z = [0.0] * 1760

        # Theta loops from 0 to 2pi (the cross-sectional circle of the donut)
        for j in range(0, 628, 7): 
            # Phi loops from 0 to 2pi (revolving the circle around the center)
            for i in range(0, 628, 2): 
                
                # Convert loop indices to approximate radians
                phi = i / 100.0
                theta = j / 100.0

                sin_phi = math.sin(phi)
                cos_phi = math.cos(phi)
                sin_theta = math.sin(theta)
                cos_theta = math.cos(theta)
                
                sin_A = math.sin(A)
                cos_A = math.cos(A)
                sin_B = math.sin(B)
                cos_B = math.cos(B)

                # The 3D coordinates of the donut's surface before rotation
                circle_x = cos_theta + 2
                circle_y = sin_theta

                # Apply 3D rotation matrices and perspective projection
                ooz = 1 / (sin_phi * circle_x * sin_A + circle_y * cos_A + 5)
                t = sin_phi * circle_x * cos_A - circle_y * sin_A

                # Calculate 2D screen coordinates (x, y)
                x = int(40 + 30 * ooz * (cos_phi * circle_x * cos_B - t * sin_B))
                y = int(12 + 15 * ooz * (cos_phi * circle_x * sin_B + t * cos_B))
                o = x + 80 * y

                # Calculate surface luminance (lighting index)
                N = int(8 * ((circle_y * sin_A - sin_phi * cos_theta * cos_A) * cos_B - sin_phi * cos_theta * sin_A - circle_y * cos_A - cos_phi * cos_theta * sin_B))

                # If coordinates fall inside the boundaries of our terminal grid
                if 0 <= y < 22 and 0 <= x < 80:
                    if ooz > z[o]:
                        z[o] = ooz
                        # Choose an ASCII character based on the brightness level
                        b[o] = ".,-~:;=!*#$@"[N if N > 0 else 0]

        # Reset terminal cursor position instead of completely clearing the screen
        # This prevents flickering on most operating systems
        print('\x1b[H', end='')
        
        # Render the frame line by line
        for k in range(1760):
            print(b[k], end='\n' if k % 80 == 79 else '')

        A += 0.04
        B += 0.02
        time.sleep(0.01)

if __name__ == "__main__":
    main()
