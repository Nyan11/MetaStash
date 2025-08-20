Extension { #name : 'Association' }

{ #category : '*MetaStash-Description-Pharo' }
Association >> metaStashAccessorKey [

	<MetaStash: #Bloc>
	^ MetaStashDescriptionAccessorOnlyGetter new getObject: self key
]

{ #category : '*MetaStash-Description-Pharo' }
Association >> metaStashAccessorValue [

	<MetaStash: #Bloc>
	^ MetaStashDescriptionAccessorOnlyGetter new getObject: self value
]

{ #category : '*MetaStash-Description-Pharo' }
Association >> metaStashSerializationConstructor [

	^ MetaStashSerializationBlockClosureConstructor new
		  constructorStringBlock: [ :serializer :receiver :messages |
			  | collectionOfStrings |
			  collectionOfStrings := (messages flatCollect: #arguments)
				                         collect: [ :each |
					                         serializer
						                         variableOrConstructorStringFor: each ].
			  '(<1s>)->(<2s>)'
				  expandMacrosWith: collectionOfStrings first
				  with: collectionOfStrings second ];
		  yourself
]
