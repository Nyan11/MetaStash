Class {
	#name : 'MetaStashSerializationReceiver',
	#superclass : 'Object',
	#instVars : [
		'variableName',
		'constructor'
	],
	#category : 'MetaStash-Serialization',
	#package : 'MetaStash-Serialization'
}

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
