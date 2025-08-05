Extension { #name : 'Object' }

{ #category : '*MetaStash-Description' }
Object >> asMetaStashElement [

	^ MetaStashElement newForObject: self
]

{ #category : '*MetaStash-Description' }
Object >> metaStashAccessors [

	| pragmas |
	pragmas := Pragma allNamed: #msAccessor from: self class to: Object.
	^ pragmas collect: [ :p |
		  p method
			  receiver: self
			  withArguments: #(  )
			  executeMethod: p method ]

]
