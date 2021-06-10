"
The RGB color model is used in numerical color specifications.
"
Class {
	#name : #CssRGBColor,
	#superclass : #CssColor,
	#instVars : [
		'redComponent',
		'greenComponent',
		'blueComponent',
		'alphaChannel'
	],
	#category : #'RenoirSt-Core-Colors'
}

{ #category : #'Instance Creation' }
CssRGBColor class >> red: aRedComponent green: aGreenComponent blue: aBlueComponent [
	
	^ self
		red: aRedComponent
		green: aGreenComponent
		blue: aBlueComponent
		alphaChannel: CssNoAlphaChannelProvided new
]

{ #category : #'Instance Creation' }
CssRGBColor class >> red: aRedComponent green: aGreenComponent blue: aBlueComponent alpha: aNumber [
	
	^ self
		red: aRedComponent
		green: aGreenComponent
		blue: aBlueComponent
		alphaChannel: (CssAlphaChannelProvided withValue: aNumber)
]

{ #category : #private }
CssRGBColor class >> red: aRedComponent green: aGreenComponent blue: aBlueComponent alphaChannel: theAlphaChannelInfo [
	
	^ self new
		initializeRed: aRedComponent
		green: aGreenComponent
		blue: aBlueComponent
		alphaChannel: theAlphaChannelInfo
]

{ #category : #private }
CssRGBColor >> componentsDo: aBlockClosure separatedBy: aSeparationBlock [
	
	aBlockClosure value: redComponent.
	aSeparationBlock value.
	aBlockClosure value: greenComponent.
	aSeparationBlock value.
	aBlockClosure value: blueComponent.
	alphaChannel componentsDo: aBlockClosure separatedBy: aSeparationBlock 
]

{ #category : #private }
CssRGBColor >> functionName [
	^ alphaChannel functionNameFor: 'rgb'
]

{ #category : #initialization }
CssRGBColor >> initializeRed: aRedComponent green: aGreenComponent blue: aBlueComponent alphaChannel: theAlphaChannelInfo [
	
	redComponent := aRedComponent.
	greenComponent := aGreenComponent.
	blueComponent := aBlueComponent.
	alphaChannel := theAlphaChannelInfo
]

{ #category : #converting }
CssRGBColor >> newWithAlpha: alphaValue [

	^ self class
		red: redComponent
		green: greenComponent
		blue: blueComponent
		alpha: alphaValue
]
