Extension { #name : 'CssDeclarationBlock' }

{ #category : '*RenoirSt-Seaside' }
CssDeclarationBlock >> greaseString [

	^ String streamContents: [ :stream | self printInlinedOn: stream ]
]

{ #category : '*RenoirSt-Seaside' }
CssDeclarationBlock >> javascriptOn: aStream [

	aStream nextPut: ${.
	declarations do: [ :declaration | aStream javascript: declaration ] separatedBy: [ aStream nextPut: $, ].
	aStream nextPut: $}
]
