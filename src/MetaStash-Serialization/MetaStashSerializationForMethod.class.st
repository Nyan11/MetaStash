Class {
	#name : 'MetaStashSerializationForMethod',
	#superclass : 'Object',
	#instVars : [
		'name',
		'returnReceiver',
		'messages',
		'receivers'
	],
	#category : 'MetaStash-Serialization',
	#package : 'MetaStash-Serialization'
}

{ #category : 'initialization' }
MetaStashSerializationForMethod >> initialize [

	messages := OrderedCollection new.
	receivers := OrderedCollection new

]

{ #category : 'accessing' }
MetaStashSerializationForMethod >> messages [

	^ messages
]

{ #category : 'accessing' }
MetaStashSerializationForMethod >> messages: anObject [

	messages := anObject
]

{ #category : 'as yet unclassified' }
MetaStashSerializationForMethod >> messagesString [

	^ Character cr join:
		  (self messages collect: [ :each |
			  '<t>' , each messageStringVariableFormat ])
]

{ #category : 'as yet unclassified' }
MetaStashSerializationForMethod >> name [

	^ name
]

{ #category : 'as yet unclassified' }
MetaStashSerializationForMethod >> name: anObject [

	name := anObject
]

{ #category : 'accessing' }
MetaStashSerializationForMethod >> receivers [

	^ receivers
]

{ #category : 'accessing' }
MetaStashSerializationForMethod >> receivers: anObject [

	receivers := anObject
]

{ #category : 'accessing' }
MetaStashSerializationForMethod >> returnReceiver [

	^ returnReceiver
]

{ #category : 'accessing' }
MetaStashSerializationForMethod >> returnReceiver: anObject [

	returnReceiver := anObject.
	(self receivers includes: anObject) ifFalse: [ self receivers add: anObject ]
]

{ #category : 'as yet unclassified' }
MetaStashSerializationForMethod >> returnString [

	^ '<t>^ ' , self returnReceiver variableName
]

{ #category : 'as yet unclassified' }
MetaStashSerializationForMethod >> sourceCode [

	self returnReceiver ifNil: [ ^ self name asString ].
	self messages ifEmpty: [
		^ '<1s><r><r><t>^ <2s>'
			  expandMacrosWith: self name asString
			  with: self returnReceiver constructorString ].
	^ ('<1s><r><r><2s><r><3s><r><4s>'
		  expandMacrosWith: self name asString
		  with: self variablesAndConstructorsString
		  with: self messagesString
		  with: self returnString) expandMacros
]

{ #category : 'as yet unclassified' }
MetaStashSerializationForMethod >> sourceCodeForBlock [

	self returnReceiver ifNil: [ ^ self name asString ].
	self messages ifEmpty: [
		^ '[ <2s> ]'
			  expandMacrosWith: self name asString
			  with: self returnReceiver constructorString ].
	^ ('[ <2s><r><3s><r><4s> ]'
		   expandMacrosWith: self name asString
		   with: self variablesAndConstructorsString
		   with: self messagesString
		   with: self returnString) expandMacros
]

{ #category : 'as yet unclassified' }
MetaStashSerializationForMethod >> variablesAndConstructorsString [

	| variables variablesString assignationMacro assignations assignationsString |
	variables := Character space join:
		             (self receivers collect: [ :each | each variableName ]).
	variablesString := '%<t>| <1s> |' expandMacrosWith: variables.

	assignationMacro := '%<t><1s> := <2s>.'.
	assignations := self receivers collect: [ :each |
		                assignationMacro
			                expandMacrosWith: each variableName
			                with: each constructorString ].
	assignationsString := Character cr join: assignations.
	^ '<1s><r><2s>'
		   expandMacrosWith: variablesString
		   with: assignationsString
]
