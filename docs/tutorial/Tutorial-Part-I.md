# Tutorial - Part I

## Introduction

This tutorial asumes some knowledge of CSS and Pharo Smalltalk.

The main entry point for the library is the class `CascadingStyleSheetBuilder`.
Let's see some minimalist example. Copy the following in a workspace and
`Inspect-it (Alt+i)`:

```smalltalk
CascadingStyleSheetBuilder new build
```

Beautiful! You have now an inspector on your fisrt (empty and useless) style
sheet. Let's do something more useful now. Real stylesheets are composed of
rules (or rule-sets), where each has a selector and a declaration group. The
selector determines if the rule applies to some element in the DOM, and the
declaration group specifies the style to apply.

## Basics

Our first style sheet will simply assign a margin to every `div` element in the DOM.

```smalltalk
CascadingStyleSheetBuilder new
  declareRuleSetFor: [:selector | selector div ]
  with: [:style | style margin: 2 px ];
  build
```

Evaluates to:

```css
div
{
  margin: 2px;
}
```

Let's analyze it. The message `declareRuleSetFor:with:` is used to configure a
rule-set in the builder. It uses two closures, the first one is used to define
the *selector* and the second one the *style*. The `selector` argument of the
first closure provides an API to construct the selector (more on this later).
The `style` argument on the second closure provides the API to declare CSS
properties with their corresponding values.

The properties API is mostly defined following these rules:

- Properties without dashes in the name are directly mapped: to define `margin`
  we use the message `margin:`.
- Properties with one or more dashes are mapped using camel case: to define
  `margin-top` we use the message `marginTop:`.

### Basic CSS Types

#### Lengths, Angles, Times and Frequencies

Another thing to note is how `2 px` was interpreted. The resulting object is a
`CssMeasure`. The library provides out-of-the-box support for the length, angle,
time and frequency units in the CSS spec. There are extensions for `Integer` and
`Float` classes allowing to obtain lengths. The supported length units are:

- `em` relative to font size
- `ex` relative to "x" height
- `ch` relative to width of the zero glyph in the element's font
- `rem` relative to font size of root element
- `vw` 1% of viewport's width
- `vh` 1% of viewport's height
- `vmin` 1% of viewport's smaller dimension
- `vmax` 1% of viewport's larger dimension
- `cm` centimeters
- `mm` millimeteres
- `in` inches
- `pc` picas
- `pt` points
- `px` pixels (note that CSS has some special definition for pixel)

The supported angle units are:

- `deg` degrees
- `grad` gradians
- `rad` radians
- `turn` turns

The supported time units are:

- `s` seconds
- `ms` milliseconds

The supported frequency units are:

- `Hz` Hertz
- `kHz` KiloHertz

It also supports the creation of percentages: `50 percent` is expressed as `50%`
in the resulting CSS.

Some properties require integer or floating point values. In this cases just use
the Pharo provided integer and float support. For example:

```smalltalk
CascadingStyleSheetBuilder new
  declareRuleSetFor: [:selector | selector div ]
  with: [:style | style zIndex: 2 ];
  build
```

#### Colors

The library also supports abstractions for properties requiring color values.
You can reference the colors in the SVG 1.0 list by name, and the abstractions
`CssRGBColor` and `CssHSLColor` allow the creation of colors in the RGB or HSL
space including alpha support. To get the list of supported colors inspect
`RenoirSt constants >> #colors`.

```smalltalk
CascadingStyleSheetBuilder new
  declareRuleSetFor: [:selector | selector div ]
  with: [:style |
    style
      backgroundColor: #aliceBlue;
      borderColor: (CssRGBColor red: 0 green: 128 blue: 0 alpha: 0.5)];
  build
```

Evaluates to:

```css
div
{
  background-color: aliceblue;
  border-color: rgba(0,128,0,0.5);
}
```

> **Hint:** In a real scenario you should never hardcode the colors as in the
> examples, instead put them in objects representing a theme or something that
> gives them a name related to your application.

RGB-Colors also support percentual values:

```smalltalk
CascadingStyleSheetBuilder new
  declareRuleSetFor: [:selector | selector div ]
  with: [:style | style borderColor:
    (CssRGBColor red: 0 percent green: 50 percent blue: 0 percent) ];
  build
```

Evaluates to:

```css
div
{
  border-color: rgb(0%,50%,0%);
}
```

Notice the difference in the message used because there is no alpha channel specification.

#### Constants

A lot of values for CSS properties are just keyword constants. You can reference
it by keyword, inspect `RenoirSt constants` to get the list of supported ones.

```smalltalk
CascadingStyleSheetBuilder new
  declareRuleSetFor: [:selector | selector div ]
  with: [:style | style textAlign: #justify ];
  build
```

Evaluates to:

```css
div
{
  text-align: justify;
}
```

#### Several Property Values

Some properties support a wide range of values. For example the `margin`
property can have 1, 2 , 3 or 4 values specified. If only one value needs to be
specified just provide it, in other case use an `Array` like this:

```smalltalk
CascadingStyleSheetBuilder new
  declareRuleSetFor: [:selector | selector div ]
  with: [:style | style margin: { 2 px. 4 px } ];
  build
```

Evaluates to:

```css
div
{
  margin: 2px 4px;
}
```

#### URLs

`ZnUrl` instances can be used as the value for properties requiring an URI.
Both relative and absolute URLs are accepted. A relative URL is by default
considered relative to the site root.

```smalltalk
CascadingStyleSheetBuilder new
  declareRuleSetFor: [:selector | selector div class: 'logo' ]
  with: [:style | style backgroundImage: 'images/logo.png' asZnUrl ];
  declareRuleSetFor: [:selector | selector div class: 'logo' ]
  with: [:style | style
    backgroundImage: 'http://www.example.com/images/logo.png' asZnUrl ];
  build
```

Evaluates to:

```css
div.logo
{
  background-image: url("/images/logo.png");
}

div.logo
{
  background-image: url("http://www.example.com/images/logo.png");
}
```

In case you want an URL relative to the style sheet, you must send the message `relativeToStyleSheet`:

```smalltalk
CascadingStyleSheetBuilder new
  declareRuleSetFor: [:selector | selector div class: 'logo' ]
  with: [:style | style backgroundImage: 'images/logo.png' asZnUrl relativeToStyleSheet];
  build
```

Evaluates to:

```css
div.logo
{
  background-image: url("images/logo.png");
}
```

### Comments

When declaring rule sets the library support attaching comments to them. To do
that send the message `declareRuleSetFor:with:andComment:`, for example:

```smalltalk
CascadingStyleSheetBuilder new
  declareRuleSetFor: [:selector | selector div ]
  with: [:style | style margin: 2 pc ]
  andComment: 'Two picas margin';
  build
```

Evaluates to:

```css
/*Two picas margin*/
div
{
  margin: 2pc;
}
```

Since version 1.3.0 is possible to also define stand-alone comments (not
attached to any rule):

```smalltalk
CascadingStyleSheetBuilder new
  comment: 'A general comment';
  build
```

Evaluates to:

```css
/*A general comment*/
```

### Functional Notation

A functional notation is a type of CSS component value that can represent more
complex types or invoke special processing. The following notations are supported:

#### Mathematical Expressions: `calc()`

The library provides support for math expressions using the  `CssMathExpression`
abstraction. This math expressions are built instantiating a `CssMathExpression`
with the first operand, and sending to it `+`, `-`, `*` or `/` messages. Lets
see some example:

```smalltalk
CascadingStyleSheetBuilder new
  declareRuleSetFor: [:selector | selector div ]
  with: [:style | style margin: (CssMathExpression on: 2 pc) / 3 + 2 percent ];
  build
```

Evaluates to:

```css
div
{
  margin: calc(2pc / 3 + 2%);
}
```

#### Toggling between values: `toggle()`

This kind of expressions allows descendant elements to cycle over a list of
values instead of inheriting the same value.
It's supported using the `CssToggle` abstraction.

```smalltalk
CascadingStyleSheetBuilder new
  declareRuleSetFor: [:selector | selector unorderedList unorderedList ]
  with: [:style | style listStyleType:
    (CssToggle cyclingOver: { #disc. #circle. #square}) ];
  build
```

Evaluates to:

```css
ul ul
{
  list-style-type: toggle(disc, circle, square);
}
```

#### Attribute references: `attr()`

The attr() function is allowed as a component value in properties applied to an
element or pseudo-element. It returns the value of an attribute on the element.
If used on a pseudo-element, it returns the value of the attribute on the
pseudo-element's originating element. It's supported using the
`CssAttributeReference` abstraction. This function can be used simply providing
an attribute name:

```smalltalk
CascadingStyleSheetBuilder new
  declareRuleSetFor: [:selector | selector div before ]
  with: [:style | style content:
    (CssAttributeReference toAttributeNamed: 'title') ];
  build
```

Evaluates to:

```css
div::before
{
  content: attr(title string);
}
```

or providing also the type or unit of the attribute (if no type or unit is
specified the `string` type is assumed):

```smalltalk
CascadingStyleSheetBuilder new
  declareRuleSetFor: [:selector | selector div  ]
  with: [:style | style width:
    (CssAttributeReference toAttributeNamed: 'height' ofType: #pixel) ];
  build
```

Evaluates to:

```css
div
{
  width: attr(height px);
}
```

also it's possible to provide a fallback value in case the attribute is not present:

```smalltalk
CascadingStyleSheetBuilder new
  declareRuleSetFor: [:selector | selector div before ]
  with: [:style | style content:
    (CssAttributeReference toStringAttributeNamed: 'title'
      withFallback: 'Missing title') ];
  build
```

Evaluates to:

```css
div::before
{
  content: attr(title string, "Missing title");
}
```

```smalltalk
CascadingStyleSheetBuilder new
  declareRuleSetFor: [:selector | selector div before ]
  with: [:style | style content:
    (CssAttributeReference toAttributeNamed: 'height'
    ofType: #pixel withFallback: 10 px) ];
  build
```

Evaluates to:

```css
div::before
{
  content: attr(height px, 10px);
}
```

To get a list of the supported units inspect `RenoirSt constants >> #units`.

#### Gradients

A gradient is an image that smoothly fades from one color to another. These are
commonly used for subtle shading in background images, buttons, and many other
things. The gradient notations described in this section allow an author to
specify such an image in a terse syntax, so that the UA can generate the image
automatically when rendering the page. This notation is supported using
`CssLinearGradient` and `CssRadialGradient` asbtractions.

Let's see some examples for linear gradients:

```smalltalk
CascadingStyleSheetBuilder new
  declareRuleSetFor: [:selector | selector div ]
  with: [:style | style background:
    (CssLinearGradient fading: { #yellow. #blue }) ];
  declareRuleSetFor: [:selector | selector div ]
  with: [:style | style background:
    (CssLinearGradient to: #bottom fading: { #yellow. #blue }) ];
  declareRuleSetFor: [:selector | selector div ]
  with: [:style | style background:
    (CssLinearGradient rotated: 45 deg fading: { #yellow. #blue }) ];
  declareRuleSetFor: [:selector | selector div ]
  with: [:style | style background:
    (CssLinearGradient rotated: 90 deg
      fading: { #yellow. (CssColorStop for: #blue at: 30 percent) }) ];
  declareRuleSetFor: [:selector | selector div ]
  with: [:style | style background:
    (CssLinearGradient fading:
      { #yellow. (CssColorStop for: #blue at: 20 percent). #green}) ];
  declareRuleSetFor: [:selector | selector div ]
  with: [:style | style background:
    (CssLinearGradient to: { #top. #right } fading: { #red.  #white. #blue }) ];
  build
```

evaluates to:

```css
div
{
  background: linear-gradient(yellow, blue);
}

div
{
  background: linear-gradient(to bottom, yellow, blue);
}

div
{
  background: linear-gradient(45deg, yellow, blue);
}

div
{
  background: linear-gradient(90deg, yellow, blue 30%);
}

div
{
  background: linear-gradient(yellow, blue 20%, green);
}

div
{
  background: linear-gradient(to top right, red, white, blue);
}
```

and some for radial gradients:

```smalltalk
CascadingStyleSheetBuilder new
  declareRuleSetFor: [:selector | selector div ]
  with: [:style | style background:
    (CssRadialGradient fading: { #yellow. #green }) ];
  declareRuleSetFor: [:selector | selector div ]
  with: [:style | style background:
    (CssRadialGradient
      elliptical: #farthestCorner
      at: #center
      fading: { #yellow. #green }) ];
  declareRuleSetFor: [:selector | selector div ]
  with: [:style | style background:
    (CssRadialGradient
      elliptical: #farthestSide
      at: { #left. #bottom}
      fading: { #red. (CssColorStop for: #yellow at: 50 px). #green }) ];
  declareRuleSetFor: [:selector | selector div ]
  with: [:style | style background:
    (CssRadialGradient
      elliptical: {20 px. 30 px}
      at: { 20 px. 30 px}
      fading: { #red. #yellow. #green }) ];
  build
```

evaluates to:

```css
div
{
  background: radial-gradient(yellow, green);
}

div
{
  background: radial-gradient(farthest-corner ellipse at center, yellow, green);
}

div
{
  background: radial-gradient(farthest-side ellipse at left bottom, red,
    yellow 50px, green);
}

div
{
  background: radial-gradient(20px 30px ellipse at 20px 30px, red, yellow, green);
}
```

To make the gradient repeatable, just send to it the message `beRepeating`. For Example:

```smalltalk
(CssRadialGradient fading: { #yellow. #green }) beRepeating
```

renders as:

```css
repeating-radial-gradient(yellow, green);
```

#### Transforms

Css transforms are a collection of functions that allow you to shape elements
in particular ways.

##### Rotation: `rotate()` `rotateX()` `rotateY()` `rotateZ()` `rotate3d()`

The library provides support for rotation functions, used in animations to move
an element around a central point. The rotate expressions are built
instantiating `CssRotate` or `CssRotate3D` for 3D rotations.

Lets see a basic working rotation example:

```smalltalk
CascadingStyleSheetBuilder new
    declareRuleSetFor: [ :selector | selector div ]
    with: [ :style | 
        style
            animation: 'spin 5s linear infinite';
            width: 100 px;
            height: 100 px ];
    declare: [ :cssBuilder | 
        cssBuilder
            declareKeyframeRuleSetAt: 0 percent
                with: [ :style | 
                style
                    transform: (CssRotate by: 0 deg);
                    background: #blue ];
            declareKeyframeRuleSetAt: 100 percent
                with: [ :style | 
                style
                    transform: (CssRotate by: 360 deg);
                    background: #red ] ]
    forKeyframesNamed: 'spin';
  build
```

Evaluates to:

```css
div
{
  animation: spin 5s linear infinite;
  width: 100px;
  height: 100px;
}

@keyframes spin
{
  0%
  {
    transform: rotate(0deg);
    background: blue;
  }

  100%
  {
    transform: rotate(360deg);
    background: red;
  }
}
```

##### Translation: `translate()` `translateX()` `translateY()` `translateZ()` `translate3d()`

The library supports `translate` functions, used to mode the position of an
element. To translate an element, instantiate `CssTranslate`.

Lets see an example:

```smalltalk
CascadingStyleSheetBuilder new
    declareRuleSetFor: [ :selector | selector div ]
    with: [ :style | 
        style
            background: #blue;
            animation: 'animation 5s linear infinite';
            width: 100 px;
            height: 100 px ];
    declare: [ :cssBuilder | 
        cssBuilder
            declareKeyframeRuleSetAt: 0 percent
                with: [ :style | 
                style
                    transform: (CssTranslate by: 100 px) ] ]
    forKeyframesNamed: 'animation';
  build.
```

Evaluates to:

```css
div
{
  background: blue;
  animation: animation 5s linear infinite;
  width: 100px;
  height: 100px;
}

@keyframes animation
{
  0%
  {
    transform: translate(100px);
  }
}
```

##### Scale: `scale()` `scaleX()` `scaleY()` `scaleZ()` `scale3d()`

RenoirSt supports scaling functions. You can use them by building an instance
of `CssScale`.

An example can be:

```smalltalk
CascadingStyleSheetBuilder new
    declareRuleSetFor: [ :selector | selector div ]
    with: [ :style | 
        style
          background: #blue;
          animation: 'scale 5s linear infinite';
          width: 100 px;
          height: 100 px ];
    declare: [ :cssBuilder | 
        cssBuilder
            declareKeyframeRuleSetAt: 0 percent
                with: [ :style | 
                  style transform: (CssScale by: 2) ];
        declareKeyframeRuleSetAt:  100 percent
        with: [ :style |
          style transform: (CssScale by: 4) ] ]
    forKeyframesNamed: 'scale';
  build.
```

Evaluating to:

```css
div
{
  background: blue;
  animation: scale 5s linear infinite;
  width: 100px;
  height: 100px;
}

@keyframes scale
{
  0%
  {
    transform: scale(2);
  }

  100%
  {
    transform: scale(4);
  }
}
```

##### Skew `skew()` `skewX()` `skewY()`

The library supports the `skew` function, performing a shear transformation
(also known as a shear mapping or a transvection), which displaces each point
of an element by a given angle in each direction. To build skew functions,
instantiate `CssSkew`.

An example:

```smalltalk
CascadingStyleSheetBuilder new
  declareRuleSetFor: [ :selector | selector div ]
  with: [ :style |
    style
      background: #blue;
      animation: 'skewAnimation 5s linear infinite';
      width: 100 px;
      height: 100 px ];
  declare: [ :cssBuilder |
    cssBuilder
      declareKeyframeRuleSetAt: 0 percent
      with: [ :style | style transform: (CssSkew by: 45 deg) ] ]
  forKeyframesNamed: 'skewAnimation';
  build
```

Evaluates to:

```css
div
{
  background: blue;
  animation: skewAnimation 5s linear infinite;
  width: 100px;
  height: 100px;
}

@keyframes skewAnimation
{
  0%
  {
    transform: skew(45deg);
  }
}
```

##### Aditional Functions for Transformation

###### Perspective

The library supports the `perspective` function by instantiating `CssPerspective`.
This function is used to set a perspective when doing a transformation on the Z axis.

If we extend the previous example to translate in a 3D space, it would be like:

```smalltalk
CascadingStyleSheetBuilder new
    declareRuleSetFor: [ :selector | selector div ]
    with: [ :style | 
        style
        background: #blue;
            animation: 'animation 5s linear infinite';
            width: 100 px;
            height: 100 px ];
    declare: [ :cssBuilder | 
        cssBuilder
            declareKeyframeRuleSetAt: 0 percent
                with: [ :style | 
                style
                    transform:
                {(CssPerspective of: 200 px).
                            (CssTranslate 
                                onXAxisBy: 100 px 
                                onYAxisBy: 100 px 
                                andZAxisBy: 100 px )} ] ]
    forKeyframesNamed: 'animation';
  build.
```

Evaluating to:

```css
div
{
  background: blue;
  animation: animation 5s linear infinite;
  width: 100px;
  height: 100px;
}

@keyframes animation
{
  0%
  {
    transform: perspective(200px) translate3d(100px, 100px, 100px);
  }
}
```

#### Easing Functions

##### Steps

The library also supports the `steps` function, used in the timing parameter of
animation keyframes called `animation-timing-function`. Steps are a timing
function that allows us to break an animation or transition into segments.

A usage example can be:

```smalltalk
CascadingStyleSheetBuilder new
    declareRuleSetFor: [ :selector | selector div ]
    with: [ :style | 
        style
        background: #blue;
        animationName: 'scale';
        animationDuration: 5 s;
        animationTimingFunction: (CssSteps by: 2);
        animationIterationCount: #infinite;
        width: 100 px;
        height: 100 px ];
    declare: [ :cssBuilder | 
        cssBuilder
            declareKeyframeRuleSetAt: 0 percent
                with: [ :style | 
                  style transform: (CssScale by: 2) ];
        declareKeyframeRuleSetAt:  100 percent
          with: [ :style |
            style transform: (CssScale by: 4) ] ]
    forKeyframesNamed: 'scale';
  build.
```

Evaluating to:

```css
div
{
  background: blue;
  animation-name: scale;
  animation-duration: 5s;
  animation-timing-function: steps(2);
  animation-iteration-count: infinite;
  width: 100px;
  height: 100px;
}

@keyframes scale
{
  0%
  {
    transform: scale(2);
  }

  100%
  {
    transform: scale(4);
  }
}
```

##### Cubic Bezier

Renoir supports the `cubic-bezier` function, that can be used with the
`transition-timing-function` property to control how a transition will change
speed over its duration. It also works with the `animation-timing-function` for
keyframes. To create your own cubic bezier timing function build an instance
with `CssCubicBezier`.

Here's an example:

```smalltalk
CascadingStyleSheetBuilder new
    declareRuleSetFor: [ :selector | selector div ]
    with: [ :style | 
        style
          background: #blue;
          animationName: 'scale';
          animationDuration: 5 s;
          animationTimingFunction: (
            CssCubicBezier
              firstXAxis:  0.63
              firstYAxis:  0.05
              secondXAxis:  0.43
              secondYAxis: 1.7);
          animationIterationCount: #infinite;
          width: 100 px;
          height: 100 px ];
    declare: [ :cssBuilder | 
        cssBuilder
          declareKeyframeRuleSetAt: 0 percent
            with: [ :style |
              style transform: (CssScale by: 2) ];
          declareKeyframeRuleSetAt:  100 percent
            with: [ :style |
              style transform: (CssScale by: 4) ] ]
    forKeyframesNamed: 'scale';
  build.
```

Evaluating to:

```css
div
{
  background: blue;
  animation-name: scale;
  animation-duration: 5s;
  animation-timing-function: cubic-bezier(0.63, 0.05, 0.43, 1.7);
  animation-iteration-count: infinite;
  width: 100px;
  height: 100px;
}

@keyframes scale
{
  0%
  {
    transform: scale(2);
  }

  100%
  {
    transform: scale(4);
  }
}
```

#### Box Shadows

This abstraction simplifies the use of the `box-shadow` property. Let's see
some examples:

```smalltalk
CssBoxShadow
  horizontalOffset: 64 px
  verticalOffset: 64 px
  blurRadius: 12 px
  spreadDistance: 40 px
  color: #black
```

renders as:

```css
64px 64px 12px 40px black
```

```smalltalk
(CssBoxShadow
  horizontalOffset: 64 px
  verticalOffset: 64 px
  blurRadius: 12 px
  spreadDistance: 40 px
  color: #black) ,
(CssBoxShadow
  horizontalOffset: 12 px
  verticalOffset: 11 px
  blurRadius: 0 px
  spreadDistance: 8 px
  color: #black ) beInset
```

renders as:

```css
64px 64px 12px 40px black, inset 12px 11px 0px 8px black
```

[Go to next chapter](Tutorial - Part II.md)
