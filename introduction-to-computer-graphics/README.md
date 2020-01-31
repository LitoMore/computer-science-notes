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

Another way is to sepcify the basic geometric objects that it contains, shapes such as lines,
circles, triangles, and rectangles. This is the idea that defines ***[vector graphics][4]***:
Represent an image as a list of the geometric shapes that it contains.

To make things more interesting, the shapes can have ***attributes***, such as the thickness of a
line or the color that fills a rectangle.

Of course, not every image can be composed from simple geometric shapes.

A vector graphics display would store a ***display list*** of lines that should appear on the
screen.

Of course, if the display list became too long, the image would start to flicker because a line
would have a chance to visibly fade before its next turn to be redrawn.

The divide between raster graphics and vector graphics persists in several areas of computer
graphics. For example, it can be seen in a division between two categories of programs that can be
used to create image: ***painting programs*** and ***drawing programs***.

Two well-known graphics programs are *Adobe Photoshop* and *Adobe Illustrator*. *Photoshop* is in
the category of painting programs, while *Illustrator* is more of a drawing program. In the world
of free software, the GNU image-processing program, *Gimp*, is a good alternative to *Photoshop*,
while *Inkscape* is a reasonably capable free drawing program.

There are many ways to represent an image as data stored in a file.

Some popular graphics file formats include GIF, PNG, JPEG, and SVG. Most images used on the Web are
GIF, PNG, or JPEG. Modern web browsers also have support for SVG images.

GIF and PNG use ***[lossless data compression][5]***, which means that the original image can be
recovered prefectly from the compressed data.

JPEG uses a ***[lossy data compression][6]*** algorithm, which means that the image that is
recovered from a JPEG file is not exactly the same as the original image; some information has been
lost.

A digital image, no matter what its format, is specified using a ***[coordinate system][7]***.

### 1.2 Elements of 3D Graphics

When we turn to 3D graphics, we find that the most common approaches have more in common with
vector graphics than with raster graphics. That is, the content of an image is specified as a list
of geometric object. The technique is referred to as ***[geometric modeling][8]***.

The smallest building blocks that we have to work with, such as line segments and triangles, are
called ***[geometric primitives][9]***. Different graphics systems make different sets of primitive
avaiable, but in many cases only very basic shapes such as lines and triangles are considered
primitive.

Note that once a geometric model has been designed, it can be used as a component in more complex
models. This is referred to as ***[hierarchical modeling][10]***.

<!-- Links -->
[0]: https://en.wikipedia.org/wiki/Grayscale
[1]: https://en.wikipedia.org/wiki/Indexed_color
[2]: https://en.wikipedia.org/wiki/Framebuffer
[3]: https://en.wikipedia.org/wiki/Raster_graphics
[4]: https://en.wikipedia.org/wiki/Vector_graphics
[5]: https://en.wikipedia.org/wiki/Lossless_compression
[6]: https://en.wikipedia.org/wiki/Lossy_compression
[7]: https://en.wikipedia.org/wiki/Coordinate_system
[8]: https://en.wikipedia.org/wiki/Geometric_modeling
[9]: https://en.wikipedia.org/wiki/Geometric_primitive
[10]: https://en.wikipedia.org/wiki/Bayesian_hierarchical_modeling
