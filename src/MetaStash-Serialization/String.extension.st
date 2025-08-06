Extension { #name : 'String' }

{ #category : '*MetaStash-Serialization' }
String >> asMetaStashConstructor [

	^ MetaStashSerializationConstructor new
		  constructorString: self;
		  yourself
]
