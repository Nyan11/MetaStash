Class {
	#name : 'MetaStashSerializationLiteralReceiver',
	#superclass : 'MetaStashSerializationReceiver',
	#category : 'MetaStash-Serialization',
	#package : 'MetaStash-Serialization'
}

{ #category : 'testing' }
MetaStashSerializationLiteralReceiver >> isForLiteralValue [

	^ true
]

{ #category : 'as yet unclassified' }
MetaStashSerializationLiteralReceiver >> needVariable [

	^ false
]
