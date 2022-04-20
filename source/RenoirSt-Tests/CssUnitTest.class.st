"
A CssUnitTest is a test class for testing the behavior of CssUnit
"
Class {
	#name : #CssUnitTest,
	#superclass : #TestCase,
	#category : #'RenoirSt-Tests-Units'
}

{ #category : #Tests }
CssUnitTest >> testCantCreateWithEmptyIdentifier [
	
	self
		should: [ CssUnit identifiedBy: '' ]
		raise: InstanceCreationFailed
		withMessageText: 'A unit identifier can''t be empty'
]

{ #category : #Tests }
CssUnitTest >> testInstanceCreation [

	| unit |
	unit := CssUnit identifiedBy: 'px'.

	self assert: unit printString equals: 'px'
]
