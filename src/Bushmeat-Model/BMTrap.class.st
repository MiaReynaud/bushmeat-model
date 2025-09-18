Class {
	#name : 'BMTrap',
	#superclass : 'CMAgent',
	#instVars : [
		'catchCounterPerWeek',
		'catchCounterPerYear'
	],
	#category : 'Bushmeat-Model',
	#package : 'Bushmeat-Model'
}

{ #category : 'accessing' }
BMTrap >> catchAntelope [
	"If there is an antelope on the cell, it gets trapped and the catchCounter get 1 point."

	<action>
	(self cell occupantsOfClass: BMAntelope) do: [ :each |
			each getTrapped.
			catchCounter := catchCounter + 1 ]
]

{ #category : 'accessing' }
BMTrap >> catchCounterPerWeek [

	^ catchCounterPerWeek
]

{ #category : 'accessing' }
BMTrap >> catchCounterPerWeek: anObject [

	catchCounterPerWeek := anObject
]

{ #category : 'accessing' }
BMTrap >> catchCounterPerYear [

	^ catchCounterPerYear
]

{ #category : 'accessing' }
BMTrap >> catchCounterPerYear: anObject [

	catchCounterPerYear := anObject
]

{ #category : 'accessing' }
BMTrap >> initialize [
	"At the begining a counter has 0 catch"

	super initialize.
	catchCounterPerWeek := 0.
	catchCounterPerYear := 0
]

{ #category : 'accessing' }
BMTrap >> moveTraps [

	| selectedCell |
	(cormasModel weekNumber / 52) isInteger ifTrue: [
			catchCounterPerYear := 0.
			selectedCell := cormasModel pickRandomCellConstrainedBy: [ :each |
				                each state = #trail ].
			self moveTo: selectedCell ]
]

{ #category : 'accessing' }
BMTrap >> pov [

	<pov>
	^ CMPointOfView 
		color: CMColor gold 
		shape: #diamond
		size: self sizeOfPOV
]

{ #category : 'accessing' }
BMTrap >> resetCatchCounter [ 

	catchCounter := 0
]

{ #category : 'accessing' }
BMTrap >> resetCatchCounterPerWeek [

	catchCounterPerWeek := 0
]

{ #category : 'accessing' }
BMTrap >> sizeOfPOV [

	^ 0.2 + (self catchCounterPerYear / 10)
]
