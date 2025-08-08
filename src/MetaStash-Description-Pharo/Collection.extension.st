Extension { #name : 'Collection' }

{ #category : '*MetaStash-Description-Pharo' }
Collection >> metaStashAccessorsForModel: aSymbol [

	| accessors |
	accessors := super metaStashAccessorsForModel: aSymbol.
	^ accessors , self collect: [ :each | MetaStashDescriptionAccessorOnlyGetter new getObject: each ]
]

{ #category : '*MetaStash-Description-Pharo' }
Collection >> metaStashEqual: anObject [

	anObject isCollection ifFalse: [ ^ false ].
	^ anObject asArray = self asArray
]

{ #category : '*MetaStash-Description-Pharo' }
Collection >> metaStashSerializationConstructor [

	^ MetaStashSerializationConstructorForCollection new
]
