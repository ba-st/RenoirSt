Extension { #name : 'WAUrl' }

{ #category : '*RenoirSt-Seaside' }
WAUrl >> cssContentOn: aStream [

	aStream nextPutAll: 'url("'.
	host
		ifNil: [ aStream nextPut: $/.
			self path do: [ :segment | aStream nextPutAll: segment ] separatedBy: [ aStream nextPut: $/ ]
			]
		ifNotNil: [ self printOn: aStream ].
	aStream nextPutAll: '")'
]

{ #category : '*RenoirSt-Seaside' }
WAUrl >> cssContentRelativeToStyleSheetOn: aStream [

	aStream nextPutAll: 'url("'.
	host
		ifNil: [ self path do: [ :segment | aStream nextPutAll: segment ] separatedBy: [ aStream nextPut: $/ ] ]
		ifNotNil: [ self printOn: aStream ].
	aStream nextPutAll: '")'
]

{ #category : '*RenoirSt-Seaside' }
WAUrl >> relativeToStyleSheet [

	^UrlRelativeToStyleSheet on: self
]
