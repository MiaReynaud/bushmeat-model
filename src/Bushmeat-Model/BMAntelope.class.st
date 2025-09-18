Class {
	#name : 'BMAntelope',
	#superclass : 'CMAgent',
	#category : 'Bushmeat-Model',
	#package : 'Bushmeat-Model'
}

{ #category : 'accessing' }
BMAntelope >> aging [

	<action>
	age := age + 1.
]

{ #category : 'accessing' }
BMAntelope >> counter [

	^ counter
]

{ #category : 'accessing' }
BMAntelope >> counter: anObject [

	counter := anObject
]

{ #category : 'accessing' }
BMAntelope >> getTrapped [

	<action>
	
	self die 
]

{ #category : 'accessing' }
BMAntelope >> getTrapped1 [

	^ getTrapped
]

{ #category : 'accessing' }
BMAntelope >> getTrapped: anObject [

	getTrapped := anObject
]

{ #category : 'accessing' }
BMAntelope >> initialize [

	super initialize.
	counter := (self randomBetween: 1 and: 624) asInteger.
]

{ #category : 'accessing' }
BMAntelope >> moveRandomly [

    <action>

"	self cell hasTrap ifTrue: [
		self getTrapped.
		^ self ]. "" ^self to stop the code lecture"

    self cell neighbourhood
        detect: [ :each | each hasTrap and: [ (each hasOccupantsOfClass: BMAntelope) not ] ]
        ifFound: [ :each | self moveTo: each ]
        ifNone: [ self randomWalkConstrainedBy: [ :aCell |
        (aCell hasOccupantsOfClass: BMAntelope) not ] ].

	
]

{ #category : 'accessing' }
BMAntelope >> pov [
    <pov>
    ^ CMPointOfView
        color: CMColor brown 
        shape: #star
        size: 0.6
]

{ #category : 'accessing' }
BMAntelope >> reproduce [

	<action>

	| newAntelope freePatch |

	cell ifNil: [ ^ self ].
	
	freePatch := self nearestEmptyLocationWithinRadius: 1.
	freePatch ifNil: [ ^ self ].
	
	newAntelope := self cormasModel newEntity: self class.
	
	newAntelope moveTo: freePatch.
]

{ #category : 'accessing' }
BMAntelope >> step [

	<action>
	counter := counter + 1.

	self moveRandomly.
	
	"an antelope clones if she has more than 79 weeks of existence"
	((counter > 79) and: (counter / 30) isInteger) ifTrue: [self reproduce].

	"antelopes die after 12 years of living (624 weeks)"
	counter > 624 ifTrue: [ self die ]
]
