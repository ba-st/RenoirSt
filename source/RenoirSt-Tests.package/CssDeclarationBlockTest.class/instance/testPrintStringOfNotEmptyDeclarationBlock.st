Tests
testPrintStringOfNotEmptyDeclarationBlock
	
	self
		assert:
			(CssDeclarationBlock new
				color: 'red';
				yourself) printString
		equals: ('{<1s><2s>color: red;<1s>}' expandMacrosWith: OSPlatform current lineEnding with: Character tab asString)