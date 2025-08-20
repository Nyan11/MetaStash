Extension { #name : 'Color' }

{ #category : '*MetaStash-Description-Pharo' }
Color >> metaStashAccessorAlpha [

	<MetaStash: #Bloc>
	^ (MetaStashDescriptionAccessorOnlyGetter new getObject: self alpha)
]

{ #category : '*MetaStash-Description-Pharo' }
Color >> metaStashAccessorBlue [

	<MetaStash: #Bloc>
	^ (MetaStashDescriptionAccessorOnlyGetter new getObject: self blue)
]

{ #category : '*MetaStash-Description-Pharo' }
Color >> metaStashAccessorGreen [

	<MetaStash: #Bloc>
	^ (MetaStashDescriptionAccessorOnlyGetter new getObject: self green) 
]

{ #category : '*MetaStash-Description-Pharo' }
Color >> metaStashAccessorRed [

	<MetaStash: #Bloc>
	^ (MetaStashDescriptionAccessorOnlyGetter new getObject: self red)
]

{ #category : '*MetaStash-Description-Pharo' }
Color >> metaStashSerializationConstructor [

	^ MetaStashSerializationMacrosConstructor new
		  macros: 'Color r: <1s> g: <2s> b: <3s> alpha: <4s>';
		  withArgumentAccessors: {
				  self metaStashAccessorRed.
				  self metaStashAccessorBlue.
				  self metaStashAccessorGreen.
				  self metaStashAccessorAlpha };
		  yourself
]
