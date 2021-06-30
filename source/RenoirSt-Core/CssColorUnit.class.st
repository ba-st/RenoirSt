"
A CssColorUnit is an abstract color unit for CSS
"
Class {
	#name : #CssColorUnit,
	#superclass : #CssObject,
	#category : #'RenoirSt-Core-Colors'
}

{ #category : #converting }
CssColorUnit >> identifiedBy: aString [

	self subclassResponsibility 
]

{ #category : #converting }
CssColorUnit >> newWithAlpha: alphaValue [ 

	self subclassResponsibility 
]
