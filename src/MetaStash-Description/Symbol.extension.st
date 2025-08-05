Extension { #name : 'Symbol' }

{ #category : '*MetaStash-Description' }
Symbol >> asMetaStashGetter [

	^ self
]

{ #category : '*MetaStash-Description' }
Symbol >> asMetaStashSetter [

	^ self asMutator
]
