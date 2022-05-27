"
A CssDeclarationBlockTest is a test class for testing the behavior of CssDeclarationBlock
"
Class {
	#name : #CssDeclarationBlockTest,
	#superclass : #TestCase,
	#category : #'RenoirSt-Tests-Common'
}

{ #category : #private }
CssDeclarationBlockTest >> assert: aBlockClosure rendersProperty: aPropertyName withValue: anExpectedValue [

	| style |

	style := CssDeclarationBlock new.
	aBlockClosure cull: style.

	self
		assert: style printString
		equals: ('{<n><t><1s>: <2s>;<n>}' expandMacrosWith: aPropertyName with: anExpectedValue)
]

{ #category : #Tests }
CssDeclarationBlockTest >> testPrintInlined [

	| style |

	style := CssDeclarationBlock new.
	style
		borderWidth: #thin;
		borderStyle: #dashed;
		borderRadius: 4 px.

	self assert: (String streamContents: [ :stream | style printInlinedOn: stream ]) equals: 'border-width: thin;border-style: dashed;border-radius: 4px;'
]

{ #category : #Tests }
CssDeclarationBlockTest >> testPrintStringOfBackgroundProperties [

	self
		assert: [ :style | style background: #blue ] rendersProperty: 'background' withValue: 'blue';
		assert: [ :style | style backgroundAttachment: #scroll ] rendersProperty: 'background-attachment' withValue: 'scroll';
		assert: [ :style | style backgroundColor: #yellowGreen ] rendersProperty: 'background-color' withValue: 'yellowgreen';
		assert: [ :style | style backgroundImage: 'logo.png' ] rendersProperty: 'background-image' withValue: 'logo.png';
		assert: [ :style | style backgroundPosition: {0 percent. 0 percent} ] rendersProperty: 'background-position' withValue: '0% 0%';
		assert: [ :style | style backgroundRepeat: #repeat ] rendersProperty: 'background-repeat' withValue: 'repeat';
		assert: [ :style | style backgroundSize: #contain ] rendersProperty: 'background-size' withValue: 'contain';
		assert: [ :style | style backgroundClip: #borderBox ] rendersProperty: 'background-clip' withValue: 'border-box';
		assert: [ :style | style backgroundOrigin: #borderBox ] rendersProperty: 'background-origin' withValue: 'border-box'
]

{ #category : #Tests }
CssDeclarationBlockTest >> testPrintStringOfBorderImageProperties [

	self
		assert: [ :style | style borderImageSource: #none ] rendersProperty: 'border-image-source' withValue: 'none';
		assert: [ :style | style borderImageSlice: 50 percent ] rendersProperty: 'border-image-slice' withValue: '50%';
		assert: [ :style | style borderImageWidth: 2 px ] rendersProperty: 'border-image-width' withValue: '2px';
		assert: [ :style | style borderImageOutset: 3 px ] rendersProperty: 'border-image-outset' withValue: '3px';
		assert: [ :style | style borderImageRepeat: #round ] rendersProperty: 'border-image-repeat' withValue: 'round';
		assert: [ :style | style borderImage: #none ] rendersProperty: 'border-image' withValue: 'none';
		assert: [ :style | 
			style
				boxShadow:
					(CssBoxShadow
						horizontalOffset: 10 px
						verticalOffset: 10 px
						blurRadius: 10 px
						spreadDistance: 35 px
						color: #blue) ]
			rendersProperty: 'box-shadow'
			withValue: '10px 10px 10px 35px blue'
]

{ #category : #Tests }
CssDeclarationBlockTest >> testPrintStringOfBorderProperties [

	self
		assert: [ :style | style border: #(#thin #dashed #royalBlue) ] rendersProperty: 'border' withValue: 'thin dashed royalblue';
		assert: [ :style | style borderBottom: #(#thin #dashed #royalBlue) ] rendersProperty: 'border-bottom' withValue: 'thin dashed royalblue';
		assert: [ :style | style borderTop: #(#thin #dashed #royalBlue) ] rendersProperty: 'border-top' withValue: 'thin dashed royalblue';
		assert: [ :style | style borderRight: #(#thin #dashed #royalBlue) ] rendersProperty: 'border-right' withValue: 'thin dashed royalblue';
		assert: [ :style | style borderLeft: #(#thin #dashed #royalBlue) ] rendersProperty: 'border-left' withValue: 'thin dashed royalblue';
		assert: [ :style | style borderColor: #royalBlue ] rendersProperty: 'border-color' withValue: 'royalblue';
		assert: [ :style | style borderWidth: #thin ] rendersProperty: 'border-width' withValue: 'thin';
		assert: [ :style | style borderStyle: #dashed ] rendersProperty: 'border-style' withValue: 'dashed';
		assert: [ :style | style borderTopColor: #royalBlue ] rendersProperty: 'border-top-color' withValue: 'royalblue';
		assert: [ :style | style borderTopWidth: #thin ] rendersProperty: 'border-top-width' withValue: 'thin';
		assert: [ :style | style borderTopStyle: #dashed ] rendersProperty: 'border-top-style' withValue: 'dashed';
		assert: [ :style | style borderBottomColor: #royalBlue ] rendersProperty: 'border-bottom-color' withValue: 'royalblue';
		assert: [ :style | style borderBottomWidth: #thin ] rendersProperty: 'border-bottom-width' withValue: 'thin';
		assert: [ :style | style borderBottomStyle: #dashed ] rendersProperty: 'border-bottom-style' withValue: 'dashed';
		assert: [ :style | style borderLeftColor: #royalBlue ] rendersProperty: 'border-left-color' withValue: 'royalblue';
		assert: [ :style | style borderLeftWidth: #thin ] rendersProperty: 'border-left-width' withValue: 'thin';
		assert: [ :style | style borderLeftStyle: #dashed ] rendersProperty: 'border-left-style' withValue: 'dashed';
		assert: [ :style | style borderRightColor: #royalBlue ] rendersProperty: 'border-right-color' withValue: 'royalblue';
		assert: [ :style | style borderRightWidth: #thin ] rendersProperty: 'border-right-width' withValue: 'thin';
		assert: [ :style | style borderRightStyle: #dashed ] rendersProperty: 'border-right-style' withValue: 'dashed';
		assert: [ :style | style borderRadius: 4 px ] rendersProperty: 'border-radius' withValue: '4px';
		assert: [ :style | style borderTopLeftRadius: 1 px ] rendersProperty: 'border-top-left-radius' withValue: '1px';
		assert: [ :style | style borderBottomLeftRadius: 1 px ] rendersProperty: 'border-bottom-left-radius' withValue: '1px';
		assert: [ :style | style borderTopRightRadius: 1 px ] rendersProperty: 'border-top-right-radius' withValue: '1px';
		assert: [ :style | style borderBottomRightRadius: 1 px ] rendersProperty: 'border-bottom-right-radius' withValue: '1px'
]

{ #category : #Tests }
CssDeclarationBlockTest >> testPrintStringOfBoxProperties [

	self
		assert: [ :style | style height: 5 cm ] rendersProperty: 'height' withValue: '5cm';
		assert: [ :style | style maxHeight: 5 cm ] rendersProperty: 'max-height' withValue: '5cm';
		assert: [ :style | style minHeight: 5 cm ] rendersProperty: 'min-height' withValue: '5cm';
		assert: [ :style | style width: 5 cm ] rendersProperty: 'width' withValue: '5cm';
		assert: [ :style | style maxWidth: 5 cm ] rendersProperty: 'max-width' withValue: '5cm';
		assert: [ :style | style minWidth: 5 cm ] rendersProperty: 'min-width' withValue: '5cm';
		assert: [ :style | style lineHeight: 1.2 ] rendersProperty: 'line-height' withValue: '1.2';
		assert: [ :style | style verticalAlign: #middle ] rendersProperty: 'vertical-align' withValue: 'middle';
		assert: [ :style | style resize: #none ] rendersProperty: 'resize' withValue: 'none'
]

{ #category : #Tests }
CssDeclarationBlockTest >> testPrintStringOfColorProperties [

	self
		assert: [ :style | style opacity: 0 ] rendersProperty: 'opacity' withValue: '0';
		assert: [ :style | style color: #yellow ] rendersProperty: 'color' withValue: 'yellow'
]

{ #category : #Tests }
CssDeclarationBlockTest >> testPrintStringOfEmptyDeclarationBlock [

	self assert: CssDeclarationBlock new printString equals: '{<n>}' expandMacros
]

{ #category : #Tests }
CssDeclarationBlockTest >> testPrintStringOfFontProperties [

	self
		assert: [ :style | style font: 14 pt ] rendersProperty: 'font' withValue: '14pt';
		assert: [ :style | style fontSize: 14 pt ] rendersProperty: 'font-size' withValue: '14pt';
		assert: [ :style | style fontSizeAdjust: 0.5 ] rendersProperty: 'font-size-adjust' withValue: '0.5';
		assert: [ :style | style fontFamily: #sansSerif ] rendersProperty: 'font-family' withValue: 'sans-serif';
		assert: [ :style | style fontStyle: #italic ] rendersProperty: 'font-style' withValue: 'italic';
		assert: [ :style | style fontVariant: #smallCaps ] rendersProperty: 'font-variant' withValue: 'small-caps';
		assert: [ :style | style fontWeight: #bolder ] rendersProperty: 'font-weight' withValue: 'bolder';
		assert: [ :style | style color: #goldenrod ] rendersProperty: 'color' withValue: 'goldenrod';
		assert: [ :style | style fontStretch: #ultraCondensed ] rendersProperty: 'font-stretch' withValue: 'ultra-condensed';
		assert: [ :style | style fontSynthesis: #(#weight #style) ] rendersProperty: 'font-synthesis' withValue: 'weight style';
		assert: [ :style | style fontKerning: #auto ] rendersProperty: 'font-kerning' withValue: 'auto'
]

{ #category : #Tests }
CssDeclarationBlockTest >> testPrintStringOfGeneratedContentProperties [

	self
		assert: [ :style | style content: '"hello"' ] rendersProperty: 'content' withValue: '"hello"';
		assert: [ :style | style counterIncrement: 'chapter' ] rendersProperty: 'counter-increment' withValue: 'chapter';
		assert: [ :style | style counterReset: 'chapter' ] rendersProperty: 'counter-reset' withValue: 'chapter';
		assert: [ :style | style listStyle: #lowerAlpha ] rendersProperty: 'list-style' withValue: 'lower-alpha';
		assert: [ :style | style listStyleType: #circle ] rendersProperty: 'list-style-type' withValue: 'circle';
		assert: [ :style | style listStyleImage: #none ] rendersProperty: 'list-style-image' withValue: 'none';
		assert: [ :style | style listStylePosition: #inside ] rendersProperty: 'list-style-position' withValue: 'inside';
		assert: [ :style | style quotes: {'"<"' . '">"'} ] rendersProperty: 'quotes' withValue: '"<" ">"'
]

{ #category : #Tests }
CssDeclarationBlockTest >> testPrintStringOfKeyframesProperties [

	self
		assert: [ :style | style animationName: 'testAnimation' ] rendersProperty: 'animation-name' withValue: 'testAnimation';
		assert: [ :style | style animationDuration: '5s' ] rendersProperty: 'animation-duration' withValue: '5s';
		assert: [ :style | style animationTimingFunction: 'linear' ] rendersProperty: 'animation-timing-function' withValue: 'linear';
		assert: [ :style | style animationDelay: '5s' ] rendersProperty: 'animation-delay' withValue: '5s';
		assert: [ :style | style animationIterationCount: 2 ] rendersProperty: 'animation-iteration-count' withValue: '2';
		assert: [ :style | style animationDirection: 'normal' ] rendersProperty: 'animation-direction' withValue: 'normal';
		assert: [ :style | style animationFillMode: 'forwards' ] rendersProperty: 'animation-fill-mode' withValue: 'forwards';
		assert: [ :style | style animationPlayState: 'running' ] rendersProperty: 'animation-play-state' withValue: 'running';
		
		assert: [ :style | style animation: 'test 5s ease 0s infinite normal backwards running' ] rendersProperty: 'animation' withValue: 
			'test 5s ease 0s infinite normal backwards running'
]

{ #category : #Tests }
CssDeclarationBlockTest >> testPrintStringOfMarginProperties [

	self 
		assert: [ :style | style margin: 5 cm ] rendersProperty: 'margin' withValue: '5cm';
		assert: [ :style | style marginLeft: 5 cm ] rendersProperty: 'margin-left' withValue: '5cm';
		assert: [ :style | style marginRight: 5 cm ] rendersProperty: 'margin-right' withValue: '5cm';
		assert: [ :style | style marginTop: 5 cm ] rendersProperty: 'margin-top' withValue: '5cm';
		assert: [ :style | style marginBottom: 5 cm ] rendersProperty: 'margin-bottom' withValue: '5cm'
]

{ #category : #Tests }
CssDeclarationBlockTest >> testPrintStringOfMoreFontProperties [

	self
		assert: [ :style | style fontVariantLigatures: #(#commonLigatures #noDiscretionaryLigatures #historicalLigatures #contextual) ]
			rendersProperty: 'font-variant-ligatures'
			withValue: 'common-ligatures no-discretionary-ligatures historical-ligatures contextual';
		assert: [ :style | style fontVariantPosition: #sub ] rendersProperty: 'font-variant-position' withValue: 'sub';
		assert: [ :style | style fontVariantCaps: #smallCaps ] rendersProperty: 'font-variant-caps' withValue: 'small-caps';
		assert: [ :style | style fontVariantNumeric: #ordinal ] rendersProperty: 'font-variant-numeric' withValue: 'ordinal'
]

{ #category : #Tests }
CssDeclarationBlockTest >> testPrintStringOfNotEmptyDeclarationBlock [

	self
		assert:
			(CssDeclarationBlock new
				color: 'red';
				yourself) printString
		equals: '{<n><t>color: red;<n>}' expandMacros
]

{ #category : #Tests }
CssDeclarationBlockTest >> testPrintStringOfNotEmptyDeclarationBlockWithImportantRules [
	self
		assert:
			(CssDeclarationBlock new
				color: 'red';
				beImportantDuring: [ :declarationBlock | declarationBlock margin: 1 px ];
				padding: 2 px;
				yourself) printString
		equals: '{<n><t>color: red;<n><t>margin: 1px !important;<n><t>padding: 2px;<n>}' expandMacros
]

{ #category : #Tests }
CssDeclarationBlockTest >> testPrintStringOfPaddingProperties [

	self 
		assert: [ :style | style padding: 5 cm ] rendersProperty: 'padding' withValue: '5cm';
		assert: [ :style | style paddingLeft: 5 cm ] rendersProperty: 'padding-left' withValue: '5cm';
		assert: [ :style | style paddingRight: 5 cm ] rendersProperty: 'padding-right' withValue: '5cm';
		assert: [ :style | style paddingTop: 5 cm ] rendersProperty: 'padding-top' withValue: '5cm';
		assert: [ :style | style paddingBottom: 5 cm ] rendersProperty: 'padding-bottom' withValue: '5cm'
]

{ #category : #Tests }
CssDeclarationBlockTest >> testPrintStringOfTableProperties [

	self
		assert: [ :style | style borderCollapse: #collapse ] rendersProperty: 'border-collapse' withValue: 'collapse';
		assert: [ :style | style borderSpacing: 15 pt ] rendersProperty: 'border-spacing' withValue: '15pt';
		assert: [ :style | style captionSide: #bottom ] rendersProperty: 'caption-side' withValue: 'bottom';
		assert: [ :style | style emptyCells: #hide ] rendersProperty: 'empty-cells' withValue: 'hide';
		assert: [ :style | style tableLayout: #fixed ] rendersProperty: 'table-layout' withValue: 'fixed'
]

{ #category : #Tests }
CssDeclarationBlockTest >> testPrintStringOfTextDecorationProperties [

	self
		assert: [ :style | style textDecorationLine: #underline ] rendersProperty: 'text-decoration-line' withValue: 'underline';
		assert: [ :style | style textDecorationColor: #red ] rendersProperty: 'text-decoration-color' withValue: 'red';
		assert: [ :style | style textDecorationStyle: #solid ] rendersProperty: 'text-decoration-style' withValue: 'solid';
		assert: [ :style | style textUnderlinePosition: #under ] rendersProperty: 'text-underline-position' withValue: 'under';
		assert: [ :style | style textEmphasisStyle: #filled ] rendersProperty: 'text-emphasis-style' withValue: 'filled';
		assert: [ :style | style textEmphasisColor: #red ] rendersProperty: 'text-emphasis-color' withValue: 'red';
		assert: [ :style | style textEmphasisPosition: #over ] rendersProperty: 'text-emphasis-position' withValue: 'over';
		assert: [ :style | style textEmphasis: #filled ] rendersProperty: 'text-emphasis' withValue: 'filled';
		assert: [ :style | style textShadow: #none ] rendersProperty: 'text-shadow' withValue: 'none'
]

{ #category : #Tests }
CssDeclarationBlockTest >> testPrintStringOfTextProperties [

	self
		assert: [ :style | style hyphens: #auto ] rendersProperty: 'hyphens' withValue: 'auto';
		assert: [ :style | style letterSpacing: #normal ] rendersProperty: 'letter-spacing' withValue: 'normal';
		assert: [ :style | style textAlign: #center ] rendersProperty: 'text-align' withValue: 'center';
		assert: [ :style | style textDecoration: #underline ] rendersProperty: 'text-decoration' withValue: 'underline';
		assert: [ :style | style textIndent: 5 percent ] rendersProperty: 'text-indent' withValue: '5%';
		assert: [ :style | style textTransform: #capitalize ] rendersProperty: 'text-transform' withValue: 'capitalize';
		assert: [ :style | style whiteSpace: #nowrap ] rendersProperty: 'white-space' withValue: 'nowrap';
		assert: [ :style | style wordSpacing: #normal ] rendersProperty: 'word-spacing' withValue: 'normal';
		assert: [ :style | style wordWrap: #breakWord ] rendersProperty: 'word-wrap' withValue: 'break-word';
		assert: [ :style | style textOverflow: #ellipsis ] rendersProperty: 'text-overflow' withValue: 'ellipsis'
]

{ #category : #Tests }
CssDeclarationBlockTest >> testPrintStringOfUIProperties [

	self
		assert: [ :style | style cursor: #auto ] rendersProperty: 'cursor' withValue: 'auto';
		assert: [ :style | style outline: #dotted ] rendersProperty: 'outline' withValue: 'dotted';
		assert: [ :style | style outlineColor: #black ] rendersProperty: 'outline-color' withValue: 'black';
		assert: [ :style | style outlineStyle: #dotted ] rendersProperty: 'outline-style' withValue: 'dotted';
		assert: [ :style | style outlineWidth: 2 px ] rendersProperty: 'outline-width' withValue: '2px'
]

{ #category : #Tests }
CssDeclarationBlockTest >> testPrintStringOfVisualEffectProperties [

	self
		assert: [ :style | style clip: #auto ] rendersProperty: 'clip' withValue: 'auto';
		assert: [ :style | style overflow: #hidden ] rendersProperty: 'overflow' withValue: 'hidden';
		assert: [ :style | style visibility: #collapse ] rendersProperty: 'visibility' withValue: 'collapse';
		assert: [ :style | style overflowY: #hidden ] rendersProperty: 'overflow-y' withValue: 'hidden';
		assert: [ :style | style overflowX: #hidden ] rendersProperty: 'overflow-x' withValue: 'hidden'
]

{ #category : #Tests }
CssDeclarationBlockTest >> testPrintStringOfVisualFormattingProperties [

	self
		assert: [ :style | style bottom: 4 cm ] rendersProperty: 'bottom' withValue: '4cm';
		assert: [ :style | style clear: #both ] rendersProperty: 'clear' withValue: 'both';
		assert: [ :style | style direction: 'ltr' ] rendersProperty: 'direction' withValue: 'ltr';
		assert: [ :style | style display: #block ] rendersProperty: 'display' withValue: 'block';
		assert: [ :style | style float: #left ] rendersProperty: 'float' withValue: 'left';
		assert: [ :style | style left: 4 cm ] rendersProperty: 'left' withValue: '4cm';
		assert: [ :style | style position: #relative ] rendersProperty: 'position' withValue: 'relative';
		assert: [ :style | style right: 4 cm ] rendersProperty: 'right' withValue: '4cm';
		assert: [ :style | style top: 4 cm ] rendersProperty: 'top' withValue: '4cm';
		assert: [ :style | style unicodeBidi: #normal ] rendersProperty: 'unicode-bidi' withValue: 'normal';
		assert: [ :style | style zIndex: 4 ] rendersProperty: 'z-index' withValue: '4';
		assert: [ :style | style transform: #'rotate(0deg)' ] rendersProperty: 'transform' withValue: 'rotate(0deg)'
]

{ #category : #Tests }
CssDeclarationBlockTest >> testPrintStringWithSeveralDeclarations [

	| declarationBlock |
	declarationBlock := CssDeclarationBlock new.
	declarationBlock
		color: #red;
		margin: {1 px. 3 pc. 4 pt. 50 percent}.

	self assert: declarationBlock printString equals: ('{<n><t>color: red;<n><t>margin: 1px 3pc 4pt 50<1s>;<n>}' expandMacrosWith: '%')
]
