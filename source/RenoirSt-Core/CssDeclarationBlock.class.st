"
A declaration block starts with a left curly brace ({) and ends with the matching right curly brace (}). In between there must be a list of zero or more semicolon-separated (;) declarations.
"
Class {
	#name : #CssDeclarationBlock,
	#superclass : #CssObject,
	#instVars : [
		'declarations',
		'rulePrecedencePolicy'
	],
	#category : #'RenoirSt-Core-Common'
}

{ #category : #'keyframes properties' }
CssDeclarationBlock >> animation: aCssValue [

	"Values must follow the guidelines specified in https://drafts.csswg.org/css-animations/#animation 
	being like:
		animation: name duration timing-function delay iteration-count direction fill-mode play-state
	
	Always specify the animation-duration property, otherwise the duration is 0, and will never be played."

	self propertyAt: 'animation' put: aCssValue 
]

{ #category : #'keyframes properties' }
CssDeclarationBlock >> animationDelay: aCssValue [

	self propertyAt: 'animation-delay' put: aCssValue 
]

{ #category : #'keyframes properties' }
CssDeclarationBlock >> animationDirection: aCssValue [

	self propertyAt: 'animation-direction' put: aCssValue 
]

{ #category : #'keyframes properties' }
CssDeclarationBlock >> animationDuration: aCssValue [

	self propertyAt: 'animation-duration' put: aCssValue 
]

{ #category : #'keyframes properties' }
CssDeclarationBlock >> animationFillMode: aCssValue [

	self propertyAt: 'animation-fill-mode' put: aCssValue 
]

{ #category : #'keyframes properties' }
CssDeclarationBlock >> animationIterationCount: aCssValue [

	self propertyAt: 'animation-iteration-count' put: aCssValue 
]

{ #category : #'keyframes properties' }
CssDeclarationBlock >> animationName: aCssValue [

	self propertyAt: 'animation-name' put: aCssValue 
]

{ #category : #'keyframes properties' }
CssDeclarationBlock >> animationPlayState: aCssValue [

	self propertyAt: 'animation-play-state' put: aCssValue 
]

{ #category : #'keyframes properties' }
CssDeclarationBlock >> animationTimingFunction: aCssValue [

	self propertyAt: 'animation-timing-function' put: aCssValue 
]

{ #category : #'background properties' }
CssDeclarationBlock >> background: aCssValue [ 

	self propertyAt: 'background' put: aCssValue
]

{ #category : #'background properties' }
CssDeclarationBlock >> backgroundAttachment: aCssValue [ 

	self propertyAt: 'background-attachment' put: aCssValue
]

{ #category : #'background properties' }
CssDeclarationBlock >> backgroundClip: aCssValue [

	self propertyAt: 'background-clip' put: aCssValue 
]

{ #category : #'background properties' }
CssDeclarationBlock >> backgroundColor: aColor [

	self propertyAt: 'background-color' put: aColor
]

{ #category : #'background properties' }
CssDeclarationBlock >> backgroundImage: aCssValue [ 

	self propertyAt: 'background-image' put: aCssValue
]

{ #category : #'background properties' }
CssDeclarationBlock >> backgroundOrigin: aCssValue [

	self propertyAt: 'background-origin' put: aCssValue 
]

{ #category : #'background properties' }
CssDeclarationBlock >> backgroundPosition: aCssValue [ 

	self propertyAt: 'background-position' put: aCssValue
]

{ #category : #'background properties' }
CssDeclarationBlock >> backgroundRepeat: aCssValue [ 

	self propertyAt: 'background-repeat' put: aCssValue
]

{ #category : #'background properties' }
CssDeclarationBlock >> backgroundSize: aCssValue [ 

	self propertyAt: 'background-size' put: aCssValue
]

{ #category : #Configuring }
CssDeclarationBlock >> beImportantDuring: aBlockClosure [
	
	| previousPolicy |
	previousPolicy := rulePrecedencePolicy.
	rulePrecedencePolicy := CssImportantRulePrecedencePoliciy new.
	[ aBlockClosure value: self ]
		ensure: [ rulePrecedencePolicy := previousPolicy ]
]

{ #category : #'border properties' }
CssDeclarationBlock >> border: aCssValue [

	self propertyAt: 'border' put: aCssValue  
]

{ #category : #'border properties' }
CssDeclarationBlock >> borderBottom: aCssValue [

	self propertyAt: 'border-bottom' put: aCssValue  
]

{ #category : #'border properties' }
CssDeclarationBlock >> borderBottomColor: aCssColor [
	
	self propertyAt: 'border-bottom-color' put: aCssColor 
]

{ #category : #'border properties' }
CssDeclarationBlock >> borderBottomLeftRadius: aCssLength [ 
	
	self propertyAt: 'border-bottom-left-radius' put: aCssLength 
]

{ #category : #'border properties' }
CssDeclarationBlock >> borderBottomRightRadius: aCssLength [ 
	
	self propertyAt: 'border-bottom-right-radius' put: aCssLength 
]

{ #category : #'border properties' }
CssDeclarationBlock >> borderBottomStyle: aBorderWidth [
	
	self propertyAt: 'border-bottom-style' put: aBorderWidth 
]

{ #category : #'border properties' }
CssDeclarationBlock >> borderBottomWidth: aBorderWidth [
	
	self propertyAt: 'border-bottom-width' put: aBorderWidth 
]

{ #category : #'table properties' }
CssDeclarationBlock >> borderCollapse: aCssValue [

	self propertyAt: 'border-collapse' put: aCssValue 
]

{ #category : #'border properties' }
CssDeclarationBlock >> borderColor: aCssColor [
	
	self propertyAt: 'border-color' put: aCssColor 
]

{ #category : #'border properties' }
CssDeclarationBlock >> borderImage: aCssValue [

	self propertyAt: 'border-image' put: aCssValue 
]

{ #category : #'border properties' }
CssDeclarationBlock >> borderImageOutset: aCssValue [

	self propertyAt: 'border-image-outset' put: aCssValue 
]

{ #category : #'border properties' }
CssDeclarationBlock >> borderImageRepeat: aCssValue [

	self propertyAt: 'border-image-repeat' put: aCssValue 
]

{ #category : #'border properties' }
CssDeclarationBlock >> borderImageSlice: aCssValue [

	self propertyAt: 'border-image-slice' put: aCssValue 
]

{ #category : #'border properties' }
CssDeclarationBlock >> borderImageSource: aCssValue [

	self propertyAt: 'border-image-source' put: aCssValue 
]

{ #category : #'border properties' }
CssDeclarationBlock >> borderImageWidth: aCssValue [

	self propertyAt: 'border-image-width' put: aCssValue 
]

{ #category : #'border properties' }
CssDeclarationBlock >> borderLeft: aCssValue [

	self propertyAt: 'border-left' put: aCssValue  
]

{ #category : #'border properties' }
CssDeclarationBlock >> borderLeftColor: aCssColor [
	
	self propertyAt: 'border-left-color' put: aCssColor 
]

{ #category : #'border properties' }
CssDeclarationBlock >> borderLeftStyle: aBorderWidth [
	
	self propertyAt: 'border-left-style' put: aBorderWidth 
]

{ #category : #'border properties' }
CssDeclarationBlock >> borderLeftWidth: aBorderWidth [
	
	self propertyAt: 'border-left-width' put: aBorderWidth 
]

{ #category : #'border properties' }
CssDeclarationBlock >> borderRadius: aCssValue [

	self propertyAt: 'border-radius' put: aCssValue  
]

{ #category : #'border properties' }
CssDeclarationBlock >> borderRight: aCssValue [

	self propertyAt: 'border-right' put: aCssValue  
]

{ #category : #'border properties' }
CssDeclarationBlock >> borderRightColor: aCssColor [
	
	self propertyAt: 'border-right-color' put: aCssColor 
]

{ #category : #'border properties' }
CssDeclarationBlock >> borderRightStyle: aBorderWidth [
	
	self propertyAt: 'border-right-style' put: aBorderWidth 
]

{ #category : #'border properties' }
CssDeclarationBlock >> borderRightWidth: aBorderWidth [
	
	self propertyAt: 'border-right-width' put: aBorderWidth 
]

{ #category : #'table properties' }
CssDeclarationBlock >> borderSpacing: aCssValue [

	self propertyAt: 'border-spacing' put: aCssValue 
]

{ #category : #'border properties' }
CssDeclarationBlock >> borderStyle: aBorderWidth [
	
	self propertyAt: 'border-style' put: aBorderWidth 
]

{ #category : #'border properties' }
CssDeclarationBlock >> borderTop: aCssValue [

	self propertyAt: 'border-top' put: aCssValue  
]

{ #category : #'border properties' }
CssDeclarationBlock >> borderTopColor: aCssColor [
	
	self propertyAt: 'border-top-color' put: aCssColor 
]

{ #category : #'border properties' }
CssDeclarationBlock >> borderTopLeftRadius: aCssLength [ 
	
	self propertyAt: 'border-top-left-radius' put: aCssLength 
]

{ #category : #'border properties' }
CssDeclarationBlock >> borderTopRightRadius: aCssLength [ 
	
	self propertyAt: 'border-top-right-radius' put: aCssLength 
]

{ #category : #'border properties' }
CssDeclarationBlock >> borderTopStyle: aBorderWidth [
	
	self propertyAt: 'border-top-style' put: aBorderWidth 
]

{ #category : #'border properties' }
CssDeclarationBlock >> borderTopWidth: aBorderWidth [
	
	self propertyAt: 'border-top-width' put: aBorderWidth 
]

{ #category : #'border properties' }
CssDeclarationBlock >> borderWidth: aBorderWidth [
	
	self propertyAt: 'border-width' put: aBorderWidth 
]

{ #category : #'visual formatting properties' }
CssDeclarationBlock >> bottom: aCssValue [

	self propertyAt: 'bottom' put: aCssValue 
]

{ #category : #'box properties' }
CssDeclarationBlock >> boxShadow: aCssValue [

	self propertyAt: 'box-shadow' put: aCssValue 
]

{ #category : #'table properties' }
CssDeclarationBlock >> captionSide: aCssValue [

	self propertyAt: 'caption-side' put: aCssValue 
]

{ #category : #'visual formatting properties' }
CssDeclarationBlock >> clear: aCssValue [

	self propertyAt: 'clear' put: aCssValue 
]

{ #category : #'visual effects properties' }
CssDeclarationBlock >> clip: aCssValue [

	self propertyAt: 'clip' put: aCssValue 
]

{ #category : #'color properties' }
CssDeclarationBlock >> color: aCssColor [
	"Sets the color of text. CSS1"

	self propertyAt: 'color' put: aCssColor
]

{ #category : #'generated content properties' }
CssDeclarationBlock >> content: aCssValue [

	self propertyAt: 'content' put: aCssValue 
]

{ #category : #'generated content properties' }
CssDeclarationBlock >> counterIncrement: aCssValue [

	self propertyAt: 'counter-increment' put: aCssValue 
]

{ #category : #'generated content properties' }
CssDeclarationBlock >> counterReset: aCssValue [

	self propertyAt: 'counter-reset' put: aCssValue 
]

{ #category : #Printing }
CssDeclarationBlock >> cssContentOn: aStream [

	aStream nextPut: ${.
	aStream newLine.
	declarations
		do: [ :declaration | 
			aStream tab.
			declaration cssContentOn: aStream.
			aStream newLine ].
	aStream nextPut: $}
]

{ #category : #'ui properties' }
CssDeclarationBlock >> cursor: aCssValue [

	self propertyAt: 'cursor' put:  aCssValue 
]

{ #category : #'visual formatting properties' }
CssDeclarationBlock >> direction: aCssValue [

	self propertyAt: 'direction' put: aCssValue 
]

{ #category : #'visual formatting properties' }
CssDeclarationBlock >> display: aCssValue [

	self propertyAt: 'display' put: aCssValue 
]

{ #category : #'table properties' }
CssDeclarationBlock >> emptyCells: aCssValue [

	self propertyAt: 'empty-cells' put: aCssValue 
]

{ #category : #'visual formatting properties' }
CssDeclarationBlock >> float: aCssValue [

	self propertyAt: 'float' put: aCssValue 
]

{ #category : #'font properties' }
CssDeclarationBlock >> font: aCssValue [

	self propertyAt: 'font' put: aCssValue 
]

{ #category : #'font properties' }
CssDeclarationBlock >> fontFamily: aCssValue [

	self propertyAt: 'font-family' put: aCssValue 
]

{ #category : #'font properties' }
CssDeclarationBlock >> fontKerning: aCssValue [

	self propertyAt: 'font-kerning' put: aCssValue 
]

{ #category : #'font properties' }
CssDeclarationBlock >> fontSize: aCssValue [

	self propertyAt: 'font-size' put: aCssValue 
]

{ #category : #'font properties' }
CssDeclarationBlock >> fontSizeAdjust: aNumber [ 
	
	^self propertyAt: 'font-size-adjust' put: aNumber  
]

{ #category : #'font properties' }
CssDeclarationBlock >> fontStretch: aCssValue [

	self propertyAt: 'font-stretch' put: aCssValue 
]

{ #category : #'font properties' }
CssDeclarationBlock >> fontStyle: aCssValue [

	self propertyAt: 'font-style' put: aCssValue 
]

{ #category : #'font properties' }
CssDeclarationBlock >> fontSynthesis: aCssValue [
	
	self propertyAt: 'font-synthesis' put: aCssValue 
]

{ #category : #'font properties' }
CssDeclarationBlock >> fontVariant: aCssValue [

	self propertyAt: 'font-variant' put: aCssValue 
]

{ #category : #'font properties' }
CssDeclarationBlock >> fontVariantCaps: aCssValue [

	self propertyAt: 'font-variant-caps' put: aCssValue 
]

{ #category : #'font properties' }
CssDeclarationBlock >> fontVariantLigatures: aCssValue [

	self propertyAt: 'font-variant-ligatures' put: aCssValue 
]

{ #category : #'font properties' }
CssDeclarationBlock >> fontVariantNumeric: aCssValue [

	self propertyAt: 'font-variant-numeric' put: aCssValue 
]

{ #category : #'font properties' }
CssDeclarationBlock >> fontVariantPosition: aCssValue [

	self propertyAt: 'font-variant-position' put: aCssValue 
]

{ #category : #'font properties' }
CssDeclarationBlock >> fontWeight: aCssValue [

	self propertyAt: 'font-weight' put: aCssValue 
]

{ #category : #'box properties' }
CssDeclarationBlock >> height: aWidth [

	self propertyAt: 'height' put: aWidth 
]

{ #category : #'text properties' }
CssDeclarationBlock >> hyphens: aCssValue [

	self propertyAt: 'hyphens' put: aCssValue 
]

{ #category : #'initialize-release' }
CssDeclarationBlock >> initialize [

	super initialize.
	declarations := OrderedCollection new.
	rulePrecedencePolicy := CssNormalRulePrecedencePolicy new
]

{ #category : #'visual formatting properties' }
CssDeclarationBlock >> left: aCssValue [

	self propertyAt: 'left' put: aCssValue 
]

{ #category : #'text properties' }
CssDeclarationBlock >> letterSpacing: aCssValue [

	self propertyAt: 'letter-spacing' put: aCssValue 
]

{ #category : #'box properties' }
CssDeclarationBlock >> lineHeight: aCssValue [

	self propertyAt: 'line-height' put: aCssValue 
]

{ #category : #'generated content properties' }
CssDeclarationBlock >> listStyle: aCssValue [

	self propertyAt: 'list-style' put: aCssValue 
]

{ #category : #'generated content properties' }
CssDeclarationBlock >> listStyleImage: aCssValue [

	self propertyAt: 'list-style-image' put: aCssValue 
]

{ #category : #'generated content properties' }
CssDeclarationBlock >> listStylePosition: aCssValue [

	self propertyAt: 'list-style-position' put: aCssValue 
]

{ #category : #'generated content properties' }
CssDeclarationBlock >> listStyleType: aCssValue [

	self propertyAt: 'list-style-type' put: aCssValue 
]

{ #category : #'box properties' }
CssDeclarationBlock >> margin: aMarginSpec [

	"The margin shorthand property sets all the margin properties in one declaration. 
	This property can have from one to four values. CSS1"
	
	self propertyAt: 'margin' put: aMarginSpec 
]

{ #category : #'box properties' }
CssDeclarationBlock >> marginBottom: aMarginWidth [

	self propertyAt: 'margin-bottom' put: aMarginWidth 
]

{ #category : #'box properties' }
CssDeclarationBlock >> marginLeft: aMarginWidth [

	self propertyAt: 'margin-left' put: aMarginWidth 
]

{ #category : #'box properties' }
CssDeclarationBlock >> marginRight: aMarginWidth [

	self propertyAt: 'margin-right' put: aMarginWidth 
]

{ #category : #'box properties' }
CssDeclarationBlock >> marginTop: aMarginWidth [

	self propertyAt: 'margin-top' put: aMarginWidth 
]

{ #category : #'box properties' }
CssDeclarationBlock >> maxHeight: aWidth [

	self propertyAt: 'max-height' put: aWidth 
]

{ #category : #'box properties' }
CssDeclarationBlock >> maxWidth: aWidth [

	self propertyAt: 'max-width' put: aWidth 
]

{ #category : #'box properties' }
CssDeclarationBlock >> minHeight: aWidth [

	self propertyAt: 'min-height' put: aWidth 
]

{ #category : #'box properties' }
CssDeclarationBlock >> minWidth: aWidth [

	self propertyAt: 'min-width' put: aWidth 
]

{ #category : #'color properties' }
CssDeclarationBlock >> opacity: alphaValue [
	"Opacity can be tought of as a postprocessing operation.
	Conceptually, after the element (including its descendants) is rendered into an RGBA offscren image, the opacity
	setting specifies how to blend the offscreen rendering into the current composite rendering. CSS3"

	self propertyAt: 'opacity' put: alphaValue 
]

{ #category : #'ui properties' }
CssDeclarationBlock >> outline: aCssValue [

	self propertyAt: 'outline' put:  aCssValue 
]

{ #category : #'ui properties' }
CssDeclarationBlock >> outlineColor: aCssValue [

	self propertyAt: 'outline-color' put:  aCssValue 
]

{ #category : #'ui properties' }
CssDeclarationBlock >> outlineStyle: aCssValue [

	self propertyAt: 'outline-style' put:  aCssValue 
]

{ #category : #'ui properties' }
CssDeclarationBlock >> outlineWidth: aCssValue [

	self propertyAt: 'outline-width' put:  aCssValue 
]

{ #category : #'visual effects properties' }
CssDeclarationBlock >> overflow: aCssValue [

	self propertyAt: 'overflow' put: aCssValue 
]

{ #category : #'visual effects properties' }
CssDeclarationBlock >> overflowX: aCssValue [

	self propertyAt: 'overflow-x' put: aCssValue 
]

{ #category : #'visual effects properties' }
CssDeclarationBlock >> overflowY: aCssValue [

	self propertyAt: 'overflow-y' put: aCssValue 
]

{ #category : #'box properties' }
CssDeclarationBlock >> padding: aPaddingSpec [
	
	self propertyAt: 'padding' put: aPaddingSpec 
]

{ #category : #'box properties' }
CssDeclarationBlock >> paddingBottom: aPaddingWidth [

	self propertyAt: 'padding-bottom' put: aPaddingWidth 
]

{ #category : #'box properties' }
CssDeclarationBlock >> paddingLeft: aPaddingWidth [

	self propertyAt: 'padding-left' put: aPaddingWidth 
]

{ #category : #'box properties' }
CssDeclarationBlock >> paddingRight: aPaddingWidth [

	self propertyAt: 'padding-right' put: aPaddingWidth  
]

{ #category : #'box properties' }
CssDeclarationBlock >> paddingTop: aPaddingWidth [

	self propertyAt: 'padding-top' put: aPaddingWidth 
]

{ #category : #'visual formatting properties' }
CssDeclarationBlock >> position: aCssValue [

	self propertyAt: 'position' put: aCssValue 
]

{ #category : #Printing }
CssDeclarationBlock >> printInlinedOn: aStream [

	declarations do: [ :declaration | declaration printOn: aStream ]
]

{ #category : #private }
CssDeclarationBlock >> propertyAt: aPropertyName put: aNamedConstantOrValue [

	declarations add: (rulePrecedencePolicy applyTo: (CssDeclaration property: aPropertyName value: (self class lookupValue: aNamedConstantOrValue)))
]

{ #category : #'generated content properties' }
CssDeclarationBlock >> quotes: aCssValue [

	self propertyAt: 'quotes' put: aCssValue 
]

{ #category : #'box properties' }
CssDeclarationBlock >> resize:  aCssValue [

	self propertyAt: 'resize' put: aCssValue 
]

{ #category : #'visual formatting properties' }
CssDeclarationBlock >> right: aCssValue [

	self propertyAt: 'right' put: aCssValue 
]

{ #category : #'font properties' }
CssDeclarationBlock >> src: aCssValue [

	self propertyAt: 'src' put: aCssValue 
]

{ #category : #'table properties' }
CssDeclarationBlock >> tableLayout: aCssValue [

	self propertyAt: 'table-layout' put: aCssValue 
]

{ #category : #'text properties' }
CssDeclarationBlock >> textAlign: aCssValue [

	self propertyAt: 'text-align' put: aCssValue 
]

{ #category : #'text properties' }
CssDeclarationBlock >> textDecoration: aCssValue [

	self propertyAt: 'text-decoration' put: aCssValue 
]

{ #category : #'text properties' }
CssDeclarationBlock >> textDecorationColor:  aCssValue [

	self propertyAt: 'text-decoration-color' put: aCssValue 
]

{ #category : #'text properties' }
CssDeclarationBlock >> textDecorationLine: aCssValue [

	self propertyAt: 'text-decoration-line' put: aCssValue 
]

{ #category : #'text properties' }
CssDeclarationBlock >> textDecorationStyle: aCssValue [

	self propertyAt: 'text-decoration-style' put: aCssValue 
]

{ #category : #'text properties' }
CssDeclarationBlock >> textEmphasis: aCssValue [

	self propertyAt: 'text-emphasis' put: aCssValue 
]

{ #category : #'text properties' }
CssDeclarationBlock >> textEmphasisColor:  aCssValue [

	self propertyAt: 'text-emphasis-color' put: aCssValue 
]

{ #category : #'text properties' }
CssDeclarationBlock >> textEmphasisPosition: aCssValue [

	self propertyAt: 'text-emphasis-position' put: aCssValue 
]

{ #category : #'text properties' }
CssDeclarationBlock >> textEmphasisStyle: aCssValue [

	self propertyAt: 'text-emphasis-style' put: aCssValue 
]

{ #category : #'text properties' }
CssDeclarationBlock >> textIndent: aCssValue [

	self propertyAt: 'text-indent' put: aCssValue 
]

{ #category : #'text properties' }
CssDeclarationBlock >> textOverflow: aCssValue [

	self propertyAt: 'text-overflow' put: aCssValue 
]

{ #category : #'text properties' }
CssDeclarationBlock >> textShadow: aCssValue [

	self propertyAt: 'text-shadow' put: aCssValue 
]

{ #category : #'text properties' }
CssDeclarationBlock >> textTransform: aCssValue [

	self propertyAt: 'text-transform' put: aCssValue 
]

{ #category : #'text properties' }
CssDeclarationBlock >> textUnderlinePosition: aCssValue [

	self propertyAt: 'text-underline-position' put: aCssValue 
]

{ #category : #'visual formatting properties' }
CssDeclarationBlock >> top: aCssValue [

	self propertyAt: 'top' put: aCssValue 
]

{ #category : #'visual formatting properties' }
CssDeclarationBlock >> transform: aCssValue [ 

	self propertyAt: 'transform' put: aCssValue 
]

{ #category : #'visual formatting properties' }
CssDeclarationBlock >> unicodeBidi: aCssValue [

	self propertyAt: 'unicode-bidi' put: aCssValue 
]

{ #category : #'box properties' }
CssDeclarationBlock >> verticalAlign: aCssValue [

	self propertyAt: 'vertical-align' put: aCssValue 
]

{ #category : #'visual effects properties' }
CssDeclarationBlock >> visibility: aCssValue [

	self propertyAt: 'visibility' put: aCssValue 
]

{ #category : #'text properties' }
CssDeclarationBlock >> whiteSpace: aCssValue [

	self propertyAt: 'white-space' put: aCssValue 
]

{ #category : #'box properties' }
CssDeclarationBlock >> width: aWidth [

	self propertyAt: 'width' put: aWidth 
]

{ #category : #'text properties' }
CssDeclarationBlock >> wordSpacing: aCssValue [

	self propertyAt: 'word-spacing' put: aCssValue 
]

{ #category : #'text properties' }
CssDeclarationBlock >> wordWrap: aCssValue [ 
	self propertyAt: 'word-wrap' put: aCssValue 
]

{ #category : #'visual formatting properties' }
CssDeclarationBlock >> zIndex: aCssValue [

	self propertyAt: 'z-index' put: aCssValue 
]
