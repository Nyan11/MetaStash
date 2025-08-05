Class {
	#name : 'MetaStashRelation',
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
MetaStashRelation >> acceptMetaStashVisitor: aMetaStashVisitor [

	aMetaStashVisitor visitMetaStashRelation: self
]

{ #category : 'accessing' }
MetaStashRelation >> accessor [

	^ accessor
]

{ #category : 'accessing' }
MetaStashRelation >> accessor: anObject [

	accessor := anObject
]

{ #category : 'accessing' }
MetaStashRelation >> from [

	^ from
]

{ #category : 'accessing' }
MetaStashRelation >> from: anObject [

	from := anObject
]

{ #category : 'accessing' }
MetaStashRelation >> to [

	^ to
]

{ #category : 'accessing' }
MetaStashRelation >> to: anObject [

	to := anObject
]
