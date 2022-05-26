Extension { #name : #Float }

{ #category : #'*RenoirSt-Core' }
Float >> cm [

	^ self newMeasureWith: RenoirSt units >> #centimeter
]

{ #category : #'*RenoirSt-Core' }
Float >> cssContentOn: aStream [ 
	
	aStream nextPutAll: self printString
]

{ #category : #'*RenoirSt-Core' }
Float >> deg [

	 ^self newMeasureWith: RenoirSt units >> #degree    
]

{ #category : #'*RenoirSt-Core' }
Float >> em [

	^ self newMeasureWith: RenoirSt units >> #fontSize
]

{ #category : #'*RenoirSt-Core' }
Float >> grad [

	^ self newMeasureWith: RenoirSt units >> #gradian
]

{ #category : #'*RenoirSt-Core' }
Float >> in [

	^ self newMeasureWith: RenoirSt units >> #inch
]

{ #category : #'*RenoirSt-Core' }
Float >> mm [

	^ self newMeasureWith: RenoirSt units >> #millimeter
]

{ #category : #'*RenoirSt-Core' }
Float >> ms [

	^ self newMeasureWith: RenoirSt units >> #millisecond
]

{ #category : #'*RenoirSt-Core' }
Float >> newMeasureWith: unit [
	^ CssMeasure quantity: self unit: unit
]

{ #category : #'*RenoirSt-Core' }
Float >> pc [

	^ self newMeasureWith: RenoirSt units >> #pica
]

{ #category : #'*RenoirSt-Core' }
Float >> rad [

	^ self newMeasureWith: RenoirSt units >> #radian
]

{ #category : #'*RenoirSt-Core' }
Float >> rem [

	^ self newMeasureWith: RenoirSt units >> #fontSizeOfRootElement
]

{ #category : #'*RenoirSt-Core' }
Float >> s [

	^ self newMeasureWith: RenoirSt units >> #second
]

{ #category : #'*RenoirSt-Core' }
Float >> turn [

	^ self newMeasureWith: RenoirSt units >> #turn
]
