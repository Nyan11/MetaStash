Extension { #name : 'Object' }

{ #category : '*MetaStash-Description-Pharo' }
Object >> asMetaStashElementForModel: aSymbol [

	^ MetaStashDescriptionElement new
		  modelSymbol: aSymbol;
		  object: self;
		  accessors: (self metaStashAccessorsForModel: aSymbol);
		  serializationVariableName: self metaStashSerializationVariableName;
		  serializationConstructor: self metaStashSerializationConstructor;
		  yourself
]

{ #category : '*MetaStash-Description-Pharo' }
Object >> metaStashAccessorsForModel: aSymbol [

	| pragmas specializeAccessors baseAccessors|
	pragmas := Pragma allNamed: #MetaStash from: self class to: Object.
	baseAccessors := pragmas collect: [ :p |
			  p method
				  receiver: self
				  withArguments: #(  )
				  executeMethod: p method ].
	pragmas := Pragma allNamed: #MetaStash: from: self class to: Object.
	specializeAccessors := pragmas
		  select: [ :p | p arguments first = aSymbol ]
		  thenCollect: [ :p |
			  p method
				  receiver: self
				  withArguments: #(  )
				  executeMethod: p method ].
	^ baseAccessors , specializeAccessors
]

{ #category : '*MetaStash-Description-Pharo' }
Object >> metaStashEqual: anObject [ 

	^ self = anObject
]

{ #category : '*MetaStash-Description-Pharo' }
Object >> metaStashSerializationConstructor [

	self isLiteral ifTrue: [ ^ self printString asMetaStashConstructor ].
	self isClass ifTrue: [ ^ self printString asMetaStashConstructor ].
	^ (self className , ' new') asMetaStashConstructor
]

{ #category : '*MetaStash-Description-Pharo' }
Object >> metaStashSerializationVariableName [

	^ (self className uncapitalized copyReplaceAll: ' ' with: '') ifEmpty: [ 'obj' ]
]
