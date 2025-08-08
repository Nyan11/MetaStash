Class {
	#name : 'MetaStashDescriptionAbstractAccessor',
	#superclass : 'Object',
	#instVars : [
		'hasDefaultValue'
	],
	#category : 'MetaStash-Description',
	#package : 'MetaStash-Description'
}

{ #category : 'visiting' }
MetaStashDescriptionAbstractAccessor >> acceptMetaStashVisitor: aMetaStashVisitor [

	aMetaStashVisitor visitMetaStashAccessor: self
]

{ #category : 'accessing' }
MetaStashDescriptionAbstractAccessor >> hasDefaultValue [

	^ hasDefaultValue ifNil: [ hasDefaultValue := true ].
]

{ #category : 'testing' }
MetaStashDescriptionAbstractAccessor >> isOnlyGetter [

	^ false
]

{ #category : 'as yet unclassified' }
MetaStashDescriptionAbstractAccessor >> noDefaultValue [

	hasDefaultValue := false.
]
