Class {
	#name : 'BaselineOfBushmeat',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfBushmeat',
	#package : 'BaselineOfBushmeat'
}

{ #category : 'as yet unclassified' }
BaselineOfBushmeat >> baseline: spec [
	<baseline>
	spec for: #common do: [
		spec
			package: 'Bushmeat-Model';
		
			package: 'Bushmeat-Model-Tests'
			with: [ spec requires: #('Bushmeat-Model') ] ].
]
