Extension { #name : 'CssAbstractDeclaration' }

{ #category : '*RenoirSt-Seaside' }
CssAbstractDeclaration >> javascriptOn: aRenderer [

	aRenderer
		key: [
			aRenderer string: ( String streamContents: [ :stream | self property cssContentOn: stream ] ) ]
		value: [
			aRenderer string: ( String streamContents: [ :stream | self value cssContentOn: stream ] ) ]
]
