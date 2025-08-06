Class {
	#name : 'MetaStashSerializationMessage',
	#superclass : 'Object',
	#instVars : [
		'receiver',
		'message',
		'arguments'
	],
	#category : 'MetaStash-Serialization',
	#package : 'MetaStash-Serialization'
}

{ #category : 'accessing' }
MetaStashSerializationMessage >> arguments [

	^ arguments
]

{ #category : 'accessing' }
MetaStashSerializationMessage >> arguments: anObject [

	arguments := anObject
]

{ #category : 'accessing' }
MetaStashSerializationMessage >> message [

	^ message
]

{ #category : 'accessing' }
MetaStashSerializationMessage >> message: anObject [

	message := anObject
]

{ #category : 'as yet unclassified' }
MetaStashSerializationMessage >> messageString [

	^ Character space join:
		  (self message separateKeywords substrings collectWithIndex: [
			   :word
			   :index |
			   word , ' ' , (self arguments at: index) stringForMessage ])
]

{ #category : 'as yet unclassified' }
MetaStashSerializationMessage >> messageStringVariableFormat [
	^ '<1s> <2s>.' expandMacrosWith: self receiver variableName with: self messageString
]

{ #category : 'accessing' }
MetaStashSerializationMessage >> receiver [

	^ receiver
]

{ #category : 'accessing' }
MetaStashSerializationMessage >> receiver: anObject [

	receiver := anObject
]
