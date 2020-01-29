# Introduction to Computer Graphics

## Introduction

### 1.1 Painting and Drawing

An image that is presented on the computer screen is made up of ***pixels***.

Most screens these days use 24-bit color, where a color can be specified by three 8-bit numbers,
giving the levels of red, green, and blue in the color.

Other formats are possible, such as ***[grayscale][0]***,
where each pixel is some shade of gray and the pixel color is given by one number that specifies
the level of gray on a black-to-white scale.

Early computer screens used ***[indexed color][1]***,
where only a small set of colors, usually 16 or 256, could be displayed.

In any case, the color values for all the pixels on the screen are stored in a large block of
memory known as a ***[frame buffer][2]***.

A computer screen used in this way is the basic model of ***[raster graphics][3]***.

<!-- Links -->
[0]: https://en.wikipedia.org/wiki/Grayscale
[1]: https://en.wikipedia.org/wiki/Indexed_color
[2]: https://en.wikipedia.org/wiki/Framebuffer
[3]: https://en.wikipedia.org/wiki/Raster_graphics
