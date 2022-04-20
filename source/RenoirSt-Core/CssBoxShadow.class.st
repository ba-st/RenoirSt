"
I represent a box shadow property value. See http://www.w3.org/TR/css3-background/#box-shadow.
"
Class {
	#name : #CssBoxShadow,
	#superclass : #CssObject,
	#instVars : [
		'components'
	],
	#category : #'RenoirSt-Core-Common'
}

{ #category : #'Instance Creation' }
CssBoxShadow class >> horizontalOffset: horizontalOffsetLength verticalOffset: verticalOffsetLength [

	^ self
		withAll:
			{horizontalOffsetLength.
			verticalOffsetLength}
]

{ #category : #'Instance Creation' }
CssBoxShadow class >> horizontalOffset: horizontalOffsetLength verticalOffset: verticalOffsetLength blurRadius: blurRadiusLength [

	^ self
		withAll:
			{horizontalOffsetLength.
			verticalOffsetLength.
			blurRadiusLength}
]

{ #category : #'Instance Creation' }
CssBoxShadow class >> horizontalOffset: horizontalOffsetLength verticalOffset: verticalOffsetLength blurRadius: blurRadiusLength color: colorOrNamedConstant [

	^ self
		withAll:
			{horizontalOffsetLength.
			verticalOffsetLength.
			blurRadiusLength.
			(self lookupColor: colorOrNamedConstant)}
]

{ #category : #'Instance Creation' }
CssBoxShadow class >> horizontalOffset: horizontalOffsetLength verticalOffset: verticalOffsetLength blurRadius: blurRadiusLength spreadDistance: spreadDistanceLength [

	^ self
		withAll:
			{horizontalOffsetLength.
			verticalOffsetLength.
			blurRadiusLength.
			spreadDistanceLength}
]

{ #category : #'Instance Creation' }
CssBoxShadow class >> horizontalOffset: horizontalOffsetLength verticalOffset: verticalOffsetLength blurRadius: blurRadiusLength spreadDistance: spreadDistanceLength color: colorOrNamedConstant [

	^ self
		withAll:
			{horizontalOffsetLength.
			verticalOffsetLength.
			blurRadiusLength.
			spreadDistanceLength.
			(self lookupColor: colorOrNamedConstant)}
]

{ #category : #'Instance Creation' }
CssBoxShadow class >> horizontalOffset: horizontalOffsetLength verticalOffset: verticalOffsetLength color: colorOrNamedConstant [

	^ self
		withAll:
			{horizontalOffsetLength.
			verticalOffsetLength.
			(self lookupColor: colorOrNamedConstant)}
]

{ #category : #private }
CssBoxShadow class >> withAll: anArray [

	^self new initializeWithAll: anArray 
]

{ #category : #Concatenating }
CssBoxShadow >> , aCssBoxShadow [

	^CssObjectList with: self with: aCssBoxShadow 
]

{ #category : #Configuring }
CssBoxShadow >> beInset [

	components := components asOrderedCollection
		addFirst: (self class lookupValue: #inset);
		asArray
]

{ #category : #Printing }
CssBoxShadow >> cssContentOn: aStream [
	components cssContentOn: aStream
]

{ #category : #'initialize-release' }
CssBoxShadow >> initializeWithAll: anArray [

	components := anArray
]
