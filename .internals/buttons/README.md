# Button Design Synchonization

This is a maintainer note for future button creation. Use Inkscape and make sure
the badge is saved as `plain SVG` format (**NOT the default** `Inkscape SVG`
format).




## Button

1. Select a compatible background color value based on the brand guidelines or
   closest. The color **MUST IMMUNE TO** dark/light presentations.




## Value

1. Create a text object with `Noto Sans`, `Medium` size, at `12pt`.
2. Select the text object and the background object, then:
   1. Move the text object inside the background.
   2. Head to "Align & Distribute" and set to "Selected Area" instead of page.
   3. Right-aligned such that the text object is formed from the right side of
      the background.
   4. Vertifically center the text object such that the text is centered
      inside the background.
   5. Nudge the vertical alignment lower by 1 step if the text contains tails
      (e.g. `g`, `y` vs `abc`). This will make it artistically preceived
      center.
3. Select only the text object.
4. Reduce its value's x-axis by 10.
5. Convert the text object into path using `Path > Object to Path`.
6. Set the branding color.




## Brand Logo

1. Set brand logo x-axis to 20.
2. Vertically center the brand logo.
3. No modification to the logo elements for trademark compliances.
