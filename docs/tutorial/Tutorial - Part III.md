Tutorial - Part III
===================

## Important Rules

CSS attempts to create a balance of power between author and user style sheets. By default, rules in an author's style sheet override those in a user's style sheet.

However, for balance, an `!important` declaration takes precedence over a normal declaration. Both author and user style sheets may contain `!important` declarations, and user `!important` rules override author `!important` rules. This CSS feature improves accessibility of documents by giving users with special requirements control over presentation.

The library provides support for this feature by sending `beImportantDuring:` message to the style. Let's see an example:

```smalltalk
CascadingStyleSheetBuilder new
  declareRuleSetFor: [:selector | selector paragraph ]
  with: [:style |
    style beImportantDuring: [:importantStyle |
      importantStyle
        textIndent: 1 em;
        fontStyle: #italic
    ].
    style fontSize: 18 pt.
  ];
  build
```
Evaluates to:
```css
p
{
	text-indent: 1em !important;
	font-style: italic !important;
	font-size: 18pt;
}
```
Note that the important properties must be created by sending the messages to the inner argument `importantStyle` instead of the outer argument `style`.

##### References:
- http://www.w3.org/TR/CSS2/cascade.html#important-rules

## Media Queries

A `@media` rule specifies the target media types of a set of statements. The `@media` construct allows style sheet rules that apply to various media in the same style sheet. Style rules outside of `@media` rules apply to all media types that the style sheet applies to. At-rules inside `@media` are invalid in CSS2.1.

The most basic media rule consists of specifying just a media type:
```smalltalk
CascadingStyleSheetBuilder new
	declare: [ :cssBuilder |
		cssBuilder
			declareRuleSetFor: [ :selector | selector id: #oop ]
			with: [ :style | style color: #red ]
		]
	forMediaMatching: [ :queryBuilder | queryBuilder type: #print ];
	build
```

To use media queries in the library just send the message `declare:forMediaMatching:` to the builder.  The first closure is evaluated with an instance of a `CascadingStyleSheetBuilder` and the second one with a builder of media queries.

The media query builder will match any media type by default. To specify a media type just send it the message `type:` with the corresponding media type. You can provide the following media types by keyword:
`braille`, `embossed`, `handheld`, `print`, `projection`, `screen`, `speech`, `tty` and `tv`.

To get the list of media query constants supported inspect `RenoirSt classPool at: #CssMediaQueryConstants`.

The media query builder supports a variety of messages for additional conditions (called media features). Media features are used in expressions to describe requirements of the output device.

The following media feature messages are supported:
- Accepting a `CssMeasure` with length units
	- `width:`
	- `minWidth:`
	- `maxWidht:`
	- `height:`
	- `minHeight:`
	- `maxHeight:`
	- `deviceWidth:`
	- `minDeviceWidth:`
	- `maxDeviceWidth:`
	- `deviceHeight:`
	- `minDeviceHeight:`
	- `maxDeviceHeight:`
- `orientation:` accepting `#portrait` or `#landscape`
- Accepting fractions as aspect ratios
	- `aspectRatio:`
	- `minAspectRatio:`
	- `maxAspectRatio:`
	- `deviceAspectRatio:`
	- `minDeviceAspectRatio:`
	- `maxDeviceAspectRatio:`
- Accepting integers
	- `color:` the argument describes the number of bits per color component of the output device
	- `minColor:`
	- `maxColor:`
	- `colorIndex:` the argument describes the number of entries in the color lookup table of the output device
	- `minColorIndex:`
	- `maxColorIndex:`
	- `monochrome:` the argument describes the number of bits per pixel in a monochrome frame buffer
	- `minMonochrome:`
	- `maxMonochrome:`
	- `grid:` the argument must be 1 or 0
- Accepting a `CssMeasure` with resolution units
	- `resolution:`
	- `minResolution:`
	- `maxResolution:`
- `scan:` accepting `#progressive` or `#interlace`

New units for resolutions are added using the `CssMeasure` abstraction. This kind of measures can be created sending the messages `dpi` (dots per inch), `dpcm` (dots per centimeter) or `dppx` (dots per pixel unit) to an integer or float.

Let's see a final example to better understand the media features support:
```smalltalk
CascadingStyleSheetBuilder new
	declare: [ :cssBuilder |
		cssBuilder
			declareRuleSetFor: [ :selector | selector id: #oop ]
			with: [ :style | style color: #red ]
		]
	forMediaMatching: [ :queryBuilder |
		queryBuilder
			orientation: #landscape;
			resolution: 300 dpi
		];
	build
```
Evaluates to:
```css
@media all and (orientation: landscape) and (resolution: 300dpi)
{
	#oop
	{
		color: red;
	}
}
```
##### References:
- http://www.w3.org/TR/CSS2/media.html
- http://www.w3.org/TR/css3-mediaqueries/

## Vendor specific extensions

The library doesn't provide out of the box support for non standard properties. However since version `1.4.0` the message `vendorPropertyAt:put:` is available to ease the creation of this kind of properties by the end user.

For example:

```smalltalk
CascadingStyleSheetBuilder new
  declareRuleSetFor: [:selector | selector div ]
  with: [:style | style vendorPropertyAt: 'crazy-margin' put: 1 px ];
  build
```
Evaluates to:
```css
div
{
	crazy-margin: 1px;
	-moz-crazy-margin: 1px;
	-webkit-crazy-margin: 1px;
	-o-crazy-margin: 1px;
	-ms-crazy-margin: 1px;
}
```

> **Hint:** If you really want to use a vendor specific extension, It's better to create an extension method sending the vendorPropertyAt:put: message.

## Font Face Rules

The `@font-face` rule allows for linking to fonts that are automatically fetched and activated when needed. This allows authors to select a font that closely matches the design goals for a given page rather than limiting the font choice to a set of fonts available on a given platform. A set of font descriptors define the location of a font resource, either locally or externally, along with the style characteristics of an individual face.

This support is implemented in the builder:
```smalltalk
CascadingStyleSheetBuilder new
	declareFontFaceRuleWith: [ :style |
		style
			fontFamily: 'Gentium';
			src: 'http://example.com/fonts/gentium.woff' asZnUrl ];
	build
```
renders as:
```css
@font-face
{
	font-family: Gentium;
	src: url("http://example.com/fonts/gentium.woff");
}
```

This kind of rule allows for multiple `src` definitions specifying the resources containing the data. This resources can be external (fonts fetched from a URL) or local (available in the user system). This kind of resources are supported using `CssLocalFontReference` and `CssExternalFontReference`.

Here's a more complex case showing this:
```smalltalk
CascadingStyleSheetBuilder new
	declareFontFaceRuleWith:
		[ :style |
		style
			fontFamily: 'MainText';
			src: (CssExternalFontReference locatedAt: 'gentium.eat' asZnUrl relativeToStyleSheet);
			src: (CssLocalFontReference toFontNamed: 'Gentium')	, (CssExternalFontReference locatedAt: 'gentium.woff' asZnUrl relativeToStyleSheet withFormat: #woff);
			src: (CssExternalFontReference svgFontLocatedAt: 'fonts.svg' asZnUrl relativeToStyleSheet withId: 'simple') ];
	build
```

```css
@font-face
{
	font-family: MainText;
	src: url("gentium.eat");
	src: local(Gentium), url("gentium.woff") format("woff");
	src: url("fonts.svg#simple") format("svg");
}
```

### References
- http://www.w3.org/TR/css3-fonts/#font-face-rule

## Interaction with other frameworks and libraries

### Units

The `Units` package (available using the ConfigurationBrowser in Pharo) includes some extensions that collides with RenoirSt.  Since version `1.1.0` this library is able to load automatically a compatibility package if it's loaded after `Units` package. To test this integration there's an [specific job](https://ci.inria.fr/pharo-contribution/job/RenoirSt-UnitsCompatibility/) in the contribution server, that loads first `Units` and later `RenoirSt`.
[![Build Status](https://ci.inria.fr/pharo-contribution/buildStatus/icon?job=RenoirSt-UnitsCompatibility)](https://ci.inria.fr/pharo-contribution/job/RenoirSt-UnitsCompatibility/)

### Seaside

The library includes an optional group including some useful extensions. The [Seaside](www.seaside.st) framework includes his own class modeling URLs, when this configuration is loaded the instances of `WAUrl` can be used in the properties requiring an URI:

```smalltalk
CascadingStyleSheetBuilder new
  declareRuleSetFor: [:selector | selector div class: 'logo' ]
  with: [:style | style backgroundImage: 'images/logo.png' seasideUrl ];
  build
```
Evaluates to:
```css
div.logo
{
    background-image: url("/images/logo.png");
}
```

This optional configuration also loads extensions to `CssDeclarationBlock` so it can be used as a `JSObject` in plugins requiring some style parameter or in `style:` methods.

To load this extensions you need to load in an image with Seaside already loaded the group `Deployment-Seaside-Extensions` or `Development-Seaside-Extensions` (if you want the test cases):

```smalltalk
Metacello new
  baseline: 'RenoirSt';
  repository: 'github://ba-st/RenoirSt:v5/source';
  load: 'Deployment-Seaside-Extensions'
```

or

```smalltalk
Metacello new
  baseline: 'RenoirSt';
  repository: 'github://ba-st/RenoirSt:v5/source';
  load: 'Development-Seaside-Extensions'
```

There's an integration job in the CI server, testing this specific configuration: [![Build Status](https://ci.inria.fr/pharo-contribution/buildStatus/icon?job=RenoirSt-SeasideExtensions)](https://ci.inria.fr/pharo-contribution/job/RenoirSt-SeasideExtensions/).

## How to use the library from other project

Using the new Metacello API it's easy to reference the library as a dependency from another project. For example to depend on a specific version you can do something like:

```smalltalk
...
	spec
		baseline: 'RenoirSt'
		with: [ spec repository: 'github://ba-st/RenoirSt:v5.0.0/source'];
		import: 'RenoirSt'
```

you can also load specific groups, like the Seaside extensions or do pattern matching on the versions given this project uses Semantic Versioning:

```smalltalk
...
	spec
		baseline: 'RenoirSt'
		with: [
			spec
				repository: 'github://ba-st/RenoirSt:v5/source';
				loads: #('Deployment-Seaside-Extensions')];
		import: 'RenoirSt'
```

The available groups are:
- Deployment: Base library  (the default group)
- Development: Deployment + Test cases
- Deployment-Seaside-Extensions: Deployment + Seaside specific extensions
- Development-Seaside-Extensions: Deployment-Seaside-Extensions + Test cases
