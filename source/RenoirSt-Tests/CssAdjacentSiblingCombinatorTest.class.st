"
A CssAdjacentSiblingCombinatorTest is a test class for testing the behavior of CssAdjacentSiblingCombinator
"
Class {
	#name : #CssAdjacentSiblingCombinatorTest,
	#superclass : #TestCase,
	#category : #'RenoirSt-Tests-Selectors'
}

{ #category : #Tests }
CssAdjacentSiblingCombinatorTest >> testBuildingShortcut [

	| parent child |
	
	parent := CssUniversalSelector implicit class: 'custom'.
	child := CssTypeSelector ofType: 'div'.
	
	self assert: (parent + child) printString equals: '.custom + div'
]

{ #category : #Tests }
CssAdjacentSiblingCombinatorTest >> testPrintString [

	| predecessor successor |
	
	predecessor := CssUniversalSelector implicit class: 'custom'.
	successor := CssTypeSelector ofType: 'div'.
	
	self assert: (CssAdjacentSiblingCombinator between: predecessor and: successor) printString equals: '.custom + div'
]
