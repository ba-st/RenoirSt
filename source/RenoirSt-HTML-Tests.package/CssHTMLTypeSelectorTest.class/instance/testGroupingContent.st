Tests
testGroupingContent

	self 
		assert: CssUniversalSelector implicit paragraph printString equals: 'p';
		assert: CssUniversalSelector implicit orderedList printString equals: 'ol';
		assert: CssUniversalSelector implicit unorderedList printString equals: 'ul';
		assert: CssUniversalSelector implicit listItem printString equals: 'li';
		assert: CssUniversalSelector implicit div printString equals: 'div'