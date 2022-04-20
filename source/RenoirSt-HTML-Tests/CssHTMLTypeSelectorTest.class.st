"
A CssHTMLTypeSelectorTest is a Test case for HTMLtype extensions to CssSelectors

"
Class {
	#name : #CssHTMLTypeSelectorTest,
	#superclass : #TestCase,
	#category : 'RenoirSt-HTML-Tests'
}

{ #category : #Tests }
CssHTMLTypeSelectorTest >> testEmbeddedContent [
	
	self 
		assert: CssUniversalSelector implicit image printString equals: 'img'
]

{ #category : #Tests }
CssHTMLTypeSelectorTest >> testForms [

	self
		assert: CssUniversalSelector implicit form printString equals: 'form';
		assert: CssUniversalSelector implicit label printString equals: 'label';
		assert: CssUniversalSelector implicit input printString equals: 'input';
		assert: CssUniversalSelector implicit button printString equals: 'button';
		assert: CssUniversalSelector implicit select printString equals: 'select';
		assert: CssUniversalSelector implicit optionGroup printString equals: 'optgroup';
		assert: CssUniversalSelector implicit option printString equals: 'option';
		assert: CssUniversalSelector implicit textArea printString equals: 'textarea';
		assert: CssUniversalSelector implicit fieldSet printString equals: 'fieldset';
		assert: CssUniversalSelector implicit legend printString equals: 'legend'
]

{ #category : #Tests }
CssHTMLTypeSelectorTest >> testGroupingContent [

	self 
		assert: CssUniversalSelector implicit paragraph printString equals: 'p';
		assert: CssUniversalSelector implicit horizontalRule printString equals: 'hr';
		assert: CssUniversalSelector implicit preformatted printString equals: 'pre';
		assert: CssUniversalSelector implicit blockquote printString equals: 'blockquote';
		assert: CssUniversalSelector implicit orderedList printString equals: 'ol';
		assert: CssUniversalSelector implicit unorderedList printString equals: 'ul';
		assert: CssUniversalSelector implicit listItem printString equals: 'li';
		assert: CssUniversalSelector implicit definitionList printString equals: 'dl';
		assert: CssUniversalSelector implicit definitionTerm printString equals: 'dt';
		assert: CssUniversalSelector implicit definitionDescription printString equals: 'dd';
		assert: CssUniversalSelector implicit figure printString equals: 'figure';
		assert: CssUniversalSelector implicit figureCaption printString equals: 'figcaption';
		assert: CssUniversalSelector implicit div printString equals: 'div';
		assert: CssUniversalSelector implicit main printString equals: 'main'
]

{ #category : #Tests }
CssHTMLTypeSelectorTest >> testSections [

	self
		assert: CssUniversalSelector implicit body printString equals: 'body';
		assert: (CssUniversalSelector implicit headingLevel: 1) printString equals: 'h1';
		assert: (CssUniversalSelector implicit headingLevel: 3) printString equals: 'h3';
		assert: CssUniversalSelector implicit h1 printString equals: 'h1';
		assert: CssUniversalSelector implicit h2 printString equals: 'h2';
		assert: CssUniversalSelector implicit h3 printString equals: 'h3';
		assert: CssUniversalSelector implicit h4 printString equals: 'h4';
		assert: CssUniversalSelector implicit h5 printString equals: 'h5';
		assert: CssUniversalSelector implicit h6 printString equals: 'h6';
		assert: CssUniversalSelector implicit address printString equals: 'address';
		assert: CssUniversalSelector implicit nav printString equals: 'nav';
		assert: CssUniversalSelector implicit article printString equals: 'article';
		assert: CssUniversalSelector implicit section printString equals: 'section';
		assert: CssUniversalSelector implicit aside printString equals: 'aside';
		assert: CssUniversalSelector implicit header printString equals: 'header';
		assert: CssUniversalSelector implicit footer printString equals: 'footer'
]

{ #category : #Tests }
CssHTMLTypeSelectorTest >> testTabularData [

	self 
		assert: CssUniversalSelector implicit table printString equals: 'table';
		assert: CssUniversalSelector implicit tableBody printString equals: 'tbody';
		assert: CssUniversalSelector implicit tableHeader printString equals: 'thead';
		assert: CssUniversalSelector implicit tableFooter printString equals: 'tfoot';
		assert: CssUniversalSelector implicit tableRow printString equals: 'tr';
		assert: CssUniversalSelector implicit tableData printString equals: 'td';
		assert: CssUniversalSelector implicit tableHeaderCell printString equals: 'th'
]

{ #category : #Tests }
CssHTMLTypeSelectorTest >> testTextLevelSemantics [

	self
		assert: CssUniversalSelector implicit anchor printString equals: 'a';
		assert: CssUniversalSelector implicit emphasis printString equals: 'em';
		assert: CssUniversalSelector implicit strong printString equals: 'strong';
		assert: CssUniversalSelector implicit small printString equals: 'small'; 
		assert: CssUniversalSelector implicit cite printString equals: 'cite';
		assert: CssUniversalSelector implicit abbreviation printString equals: 'abbr';
		assert: CssUniversalSelector implicit code printString equals: 'code';
		assert: CssUniversalSelector implicit variable printString equals: 'var';
		assert: CssUniversalSelector implicit sample printString equals: 'samp';
		assert: CssUniversalSelector implicit keyboardInput printString equals: 'kbd';
		assert: CssUniversalSelector implicit subscript printString equals: 'sub';
		assert: CssUniversalSelector implicit superscript  printString equals: 'sup';
		assert: CssUniversalSelector implicit span printString equals: 'span'
]
