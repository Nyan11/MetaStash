Class {
	#name : 'MetaStashDescriptionElement',
	#superclass : 'Object',
	#instVars : [
		'modelSymbol',
		'object',
		'accessors',
		'serializationVariableName',
		'serializationConstructor'
	],
	#category : 'MetaStash-Description',
	#package : 'MetaStash-Description'
}

{ #category : 'instance creation' }
MetaStashDescriptionElement class >> newForObject: anObject forModel: aSymbol [

	^ self new
		  modelSymbol: aSymbol;
		  object: anObject;
		  accessors: (anObject metaStashAccessorsForModel: aSymbol);
		  serializationVariableName:
			  anObject metaStashSerializationVariableName;
		  serializationConstructor:
			  anObject metaStashSerializationConstructor;
		  yourself
]

{ #category : 'comparing' }
MetaStashDescriptionElement >> = anObject [

	anObject class = self class ifFalse: [ ^ false ].
	^ self object = anObject object
]

{ #category : 'visiting' }
MetaStashDescriptionElement >> acceptMetaStashVisitor: aMetaStashVisitor [

	aMetaStashVisitor visitMetaStashElement: self.
]

{ #category : 'accessing' }
MetaStashDescriptionElement >> accessors [

	^ accessors
]

{ #category : 'accessing' }
MetaStashDescriptionElement >> accessors: anObject [

	accessors := anObject
]

{ #category : 'converting' }
MetaStashDescriptionElement >> asMetaStashModel [

	^ MetaStashDescriptionModel newForRootElement: self
]

{ #category : 'comparing' }
MetaStashDescriptionElement >> hash [

	^ self object hash
]

{ #category : 'as yet unclassified' }
MetaStashDescriptionElement >> includeGetter: aSymbol [

	^ self accessors anySatisfy: [ :accessor | accessor get = aSymbol ]
]

{ #category : 'as yet unclassified' }
MetaStashDescriptionElement >> includeSetter: aSymbol [

	^ self accessors anySatisfy: [ :accessor | accessor set = aSymbol ]
]

{ #category : 'as yet unclassified' }
MetaStashDescriptionElement >> inspectionDescription [

	<inspectorPresentationOrder: 0 title: 'MetaStash'>
	<script:
	'(MetaStashMockObject new asMetaStashElementForModel: #Testing) inspect'>
	^ SpTablePresenter new
		  addColumn: (SpStringTableColumn title: 'Getter' evaluated: #get);
		  addColumn: (SpStringTableColumn title: 'Setter' evaluated: #set);
		  addColumn: (SpStringTableColumn
				   title: 'Value'
				   evaluated: [ :each | (each getValueWithElement: self) object printString ]);
		  items: self accessors;
		  yourself
]

{ #category : 'accessing' }
MetaStashDescriptionElement >> modelSymbol [

	^ modelSymbol
]

{ #category : 'accessing' }
MetaStashDescriptionElement >> modelSymbol: anObject [

	modelSymbol := anObject
]

{ #category : 'accessing' }
MetaStashDescriptionElement >> object [

	^ object
]

{ #category : 'accessing' }
MetaStashDescriptionElement >> object: anObject [

	object := anObject
]

{ #category : 'accessing' }
MetaStashDescriptionElement >> serializationConstructor [

	^ serializationConstructor
]

{ #category : 'accessing' }
MetaStashDescriptionElement >> serializationConstructor: anObject [

	serializationConstructor := anObject
]

{ #category : 'accessing' }
MetaStashDescriptionElement >> serializationVariableName [

	^ serializationVariableName
]

{ #category : 'accessing' }
MetaStashDescriptionElement >> serializationVariableName: anObject [

	serializationVariableName := anObject
]
