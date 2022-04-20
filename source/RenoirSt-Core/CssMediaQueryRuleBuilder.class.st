"
A CssMediaQueryRuleBuilder is a builder to help creating media queries

"
Class {
	#name : #CssMediaQueryRuleBuilder,
	#superclass : #Object,
	#instVars : [
		'styleSheet',
		'mediaType',
		'expressions'
	],
	#category : #'RenoirSt-Core-MediaQueries'
}

{ #category : #private }
CssMediaQueryRuleBuilder >> addExpressionForFeatureNamed: aFeatureName withValue: aValue [

	expressions add: (CssMediaQueryExpression forFeatureNamed: aFeatureName withValue: aValue)
]

{ #category : #'Configuring - Features' }
CssMediaQueryRuleBuilder >> aspectRatio: aFraction [

	self addExpressionForFeatureNamed: 'aspect-ratio' withValue: aFraction 
]

{ #category : #Building }
CssMediaQueryRuleBuilder >> build [

	^CssMediaQueryRule ofType: mediaType conforming: expressions enabling: styleSheet 
]

{ #category : #'Configuring - Features' }
CssMediaQueryRuleBuilder >> color: anInteger [ 
	
	self addExpressionForFeatureNamed: 'color' withValue: anInteger 
]

{ #category : #'Configuring - Features' }
CssMediaQueryRuleBuilder >> colorIndex: anInteger [ 
	
	self addExpressionForFeatureNamed: 'color-index' withValue: anInteger 
]

{ #category : #'Configuring - Features' }
CssMediaQueryRuleBuilder >> deviceHeight: aCssLength [ 
	
	self addExpressionForFeatureNamed: 'device-height' withValue: aCssLength 
]

{ #category : #'Configuring - Features' }
CssMediaQueryRuleBuilder >> deviceWidth: aCssLength [ 
	
	self addExpressionForFeatureNamed: 'device-width' withValue: aCssLength 
]

{ #category : #'Configuring - Features' }
CssMediaQueryRuleBuilder >> grid: anInteger [ 
	
	self addExpressionForFeatureNamed: 'grid' withValue: anInteger 
]

{ #category : #'Configuring - Features' }
CssMediaQueryRuleBuilder >> height: aCssLength [ 
	
	self addExpressionForFeatureNamed: 'height' withValue: aCssLength 
]

{ #category : #'initialize-release' }
CssMediaQueryRuleBuilder >> initialize [

	super initialize.
	styleSheet := CascadingStyleSheet withAll: #().
	expressions := OrderedCollection new.
	mediaType := 'all'
]

{ #category : #'Configuring - Features' }
CssMediaQueryRuleBuilder >> maxAspectRatio: aFraction [

	self addExpressionForFeatureNamed: 'max-aspect-ratio' withValue: aFraction 
]

{ #category : #'Configuring - Features' }
CssMediaQueryRuleBuilder >> maxColor: anInteger [ 

	self addExpressionForFeatureNamed: 'max-color' withValue: anInteger 
]

{ #category : #'Configuring - Features' }
CssMediaQueryRuleBuilder >> maxColorIndex: anInteger [ 
	
	self addExpressionForFeatureNamed: 'max-color-index' withValue: anInteger 
]

{ #category : #'Configuring - Features' }
CssMediaQueryRuleBuilder >> maxDeviceHeight: aCssLength [ 
	
	self addExpressionForFeatureNamed: 'max-device-height' withValue: aCssLength 
]

{ #category : #'Configuring - Features' }
CssMediaQueryRuleBuilder >> maxDeviceWidth: aCssLength [ 
	
	self addExpressionForFeatureNamed: 'max-device-width' withValue: aCssLength 
]

{ #category : #'Configuring - Features' }
CssMediaQueryRuleBuilder >> maxHeight: aCssLength [ 
	
	self addExpressionForFeatureNamed: 'max-height' withValue: aCssLength 
]

{ #category : #'Configuring - Features' }
CssMediaQueryRuleBuilder >> maxMonochrome: anInteger [ 
	
	self addExpressionForFeatureNamed: 'max-monochrome' withValue: anInteger 
]

{ #category : #'Configuring - Features' }
CssMediaQueryRuleBuilder >> maxWidth: aCssLength [ 
	
	self addExpressionForFeatureNamed: 'max-width' withValue: aCssLength 
]

{ #category : #'Configuring - Features' }
CssMediaQueryRuleBuilder >> minAspecRatio: aFraction [

	self addExpressionForFeatureNamed: 'min-aspect-ratio' withValue: aFraction 
]

{ #category : #'Configuring - Features' }
CssMediaQueryRuleBuilder >> minColor: anInteger [ 
	
	self addExpressionForFeatureNamed: 'min-color' withValue: anInteger 
]

{ #category : #'Configuring - Features' }
CssMediaQueryRuleBuilder >> minColorIndex: anInteger [ 
	
	self addExpressionForFeatureNamed: 'min-color-index' withValue: anInteger 
]

{ #category : #'Configuring - Features' }
CssMediaQueryRuleBuilder >> minDeviceHeight: aCssLength [ 
	
	self addExpressionForFeatureNamed: 'min-device-height' withValue: aCssLength 
]

{ #category : #'Configuring - Features' }
CssMediaQueryRuleBuilder >> minDeviceWidth: aCssLength [ 
	
	self addExpressionForFeatureNamed: 'min-device-width' withValue: aCssLength 
]

{ #category : #'Configuring - Features' }
CssMediaQueryRuleBuilder >> minHeight: aCssLength [ 
	
	self addExpressionForFeatureNamed: 'min-height' withValue: aCssLength 
]

{ #category : #'Configuring - Features' }
CssMediaQueryRuleBuilder >> minMonochrome: anInteger [ 
	
	self addExpressionForFeatureNamed: 'min-monochrome' withValue: anInteger 
]

{ #category : #'Configuring - Features' }
CssMediaQueryRuleBuilder >> minWidth: aCssLength [ 

	self addExpressionForFeatureNamed: 'min-width' withValue: aCssLength 
]

{ #category : #'Configuring - Features' }
CssMediaQueryRuleBuilder >> monochrome: anInteger [ 
	
	self addExpressionForFeatureNamed: 'monochrome' withValue: anInteger 
]

{ #category : #'Configuring - Features' }
CssMediaQueryRuleBuilder >> orientation: anOrientation [

	self addExpressionForFeatureNamed: 'orientation' withValue: anOrientation 
]

{ #category : #'Configuring - Features' }
CssMediaQueryRuleBuilder >> resolution: aCssResolution [ 
	
	self addExpressionForFeatureNamed: 'resolution' withValue: aCssResolution 
]

{ #category : #'Configuring - Features' }
CssMediaQueryRuleBuilder >> scan: aScanType [

	self addExpressionForFeatureNamed: 'scan' withValue: aScanType 
]

{ #category : #Configuring }
CssMediaQueryRuleBuilder >> type: aMediaType [

	mediaType := aMediaType
]

{ #category : #Configuring }
CssMediaQueryRuleBuilder >> useStyleSheet: aCascadingStyleSheet [ 
	
	styleSheet := aCascadingStyleSheet 
]

{ #category : #'Configuring - Features' }
CssMediaQueryRuleBuilder >> width: aCssLength [ 
	
	self addExpressionForFeatureNamed: 'width' withValue: aCssLength 
]
