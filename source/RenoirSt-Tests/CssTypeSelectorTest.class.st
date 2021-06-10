"
A TypeSelectorTest is a test class for testing the behavior of TypeSelector
"
Class {
	#name : #CssTypeSelectorTest,
	#superclass : #TestCase,
	#category : #'RenoirSt-Tests-Selectors'
}

{ #category : #Tests }
CssTypeSelectorTest >> testBuildingShortcut [
	
	| firstSelector  |
	
	firstSelector := CssUniversalSelector implicit class: 'custom'.
	
	self assert: (firstSelector descendantOfType: 'div') printString equals: '.custom div'
]

{ #category : #Tests }
CssTypeSelectorTest >> testPrintString [

	self assert: (CssTypeSelector ofType: 'h1') printString equals: 'h1'
]
