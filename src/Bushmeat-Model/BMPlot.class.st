Class {
	#name : 'BMPlot',
	#superclass : 'CMCell',
	#category : 'Bushmeat-Model',
	#package : 'Bushmeat-Model'
}

{ #category : 'as yet unclassified' }
BMPlot >> beForest [

	state := #forest

]

{ #category : 'as yet unclassified' }
BMPlot >> beReserve [

	state := #reserve
]

{ #category : 'as yet unclassified' }
BMPlot >> beTrail [

	state := #trail

]

{ #category : 'testing' }
BMPlot >> hasTrap [
    ^ self hasOccupantsOfClass: BMTrap
]

{ #category : 'accessing' }
BMPlot >> pov [

	<pov>
	| plotColor |
	state = #trail ifTrue: [ ^ CMPointOfView color: 'FFF1A1' ].
	state = #forest ifTrue: [ ^ CMPointOfView color: '3ED13D' ].
	state = #reserve ifTrue: [ ^ CMPointOfView color: 'BEA2E8' ].

	^ CMPointOfView color: plotColor
]

{ #category : 'accessing' }
BMPlot >> state [

	^ state
]

{ #category : 'accessing' }
BMPlot >> state: anObject [

	state := anObject
]
