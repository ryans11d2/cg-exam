# cg-exam
 
Shaders Used:

Vertex Colouring
-Used on track to make it rainbow
Set fragment colour based on the vertex colour, which is based on the vertex position, giving it a smooth gradient look.
![image](https://github.com/user-attachments/assets/71fe766e-6a8a-44d7-956e-b1a981fb8ae9)
![image](https://github.com/user-attachments/assets/639029f7-f4d7-4e46-b9b3-f84025cc333a)
![image](https://github.com/user-attachments/assets/f2c26fb1-ab15-4ef1-8023-5d9970c6c795)

Outline
-Used on coins to make them stand out
Do a seperate pass where a second version of the object is rendered with no zwrite. It will be bigger but draw behind, appearing to create an outline.
![image](https://github.com/user-attachments/assets/42d65aef-2ee0-464b-bcd5-1876f88ce3cc)


Texture Scroll
-Used on car to make it bounce
-Used on coins to make them appear to spin
Offset the uv pixel referenced by each pixel using the time, to give the appearance that the object is moving when it is not
![image](https://github.com/user-attachments/assets/d964c15f-0ca1-49bb-a8f3-2d7b8d6b738b)


Alpha
-Used on Car
Uses the aplpha component of the shader to add transparent pixels to the texture that don't draw
![image](https://github.com/user-attachments/assets/b9c6b1e0-0baa-4216-b422-d8124e6387ff)
![image](https://github.com/user-attachments/assets/778158e9-6c1d-4e72-a8ba-5e9bfabc92a7)


Shaders Made
Car, uses alpha and scroll texture. Scroll is modified to bounce up and down. External script uses texture offset to give turning animation.
Coin, uses outline and scroll texture. Outline modified to multiply extrusion so outline faces are always conencted.
Track, uses vertex shading for rainbow look. Uses a sin function to make black lines across the texture basid on the vertex coordinates to give tiled look similar to game.

