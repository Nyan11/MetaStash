Class {
	#name : 'MetaStashSerializationReceiver',
	#superclass : 'Object',
	#instVars : [
		'variableName',
		'constructor',
		'occurencesInMessage'
	],
	#category : 'MetaStash-Serialization',
	#package : 'MetaStash-Serialization'
}

{ #category : 'converting' }
MetaStashSerializationReceiver >> asAssignationString [

	^ self variableName , ':=' , self constructorString
]

{ #category : 'accessing' }
MetaStashSerializationReceiver >> constructor [

	^ constructor
]

{ #category : 'accessing' }
MetaStashSerializationReceiver >> constructor: anObject [

	constructor := anObject
]

{ #category : 'accessing' }
MetaStashSerializationReceiver >> constructorString [

	^ self constructor constructorString
]

{ #category : 'as yet unclassified' }
MetaStashSerializationReceiver >> increaseOccurencesInMessage [

	occurencesInMessage := occurencesInMessage + 1
]

{ #category : 'as yet unclassified' }
MetaStashSerializationReceiver >> initialize [

	occurencesInMessage := 0
]

{ #category : 'testing' }
MetaStashSerializationReceiver >> isForLiteralValue [

	^ false
]

{ #category : 'as yet unclassified' }
MetaStashSerializationReceiver >> needVariable [

	^ occurencesInMessage > 1
]

{ #category : 'as yet unclassified' }
MetaStashSerializationReceiver >> stringForMessage [

	^ self variableName.
]

{ #category : 'accessing' }
MetaStashSerializationReceiver >> variableName [

	^ variableName
]

{ #category : 'accessing' }
MetaStashSerializationReceiver >> variableName: anObject [

	variableName := anObject
]
