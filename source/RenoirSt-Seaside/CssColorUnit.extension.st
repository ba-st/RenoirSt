Extension { #name : 'CssColorUnit' }

{ #category : '*RenoirSt-Seaside' }
CssColorUnit >> javascriptOn: aRenderer [

	aRenderer string: ( String streamContents: [ :stream | self cssContentOn: stream ] )
]
