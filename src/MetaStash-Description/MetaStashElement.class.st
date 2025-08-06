Class {
	#name : 'MetaStashElement',
	#superclass : 'Object',
	#instVars : [
		'modelSymbol',
		'object',
		'accessors'
	],
	#category : 'MetaStash-Description',
	#package : 'MetaStash-Description'
}

{ #category : 'instance creation' }
MetaStashElement class >> newForObject: anObject forModel: aSymbol [

	^ self new
		  modelSymbol: aSymbol;
		  object: anObject;
		  accessors: (anObject metaStashAccessorsForModel: aSymbol);
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
MetaStashElement >> modelSymbol [

	^ modelSymbol
]

{ #category : 'accessing' }
MetaStashElement >> modelSymbol: anObject [

	modelSymbol := anObject
]

{ #category : 'accessing' }
MetaStashElement >> object [

	^ object
]

{ #category : 'accessing' }
MetaStashElement >> object: anObject [

	object := anObject
]
