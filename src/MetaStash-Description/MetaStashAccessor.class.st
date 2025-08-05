Class {
	#name : 'MetaStashAccessor',
	#superclass : 'Object',
	#instVars : [
		'set',
		'get'
	],
	#category : 'MetaStash-Description',
	#package : 'MetaStash-Description'
}

{ #category : 'as yet unclassified' }
MetaStashAccessor class >> accessor: anAccessor [

	^ self get: anAccessor asMetaStashGetter set: anAccessor asMetaStashSetter
]

{ #category : 'as yet unclassified' }
MetaStashAccessor class >> get: aGetter set: aSetter [

	^ self new
		  get: aGetter;
		  set: aSetter;
		  yourself
]

{ #category : 'visiting' }
MetaStashAccessor >> acceptMetaStashVisitor: aMetaStashVisitor [

	aMetaStashVisitor visitMetaStashAccessor: self
]

{ #category : 'accessing' }
MetaStashAccessor >> get [

	^ get
]

{ #category : 'accessing' }
MetaStashAccessor >> get: anObject [

	get := anObject
]

{ #category : 'accessing' }
MetaStashAccessor >> set [

	^ set
]

{ #category : 'accessing' }
MetaStashAccessor >> set: anObject [

	set := anObject
]
