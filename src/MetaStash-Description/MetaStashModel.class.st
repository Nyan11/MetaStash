Class {
	#name : 'MetaStashModel',
	#superclass : 'Object',
	#instVars : [
		'rootElement',
		'elements',
		'relations'
	],
	#category : 'MetaStash-Description',
	#package : 'MetaStash-Description'
}

{ #category : 'instance creation' }
MetaStashModel class >> new [

	self error:
		'MetaStashModel must only be created with newForRootElement:'
]

{ #category : 'instance creation' }
MetaStashModel class >> newForRootElement: aMetaStashRootElement [

	| visitor |
	visitor := MetaStashModelBuilder new.
	aMetaStashRootElement acceptMetaStashVisitor: visitor.
	visitor visit: aMetaStashRootElement.
	^ visitor model
]

{ #category : 'visiting' }
MetaStashModel >> acceptMetaStashVisitor: aMetaStashVisitor [

	aMetaStashVisitor visitMetaStashModel: self
]

{ #category : 'accessing' }
MetaStashModel >> elements [

	^ elements
]

{ #category : 'accessing' }
MetaStashModel >> elements: anObject [

	elements := anObject
]

{ #category : 'accessing' }
MetaStashModel >> relations [

	^ relations
]

{ #category : 'accessing' }
MetaStashModel >> relations: anObject [

	relations := anObject
]

{ #category : 'accessing' }
MetaStashModel >> rootElement [

	^ rootElement
]

{ #category : 'accessing' }
MetaStashModel >> rootElement: anObject [

	rootElement := anObject
]
