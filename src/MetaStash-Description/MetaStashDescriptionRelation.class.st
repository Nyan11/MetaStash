Class {
	#name : 'MetaStashDescriptionRelation',
	#superclass : 'Object',
	#instVars : [
		'from',
		'to',
		'accessor'
	],
	#category : 'MetaStash-Description',
	#package : 'MetaStash-Description'
}

{ #category : 'visiting' }
MetaStashDescriptionRelation >> acceptMetaStashVisitor: aMetaStashVisitor [

	aMetaStashVisitor visitMetaStashRelation: self
]

{ #category : 'accessing' }
MetaStashDescriptionRelation >> accessor [

	^ accessor
]

{ #category : 'accessing' }
MetaStashDescriptionRelation >> accessor: anObject [

	accessor := anObject
]

{ #category : 'accessing' }
MetaStashDescriptionRelation >> from [

	^ from
]

{ #category : 'accessing' }
MetaStashDescriptionRelation >> from: anObject [

	from := anObject
]

{ #category : 'testing' }
MetaStashDescriptionRelation >> isDefaultValue [

	self accessor hasDefaultValue ifFalse: [ ^ false ].
	self accessor isOnlyGetter ifTrue: [ ^ false ].
	^ self from defaultValueForRelation: self
]

{ #category : 'accessing' }
MetaStashDescriptionRelation >> to [

	^ to
]

{ #category : 'accessing' }
MetaStashDescriptionRelation >> to: anObject [

	to := anObject
]
