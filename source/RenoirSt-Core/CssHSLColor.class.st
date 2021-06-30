"
HSL colors are encoding as a triple (hue, saturation, lightness). 
Hue is represented as an angle of the color circle. 
Saturation and lightness are represented as percentages. 100% is full saturation, and 0% is a shade of gray. 0% lightness is black, 100% lightness is white, and 50% lightness is “normal”.
"
Class {
	#name : #CssHSLColor,
	#superclass : #CssColor,
	#instVars : [
		'hue',
		'saturation',
		'lightness',
		'alphaChannel'
	],
	#category : #'RenoirSt-Core-Colors'
}

{ #category : #'Instance Creation' }
CssHSLColor class >> hue: aHueValueInDegrees saturation: aSaturationPercentage lightness: aLightnessPercentage [ 
	
	^self hue: aHueValueInDegrees saturation: aSaturationPercentage lightness: aLightnessPercentage alphaChannel: CssNoAlphaChannelProvided new
]

{ #category : #'Instance Creation' }
CssHSLColor class >> hue: aHueValueInDegrees saturation: aSaturationPercentage lightness: aLightnessPercentage alpha: aNumber [
	
	^ self
		hue: aHueValueInDegrees
		saturation: aSaturationPercentage
		lightness: aLightnessPercentage
		alphaChannel: (CssAlphaChannelProvided withValue: aNumber)
]

{ #category : #private }
CssHSLColor class >> hue: aHueValueInDegrees saturation: aSaturationPercentage lightness: aLightnessPercentage alphaChannel: aCssAlphaChannel [
	
	^ self new
		initializeHue: aHueValueInDegrees
		saturation: aSaturationPercentage
		lightness: aLightnessPercentage
		alphaChannel: aCssAlphaChannel
]

{ #category : #private }
CssHSLColor >> componentsDo: aBlockClosure separatedBy: aSeparationBlock [

	aBlockClosure value: hue.
	aSeparationBlock value.
	aBlockClosure value: saturation .
	aSeparationBlock value.
	aBlockClosure value: lightness .
	alphaChannel componentsDo: aBlockClosure separatedBy: aSeparationBlock
	
]

{ #category : #private }
CssHSLColor >> functionName [

	^ alphaChannel functionNameFor: 'hsl'
]

{ #category : #initialization }
CssHSLColor >> initializeHue: aHueValueInDegrees saturation: aSaturationPercentage lightness: aLightnessPercentage alphaChannel: aCssAlphaChannel [
	
	hue := aHueValueInDegrees.
	saturation := aSaturationPercentage.
	lightness := aLightnessPercentage.
	alphaChannel := aCssAlphaChannel
]

{ #category : #converting }
CssHSLColor >> newWithAlpha: alphaValue [

	^ self class
		hue: hue
		saturation: saturation
		lightness: lightness
		alpha: alphaValue
]
