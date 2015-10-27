Tests
testBuildingSimpleStyleSheet
	
	| builder |
	
	builder := CascadingStyleSheetBuilder new.
	builder
		declareRuleSetFor: [ :selector | selector class: 'xxx' ]
			with: [ :style | 
					style
						color: 'white';
						margin: 12 pt ];
		declareRuleSetFor: [ :selector | selector id: #oop ] with: [ :style | style color: 'red' ].
	
	self
		assert: builder build printString
		equals:
			('.xxx<1s>{<1s><2s>color: white;<1s><2s>margin: 12pt;<1s>}<1s><1s>#oop<1s>{<1s><2s>color: red;<1s>}'
				expandMacrosWith: OSPlatform current lineEnding
				with: Character tab asString)