Extension { #name : 'Object' }

{ #category : '*MetaStash-Description' }
Object >> asMetaStashModel: aSymbol [

	^ (self asMetaStashElementForModel: aSymbol) asMetaStashModel
]
