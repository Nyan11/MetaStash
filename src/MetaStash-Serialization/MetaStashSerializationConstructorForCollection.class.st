Class {
	#name : 'MetaStashSerializationConstructorForCollection',
	#superclass : 'MetaStashSerializationConstructorAbstract',
	#category : 'MetaStash-Serialization',
	#package : 'MetaStash-Serialization'
}

{ #category : 'as yet unclassified' }
MetaStashSerializationConstructorForCollection >> constructorStringFor: aMetaStashSerialization withReceiver: aMetaStashSerializationReceiver withMessages: aCollection [

	| collectionOfObjects collectionOfStrings |
	collectionOfObjects := aCollection flatCollect: [ :each | each arguments ].
	collectionOfStrings := collectionOfObjects collect: [ :each | aMetaStashSerialization variableOrConstructorStringFor: each ].
	^ '{ <1s> }' expandMacrosWith: ($. join: collectionOfStrings)
]

{ #category : 'instance creation' }
MetaStashSerializationConstructorForCollection >> newInstance [
	^ {  }
]
