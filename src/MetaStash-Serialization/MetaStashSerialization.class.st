Class {
	#name : 'MetaStashSerialization',
	#superclass : 'Object',
	#instVars : [
		'returnReceiver',
		'messages',
		'receivers'
	],
	#category : 'MetaStash-Serialization',
	#package : 'MetaStash-Serialization'
}

{ #category : 'converting' }
MetaStashSerialization >> asBlockClosureString [

	| sourceCode |
	sourceCode := ('[' , self variablesString , '<r>' , self assignationsString
	   , '<r>' , self returnString , ']') expandMacros.

	^ RBSimpleFormatter format: (RBParser parseExpression: sourceCode)
]

{ #category : 'as yet unclassified' }
MetaStashSerialization >> assignationsString [

	| macroString |
	macroString := '<1s>:=<2s>.'.
	^ '' join: (self receiverWithVariables collect: [ :each |
			   macroString
				   expandMacrosWith: each variableName
				   with: (self constructorStringFor: each) ])
]

{ #category : 'as yet unclassified' }
MetaStashSerialization >> constructorStringFor: aMetaStashSerializationReceiver [

	^ aMetaStashSerializationReceiver constructor
		  constructorStringFor: self
		  withReceiver: aMetaStashSerializationReceiver
		  withMessages: (self messages select: [ :each |
				   each receiver = aMetaStashSerializationReceiver ])
]

{ #category : 'initialization' }
MetaStashSerialization >> initialize [

	messages := OrderedCollection new.
	receivers := OrderedCollection new

]

{ #category : 'accessing' }
MetaStashSerialization >> messages [

	^ messages
]

{ #category : 'accessing' }
MetaStashSerialization >> messages: anObject [

	messages := anObject
]

{ #category : 'as yet unclassified' }
MetaStashSerialization >> receiverWithVariables [

	^ self receivers select: [ :each | each needVariable ]
]

{ #category : 'accessing' }
MetaStashSerialization >> receivers [

	^ receivers
]

{ #category : 'accessing' }
MetaStashSerialization >> receivers: anObject [

	receivers := anObject
]

{ #category : 'accessing' }
MetaStashSerialization >> returnReceiver [

	^ returnReceiver
]

{ #category : 'accessing' }
MetaStashSerialization >> returnReceiver: anObject [

	returnReceiver := anObject.
	(self receivers includes: anObject) ifFalse: [ self receivers add: anObject ]
]

{ #category : 'converting' }
MetaStashSerialization >> returnString [

	self returnReceiver needVariable ifTrue: [
		^ self returnReceiver variableName ].
	^ self constructorStringFor: self returnReceiver
]

{ #category : 'as yet unclassified' }
MetaStashSerialization >> variableOrConstructorStringFor: aMetaStashSerializationReceiver [

	aMetaStashSerializationReceiver needVariable ifTrue: [ ^ aMetaStashSerializationReceiver variableName ].
	^ self constructorStringFor: aMetaStashSerializationReceiver
]

{ #category : 'as yet unclassified' }
MetaStashSerialization >> variablesString [

	^ '| <1s> |' expandMacrosWith: (Character space join:
			   (self receiverWithVariables collect: #variableName))
]
