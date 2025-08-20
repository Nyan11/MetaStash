Class {
	#name : 'MetaStashSerializationConstructor',
	#superclass : 'MetaStashSerializationConstructorAbstract',
	#instVars : [
		'constructorString'
	],
	#category : 'MetaStash-Serialization',
	#package : 'MetaStash-Serialization'
}

{ #category : 'accessing' }
MetaStashSerializationConstructor >> constructorString [

	^ constructorString
]

{ #category : 'accessing' }
MetaStashSerializationConstructor >> constructorString: anObject [

	constructorString := anObject
]

{ #category : 'as yet unclassified' }
MetaStashSerializationConstructor >> constructorStringFor: aMetaStashSerialization withReceiver: aMetaStashSerializationReceiver withMessages: aCollection [

	| macroMessage messageStrings |
	aCollection ifEmpty: [ ^ self constructorString ].

	macroMessage := '<1s> (<2s>);'.
	messageStrings := aCollection collect: [ :each |
		                  Character space join:
			                  (each message set separateKeywords substrings
				                   collectWithIndex: [ :word :index |
					                   | argumentString |
					                   argumentString := aMetaStashSerialization
						                                     variableOrConstructorStringFor:
						                                     (each arguments at: index).
					                   macroMessage
						                   expandMacrosWith: word
						                   with: argumentString ]) ].
	^ '<1s> <2s> yourself'
		  expandMacrosWith: self constructorString
		  with: ('' join: messageStrings)
]

{ #category : 'instance creation' }
MetaStashSerializationConstructor >> newInstance [

	^ OpalCompiler new
		source: self constructorString;
		evaluate
]
