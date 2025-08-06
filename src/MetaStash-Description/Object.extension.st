Extension { #name : 'Object' }

{ #category : '*MetaStash-Description' }
Object >> asMetaStashElementForModel: aSymbol [ 

	^ MetaStashElement newForObject: self forModel: aSymbol
]

{ #category : '*MetaStash-Description' }
Object >> asMetaStashModel: aSymbol [

	^ (self asMetaStashElementForModel: aSymbol) asMetaStashModel
]

{ #category : '*MetaStash-Description' }
Object >> metaStashAccessorsForModel: aSymbol [

	| pragmas |
	pragmas := Pragma allNamed: #MetaStash: from: self class to: Object.
	^ pragmas
		  select: [ :p | p arguments first = aSymbol ]
		  thenCollect: [ :p |
			  p method
				  receiver: self
				  withArguments: #(  )
				  executeMethod: p method ]
]

{ #category : '*MetaStash-Description' }
Object >> metaStashEqual: anObject [ 

	^ self = anObject
]
