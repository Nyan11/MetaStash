Extension { #name : 'String' }

{ #category : '*MetaStash-Description-Pharo' }
String >> metaStashAccessorsForModel: aSymbol [

	^ {  }
]

{ #category : '*MetaStash-Description-Pharo' }
String >> metaStashSerializationConstructor [

	^ self printString asMetaStashConstructor
]
