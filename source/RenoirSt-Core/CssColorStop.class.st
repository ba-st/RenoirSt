"
A CssColorStop determines an specific position for a color in the gradient

"
Class {
	#name : #CssColorStop,
	#superclass : #CssObject,
	#instVars : [
		'color',
		'stop'
	],
	#category : #'RenoirSt-Core-Colors'
}

{ #category : #'Instance Creation' }
CssColorStop class >> for: aCssColor at: aLength [

	^ self new initializeFor: (self lookupColor: aCssColor) at: aLength
]

{ #category : #Printing }
CssColorStop >> cssContentOn: aWriteStream [ 
	
	color cssContentOn: aWriteStream.
	aWriteStream space.
	stop cssContentOn: aWriteStream 
]

{ #category : #'initialize-release' }
CssColorStop >> initializeFor: aCssColor at: aLength [
	color := aCssColor.
	stop := aLength
]
