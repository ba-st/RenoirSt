"
A CssLengthTest is a test class for testing the behavior of CssLength
"
Class {
	#name : #CssMeasureTest,
	#superclass : #TestCase,
	#category : #'RenoirSt-Tests-Units'
}

{ #category : #private }
CssMeasureTest >> assert: aCssLength asCssStringEquals: aString [

	self assert: (String streamContents: [ :stream | aCssLength cssContentOn: stream ]) equals: aString
]

{ #category : #Tests }
CssMeasureTest >> testCreationShortcutsForAngles [
	
	self
		assert: 1 deg asCssStringEquals: '1deg';
		assert: 1 grad asCssStringEquals: '1grad';
		assert: 1 rad asCssStringEquals: '1rad';
		assert: 1 turn asCssStringEquals: '1turn'.
	
	self
		assert: 1.5 deg asCssStringEquals: '1.5deg';
		assert: 1.5 grad asCssStringEquals: '1.5grad';
		assert: 1.5 rad asCssStringEquals: '1.5rad';
		assert: 1.5 turn asCssStringEquals: '1.5turn'.
]

{ #category : #Tests }
CssMeasureTest >> testCreationShortcutsForFrequencies [

	self
		assert: 4 Hz asCssStringEquals: '4Hz';
		assert: 1 kHz asCssStringEquals: '1kHz'
]

{ #category : #Tests }
CssMeasureTest >> testCreationShortcutsForLengths [
	
	self
		assert: 4 px asCssStringEquals: '4px';
		assert: 1 pc asCssStringEquals:  '1pc';
		assert: 3 in asCssStringEquals:  '3in';
		assert: 3 pt asCssStringEquals:  '3pt';
		assert: 0 em asCssStringEquals:  '0em';
		assert: 3 ex asCssStringEquals:  '3ex';
		assert: 3 cm asCssStringEquals:  '3cm';
		assert: 123 mm asCssStringEquals:  '123mm';
		assert: 1 ch asCssStringEquals:  '1ch';
		assert: 1 rem asCssStringEquals:  '1rem';
		assert: 1 vw asCssStringEquals:  '1vw';
		assert: 1 vh asCssStringEquals:  '1vh';
		assert: 1 vmin asCssStringEquals:  '1vmin';
		assert: 1 vmax asCssStringEquals:  '1vmax'.
	
	self 
		assert: 1 percent asCssStringEquals:  '1%'.
		
	self
		assert: 1.3 cm asCssStringEquals: '1.3cm';
		assert: 0.8 em asCssStringEquals:  '0.8em';
		assert: 1.3 rem asCssStringEquals: '1.3rem';
		assert: 1.1 in asCssStringEquals:  '1.1in';
		assert: 2.9 mm asCssStringEquals:  '2.9mm';
		assert: 0.1 pc asCssStringEquals:  '0.1pc'.
		

]

{ #category : #Tests }
CssMeasureTest >> testCreationShortcutsForResolutions [

	self
		assert: 4 dpi asCssStringEquals: '4dpi';
		assert: 1 dpcm asCssStringEquals: '1dpcm';
		assert: 3 dppx asCssStringEquals: '3dppx'
]

{ #category : #Tests }
CssMeasureTest >> testCreationShortcutsForTimes [
	
	self
		assert: 1 s asCssStringEquals: '1s';
		assert: 1 ms asCssStringEquals: '1ms'.
	
	self
		assert: 1.5 s asCssStringEquals: '1.5s';
		assert: 1.5 ms asCssStringEquals: '1.5ms'.
]

{ #category : #Tests }
CssMeasureTest >> testInstanceCreation [

	| unit |
	
	unit := CssUnit identifiedBy: 'px'.
	
	self assert: (CssMeasure quantity: 4 unit: unit) printString equals: '4px'
]
