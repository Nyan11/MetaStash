Class {
	#name : 'MetaStashElement',
	#superclass : 'Object',
	#instVars : [
		'object',
		'accessors'
	],
	#category : 'MetaStash-Description',
	#package : 'MetaStash-Description'
}

{ #category : 'instance creation' }
MetaStashElement class >> newForObject: anObject [

	^ self new
		  object: anObject;
		  accessors: anObject metaStashAccessors;
		  yourself
]

{ #category : 'visiting' }
MetaStashElement >> acceptMetaStashVisitor: aMetaStashVisitor [

	aMetaStashVisitor visitMetaStashElement: self.
]

{ #category : 'accessing' }
MetaStashElement >> accessors [

	^ accessors
]

{ #category : 'accessing' }
MetaStashElement >> accessors: anObject [

	accessors := anObject
]

{ #category : 'converting' }
MetaStashElement >> asMetaStashModel [

	^ MetaStashModel newForRootElement: self
]

{ #category : 'as yet unclassified' }
MetaStashElement >> includeGetter: aSymbol [

	^ self accessors anySatisfy: [ :accessor | accessor get = aSymbol ]
]

{ #category : 'as yet unclassified' }
MetaStashElement >> includeSetter: aSymbol [

	^ self accessors anySatisfy: [ :accessor | accessor set = aSymbol ]
]

{ #category : 'accessing' }
MetaStashElement >> object [

	^ object
]

{ #category : 'accessing' }
MetaStashElement >> object: anObject [

	object := anObject
]
