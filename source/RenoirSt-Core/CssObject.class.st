"
A CssObject is the abstract superclass of the CSS renderable objects

"
Class {
	#name : #CssObject,
	#superclass : #Object,
	#pools : [
		'RenoirSt'
	],
	#category : #'RenoirSt-Core-Common'
}

{ #category : #'private - converting' }
CssObject class >> lookupColor: aNamedConstantOrCssColor [

	"Lookup the SVG colors namespace, if no named constant is found return the argument"

	^ CssConstants >> #colors at: aNamedConstantOrCssColor ifAbsent: [ aNamedConstantOrCssColor ]
]

{ #category : #'private - converting' }
CssObject class >> lookupValue: aNamedConstantOrValue [

	"Lookup the CSS namespace and the SVG colors namespace, if no named constant is found returns the argument"

	^ (aNamedConstantOrValue isCollection and: [ aNamedConstantOrValue isString not ])
		then: [ aNamedConstantOrValue collect: [ :each | self lookupValue: each ] ]
		otherwise: [ CssConstants at: aNamedConstantOrValue ifAbsent: [ self lookupColor: aNamedConstantOrValue ] ]
]

{ #category : #Printing }
CssObject >> cssContentOn: aStream [

	self subclassResponsibility 
]

{ #category : #Printing }
CssObject >> printOn: aStream [

	self cssContentOn: aStream 
]
