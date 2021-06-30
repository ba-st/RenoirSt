"
A CssColor is a color suitable for use in CSS

"
Class {
	#name : #CssColor,
	#superclass : #CssColorUnit,
	#category : #'RenoirSt-Core-Colors'
}

{ #category : #private }
CssColor >> componentsDo: aBlockClosure separatedBy: aSeparationBlock [ 
	
	self subclassResponsibility 
]

{ #category : #printing }
CssColor >> cssContentOn: aWriteStream [
	aWriteStream
		nextPutAll: self functionName;
		nextPut: $(.
	self componentsDo: [ :component | component cssContentOn: aWriteStream ] separatedBy: [ aWriteStream nextPut: $, ].
	aWriteStream nextPut: $)
]

{ #category : #private }
CssColor >> functionName [
	
	self subclassResponsibility 
]

{ #category : #converting }
CssColor >> identifiedBy: aString [

	 ^CssIdentifiedColor representing: self identifiedBy: aString 
]
