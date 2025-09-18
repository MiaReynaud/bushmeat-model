Class {
	#name : 'BMModel',
	#superclass : 'CMAbstractModel',
	#category : 'Bushmeat-Model',
	#package : 'Bushmeat-Model'
}

{ #category : 'as yet unclassified' }
BMModel >> allAntelopes [
	|all|
	all := (self @@ BMAntelope).
	^ all
]

{ #category : 'as yet unclassified' }
BMModel >> allTraps [

	^ self @@ BMTrap
]

{ #category : 'as yet unclassified' }
BMModel >> init [

	<init>
	| trailPlots forestPlots |
	"create the grid"
	self
		createGridNumberOfRows: 31
		numberOfColumns: 31
		neighbourhood: 8
		closed: true.

	"create forest"
	forestPlots := self
		               selectCellsBetweenRow: 1
		               andRow: 31
		               column: 1
		               andColumn: 31.
	forestPlots do: #beForest.

	"create trails"
	trailPlots := self selectCellsOfColumn: 16.
	trailPlots do: #beTrail.
	trailPlots := self selectCellsOfLine: 16.
	trailPlots do: #beTrail.

	"Add two randomly situated antelopes"
	self createN: 600 randomlyLocatedAloneEntities: BMAntelope.

	"Add traps"
	self
		createN: 10
		randomlyLocatedEntities: BMTrap
		constrainedBy: [ :aCell | aCell state = #trail ]
]

{ #category : 'as yet unclassified' }
BMModel >> initSmall [

	<init>
	| trailPlots forestPlots |
	weekNumber := 0.

	"create the grid"
	self
		createGridNumberOfRows: 5
		numberOfColumns: 5
		neighbourhood: 6
		closed: true.

	"create forest"
	forestPlots := self
		               selectCellsBetweenRow: 1
		               andRow: 5
		               column: 1
		               andColumn: 5.
	forestPlots do: #beForest.

	"create trails"
	trailPlots := self selectCellsOfColumn: 3.
	trailPlots do: #beTrail.
	trailPlots := self selectCellsOfLine: 3.
	trailPlots do: #beTrail.

	"Add two randomly situated antelopes"
	self createN: 4 randomlyLocatedAloneEntities: BMAntelope.

	"Add traps"
	self
		createN: 2
		randomlyLocatedEntities: BMTrap
		constrainedBy: [ :aCell | aCell state = #trail ]
]

{ #category : 'as yet unclassified' }
BMModel >> modelName [
	"A human-friendly name of the model"
	^ 'Bushmeat'
]

{ #category : 'as yet unclassified' }
BMModel >> numberOfAntelopes [

	<probeNamed: 'Number of antelopes' color: '0000FF'>
	^ (self @@ BMAntelope) size
]

{ #category : 'as yet unclassified' }
BMModel >> numberOfCatchByWeek [

	<probeNamed: 'Number of catches by week' color: 'FFA500'>
	^ self @@ BMTrap sum: [ :each | each catchCounter ]
]

{ #category : 'as yet unclassified' }
BMModel >> numberOfCatchPerWeek [

	<probeNamed: 'Number of catches by week' color: '808080'>
	^ self @@ BMTrap sum: [ :each | each catchCounterPerWeek ]
]

{ #category : 'as yet unclassified' }
BMModel >> numberOfCatchPerYear [

	<probeNamed: 'Number of catches by trap by year' color: '000000'>
	^ self @@ BMTrap sum: [ :each | each catchCounterPerYear ]
]

{ #category : 'accessing' }
BMModel >> prefix [
	"Every class name in model package must begin with this prefix"
	^ 'Bus'.
]

{ #category : 'as yet unclassified' }
BMModel >> step [

	<control>
	self allTraps shuffle do: [ :each |
			each resetCatchCounter.
			each catchAntelope ].

	"Make the antelopes move randomly"
	self allAntelopes shuffled do: [ :each | each step ]
]

{ #category : 'accessing' }
BMModel >> weekNumber [

	^ weekNumber
]
