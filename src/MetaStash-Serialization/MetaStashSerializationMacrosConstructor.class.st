Class {
	#name : 'MetaStashSerializationMacrosConstructor',
	#superclass : 'MetaStashSerializationConstructorAbstract',
	#instVars : [
		'constructorString',
		'macros',
		'argumentAccessors'
	],
	#category : 'MetaStash-Serialization',
	#package : 'MetaStash-Serialization'
}

{ #category : 'as yet unclassified' }
MetaStashSerializationMacrosConstructor >> constructorStringFor: aMetaStashSerialization withReceiver: aMetaStashSerializationReceiver withMessages: aCollection [

	| collectionOfObjects collectionOfStrings |
	collectionOfObjects := aCollection flatCollect: [ :each |
		                       each arguments ].
	collectionOfStrings := collectionOfObjects collect: [ :each |
		                       aMetaStashSerialization
			                       variableOrConstructorStringFor: each ].
	^ self macros expandMacrosWithArguments: nil.
]

{ #category : 'as yet unclassified' }
MetaStashSerializationMacrosConstructor >> macros: aString [ 
	macros := aString 
]

{ #category : 'as yet unclassified' }
MetaStashSerializationMacrosConstructor >> withArgumentAccessors: aCollection [ 
	argumentAccessors := aCollection 
]
