Class {
	#name : 'MetaStashDescriptionModel',
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
MetaStashDescriptionModel class >> newForRootElement: aMetaStashRootElement [

	| visitor |
	visitor := MetaStashDescriptionModelBuilder new.
	aMetaStashRootElement acceptMetaStashVisitor: visitor.
	^ visitor model
]

{ #category : 'visiting' }
MetaStashDescriptionModel >> acceptMetaStashVisitor: aMetaStashVisitor [

	aMetaStashVisitor visitMetaStashModel: self
]

{ #category : 'accessing' }
MetaStashDescriptionModel >> elements [

	^ elements
]

{ #category : 'accessing' }
MetaStashDescriptionModel >> elements: anObject [

	elements := anObject
]

{ #category : 'initialization' }
MetaStashDescriptionModel >> initialize [

	elements := OrderedCollection new.
	relations := OrderedCollection new.
]

{ #category : 'accessing' }
MetaStashDescriptionModel >> modelSymbol [

	^ self rootElement modelSymbol
]

{ #category : 'accessing' }
MetaStashDescriptionModel >> relations [

	^ relations
]

{ #category : 'accessing' }
MetaStashDescriptionModel >> relations: anObject [

	relations := anObject
]

{ #category : 'accessing' }
MetaStashDescriptionModel >> rootElement [

	^ rootElement
]

{ #category : 'accessing' }
MetaStashDescriptionModel >> rootElement: anObject [

	rootElement := anObject
]
