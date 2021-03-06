
lexer grammar XMLLexer;

COMMENT     :   ('<!--' .*? '-->' | '<?' .*? '?>') -> skip;

OPEN        :   '<'   ;
CLOSE       :   '>' ;
SLASH_CLOSE :   '/>' ;
SLASH       :   '/' ;
HIFEN		:   '-' ;
EQUALS      :   '=' ;
DOUBLE_QUOTES: '"' ;
DOT: '.' ;
WS			: 	[ \t\n\r]+ -> skip;


//////////////////////////////////////////////////////////////////
//////////////////// ATTRIBUTES GOING TO MODES ///////////////////
//////////////////////////////////////////////////////////////////

AVAILABILITY: 'availability="' -> pushMode(AVAILABILITY_MODE);
SURFACE: 'surface="' -> pushMode(SURFACE_MODE); 
DESIGNATOR: 'designator="' -> pushMode(DESIGNATOR_MODE);
PRIMARYDESIGNATOR: 'primaryDesignator="' -> pushMode(DESIGNATOR_MODE);
SECONDARYDESIGNATOR: 'secondaryDesignator="'-> pushMode(DESIGNATOR_MODE);
NUMBER: 'number="'  -> pushMode(NUMBER_MODE);
CENTER: 'center="' -> pushMode(LEVELS_MODE);
EDGE: 'edge="' -> pushMode(LEVELS_MODE);
SYSTEM: 'system="' -> pushMode(SYSTEM_MODE);
PUSHBACK: 'pushBack="' ->pushMode(PUSHBACK_MODE);
LEFTEDGE: 'leftEdge="' -> pushMode(EDGETYPE_MODE);
RIGHTEDGE: 'rightEdge="' -> pushMode(EDGETYPE_MODE);
ORIENTATION: 'orientation="' -> pushMode(ORIENTATION_MODE);
END: 'end="' -> pushMode(END_MODE);
AIRLINECODES: 'airlineCodes="' -> pushMode(AIRLINECODES_MODE);

PRIMARYPATTERN : 'primaryPattern="' -> pushMode(LEFT_RIGHT_MODE);
SECONDARYPATTERN: 'secondaryPattern="' -> pushMode(LEFT_RIGHT_MODE);
SIDE: 'side="' -> pushMode(LEFT_RIGHT_MODE);

GATENAME: 'gateName="' -> pushMode (GATENAME_MODE);
WAYPOINTTYPE: 'waypointType="' -> pushMode(WAYPOINTTYPE_MODE);
ROUTETYPE: 'routeType="' -> pushMode(ROUTETYPE_MODE);

INSTANCE_ID: 'instanceId="' -> pushMode(GUID_MODE);
PROFILE: 'profile="' -> pushMode(GUID_MODE);

/////////////////////FLOATS///////////////////////
LAT: 'lat="' -> pushMode(FLOAT_MODE);
LON: 'lon="'-> pushMode(FLOAT_MODE);
ALT: 'alt="' -> pushMode(FLOAT_MODE);
MAGVAR: 'magvar="' -> pushMode(FLOAT_MODE);
FREQUENCY: 'frequency="' -> pushMode(FLOAT_MODE);
TRAFFICSCALAR: 'trafficScalar="' -> pushMode(FLOAT_MODE);
PATTERNALTITUDE: 'patternAltitude="' -> pushMode(FLOAT_MODE);
SECONDARYMARKINGBIAS:'secondaryMarkingBias="'-> pushMode(FLOAT_MODE);
PRIMARYMARKINGBIAS:'primaryMarkingBias="'-> pushMode(FLOAT_MODE);
SPACING: 'spacing="'-> pushMode(FLOAT_MODE);
PITCH: 'pitch="'-> pushMode(FLOAT_MODE);
RANGE: 'range="'-> pushMode(FLOAT_MODE);
HEADING: 'heading="' -> pushMode(FLOAT_MODE);
TEEOFFSET: 'teeOffset'[1-9]'="'-> pushMode(FLOAT_MODE);
WEIGHTLIMIT: 'weightLimit="'-> pushMode(FLOAT_MODE);
LENGTH: 'length="' -> pushMode(FLOAT_MODE);
WIDTH: 'width="'-> pushMode(FLOAT_MODE);
BIASX: 'biasX="'-> pushMode(FLOAT_MODE);
BIASY: 'biasY="'-> pushMode(FLOAT_MODE);
BIASZ: 'biasZ="'-> pushMode(FLOAT_MODE);

ALTITUDEMINIMUM: 'altitudeMinimum="' -> pushMode(FLOAT_MODE) ;
RADIUS: 'radius="' -> pushMode(FLOAT_MODE);

/////////////////////INTEGERS///////////////////////
STROBES: 'strobes="' -> pushMode(INTEGER_MODE);
INDEX: 'index="' -> pushMode(INTEGER_MODE);
START: 'start="' -> pushMode(INTEGER_MODE);
AIRPORTTESTRADIUS : 'airportTestRadius="' -> pushMode(INTEGER_MODE);

PARKINGNUMBER: 'parkingNumber="' -> pushMode(INTEGER_MODE);

RED: 'red="' -> pushMode(INTEGER_MODE);
GREEN: 'green="' -> pushMode(INTEGER_MODE);
BLUE: 'blue="' -> pushMode(INTEGER_MODE);


////////////////STRING MIXED + NUMBERS + WS ///////

NAME: 'name="' -> pushMode(STRING_LETTERS_MIXEDCASE);
REGION: 'region="' -> pushMode(STRING_LETTERS_MIXEDCASE);
COUNTRY: 'country="' -> pushMode(STRING_LETTERS_MIXEDCASE);
STATE: 'state="' -> pushMode(STRING_LETTERS_MIXEDCASE);
CITY: 'city="' -> pushMode(STRING_LETTERS_MIXEDCASE);
TYPE: 'type="' -> pushMode(STRING_LETTERS_MIXEDCASE);

WAYPOINTREGION: 'waypointRegion="' -> pushMode(STRING_LETTERS_MIXEDCASE);
WAYPOINTIDENT: 'waypointIdent="' -> pushMode(STRING_LETTERS_MIXEDCASE);


IDENT: 'ident="' -> pushMode(STRING_LETTERS_MIXEDCASE);
//////////////////////////////////////////////////////////////////
/////////////////////////// ELEMENTS /////////////////////////////
//////////////////////////////////////////////////////////////////

/*Open Elements*/
OpenAirport: '<Airport' ;
OpenServices: '<Services>' ;
OpenTower: '<Tower' ;
OpenRunway: '<Runway';
OpenStart: '<Start' ;
OpenCom: '<Com' ;
OpenFuel: '<Fuel' ;

OpenLight: '<Lights' ;
OpenOffsetThreshold: '<OffsetThreshold';
OpenBlastPad: '<BlastPad';
OpenOverrun: '<Overrun';
OpenApproachLights: '<ApproachLights' ;
OpenVasi: '<Vasi';
OpenIls: '<Ils';

OpenDeleteAirport:'<DeleteAirport'	;
OpenDeleteRunway:'<DeleteRunway';
OpenDeleteStart:'<DeleteStart';
OpenDeleteFrequency:'<DeleteFrequency';
OpenMarkings: '<Markings';

OpenTaxiwayPoint: '<TaxiwayPoint';
OpenTaxiwayParking: '<TaxiwayParking';
OpenTaxiwayPath: '<TaxiwayPath';
OpenTaxiName: '<TaxiName';

OpenJetway: '<Jetway';
StartAprons: '<Aprons>' ;
OpenApron: '<Apron' ;
OpenVertex: '<Vertex';
StartApronEdgeLights: '<ApronEdgeLights>' ;
StartEdgeLights: '<EdgeLights>';
OpenTaxiwaySign: '<TaxiwaySign';
OpenWaypoint: '<Waypoint' ;
OpenPrevious: '<Previous';
OpenNext: '<Next';
OpenRoute: '<Route' ;
OpenBoundaryFence: '<BoundaryFence';
OpenBlastFence: '<BlastFence';

OpenHelipad: '<Helipad' ;
OpenGlideSlope: '<GlideSlope' ;
OpendDme: '<Dme';

/* End Elements */
EndAirport: '</Airport>';
EndServices: '</Services>' ;
EndRunway: '</Runway>' ;
EndTower: '</Tower>' ;
CloseIls: '</Ils>';
CloseJetway: '</Jetway>';
CloseAprons: '</Aprons>';
EndApron:  '</Apron>' ;
EndApronEdgeLights: '</ApronEdgeLights>' ;
EndEdgeLights: '</EdgeLights>';
EndWaypoint: '</Waypoint>';
EndRoute: '</Route>' ;
CloseBoundaryFence: '</BoundaryFence>';
CloseBlastFence: '</BlastFence>';
//////////////////////////////////////////////////////////////////////
//////////////////////////// ATRIBUTE NAMES //////////////////////////
//////////////////////////////////////////////////////////////////////


PRIMARYTAKEOFF: 'primaryTakeoff' ;
PRIMARYLANDING: 'primaryLanding' ;
SECONDARYTAKEOFF: 'secondaryTakeoff' ;
SECONDARYLANDING: 'secondaryLanding' ;

CENTER_RED: 'centerRed';
REIL: 'reil';
ENDLIGHTS: 'endLights';
BACKCOURSE: 'backCourse';

ALTERNATETHRESHOLD: 'alternateThreshold';
ALTERNATETOUCHDOWN: 'alternateTouchdown';
ALTERNATEFIXEDDISTANCE: 'alternateFixedDistance';
ALTERNATEPRECISION: 'alternatePrecision';
LEADINGZEROIDENT: 'leadingZeroIdent';
NOTHRESHOLDENDARROWS: 'noThresholdEndArrows';


EDGES:'edges';
THRESHOLD:'threshold';
FIXEDDISTANCE:'fixedDistance';
TOUCHDOWN:'touchdown';
DASHES:'dashes';
PRECISION:'precision';
EDGEPAVEMENT:'edgePavement';
SINGLEEND:'singleEnd';
PRIMARYCLOSED:'primaryClosed';
SECONDARYCLOSED:'secondaryClosed';
PRIMARYSTOL:'primaryStol';
SECONDARYSTOL:'secondaryStol';

DRAWSURFACE: 'drawSurface';
DRAWDETAIL: 'drawDetail';
CENTERLINE: 'centerLine';
CENTERLINELIGHTED: 'centerLineLighted';
LEFTEDGELIGHTED: 'leftEdgeLighted';
RIGHTEDGELIGHTED: 'rightEdgeLighted';

TRANSPARENT: 'transparent';
CLOSED: 'closed';

 DELETEAIRPORTATRIBUTES: 
'deleteAllApproaches'		|
'deleteAllApronLights'		|
'deleteAllAprons'			|
'deleteAllFrequencies'		|
'deleteAllHelipads'			|
'deleteAllRunways'			|
'deleteAllStarts'			|
'deleteAllTaxiways'			|
'deleteAllBlastFences'		|
'deleteAllBoundaryFences'	|
'deleteAllControlTowers'	|
'deleteAllJetways'			;


//////////////////////////////////////////////////////////////////////
///////////////////////////////// WORDS //////////////////////////////
//////////////////////////////////////////////////////////////////////

YES_NO: 'YES' | 'NO' ;
BOOLEAN: 'TRUE' | 'FALSE' ;


//////////////////////////////////////////////////////////////////////
//////////////////////////////// GENERAL /////////////////////////////
//////////////////////////////////////////////////////////////////////

INT_NUMBER: DIGIT+; 
SINGLE_LETTER_UPPER: UPPER_CASE_LETTER;


fragment DIGIT: [0-9] ;
fragment UPPER_CASE_LETTER: [A-Z] ;
fragment LOWER_CASE_LETTER: [a-z] ;


//////////////////////////////////////////////////////////////////////
///////////////////////////////  MODES  //////////////////////////////
//////////////////////////////////////////////////////////////////////
mode STRING_LETTERS_MIXEDCASE;
BOOLEAN2: ('TRUE' | 'FALSE') -> popMode;
STRING_LETTERS_MIXED: [ 0-9A-Za-z'_''/']* -> popMode;

mode STRING_LETTERS_UPPERCASE_MODE;

STRING_LETTERS_UPPERCASE : [A-Z ]+ -> popMode;

mode AVAILABILITY_MODE;
AVAILABILITY_WORDS: ('UNKNOWN' | 'PRIOR_REQUEST' | 'YES' | 'NO') -> popMode;

mode SURFACE_MODE;
SURFACETYPES:
		('ASPHALT'			|
		'BITUMINOUS'		|
		'BRICK'				|
		'CLAY'				|
		'CEMENT'			|
		'CONCRETE'			|
		'CORAL'				|
		'DIRT'				|
		'GRASS'				|
		'GRAVEL'			|
		'ICE'				|
		'MACADAM'			|
		'OIL_TREATED, PLANKS'|
		'SAND'				|
		'SHALE'				|
		'SNOW'				|
		'STEEL_MATS'		|
		'TARMAC'			|
		'UNKNOWN'			|
		'WATER'				)-> popMode;
		

mode DESIGNATOR_MODE;
DESIGNATORVALUES:
			('NONE'			|
			'C'				|
			'CENTER'		|
			'L'				|
			'LEFT'			|
			'R'				|
			'RIGHT'			|
			'W'				|
			'WATER'			|
			'A'				|
			'B'				)->popMode;

mode NUMBER_MODE;
NUMBER_VALUES:( ([0-9][0-9]?[0-9]?[0-9]?) | DIRECTIONS )-> popMode; 

/*( ([0][0-9]) | DIRECTIONS	| [0-9]([0-9])?	)*/
/*
no final: 
	00-09 | 0-36 | DIR 
	ou 0-3999
conforme o atributo onde estamos...
*/	

DIRECTIONS:
			'EAST'			|
			'NORTH'			|
			'NORTHEAST'		|
			'NORTHWEST'		|
			'SOUTH'			|
			'SOUTHEAST'		|
			'SOUTHWEST'		|
			'WEST'			;


mode LEVELS_MODE;
LEVELS:
	('NONE' |
	'LOW' |
	'MEDIUM' |
	'HIGH'  )-> popMode;


mode SYSTEM_MODE;
SYSTEM_OPTIONS: 
	('NONE' |
	'ALSF1' |
	'ALSF2' |
	'CALVERT' |
	'CALVERT2' |
	'MALS'|
	'MALSF'|
	'MALSR'|
	'ODALS'|
	'RAIL'|
	'SALS'|
	'SALSF'|
	'SSALF'|
	'SSALR'|
	'SSALS') -> popMode;

mode PUSHBACK_MODE;
PUSHBACKVALUES: ('NONE' | 'BOTH' | 'LEFT' | 'RIGHT') -> popMode;

mode EDGETYPE_MODE;
EDGETYPE: ('NONE' | 'SOLID' | 'DASHED' | 'SOLID_DASHED') -> popMode;

mode ORIENTATION_MODE;
ORIENTATIONTYPE: ( 'FORWARD' | 'REVERSE' ) -> popMode;

mode END_MODE;
PRIORITY: ( 'PRIMARY' | 'SECONDARY' ) -> popMode; /*offsetThreshold -> end*/
INT_NUMBER2: [0-9]+ -> popMode; /*taxiway -> end */

mode LEFT_RIGHT_MODE;
LEFT_RIGHT: ('LEFT' | 'RIGHT') -> popMode ;

mode AIRLINECODES_MODE;
AIRLINECODESVALUES: ( [A-Z]+(','[A-Z]+)* ) -> popMode ;

mode INTEGER_MODE;
IntegerValue: ('+' | '-' )? ([0-9] | ([1-9][0-9]* (DOT '0')?) ) ->popMode;

mode FLOAT_MODE;
FloatingPointValue: ('+' | '-' )? [0-9]+ (DOT [0-9]+)? ->popMode;

mode GATENAME_MODE;
GATENAME_WORDS:
	( 'PARKING'
	| 'DOCK'
	| 'GATE'
	| 'GATE_'[A-Z] 
	| 'NONE'
	| ['N'|'NE'|'NW'|'SE'|'S'|'SW'|'W'|'E']'_PARKING' ) -> popMode;


mode WAYPOINTTYPE_MODE;
WAYPOINTTYPE_WORDS: 
	 ('NAMED'
	| 'UNNAMED'
	| 'VOR'
	| 'NDB'
	| 'OFF_ROUTE'
	| 'IAF'
	| 'FAF' ) -> popMode;

mode ROUTETYPE_MODE;
ROUTETYPE_WORDS: ('VICTOR' | 'JET' | 'BOTH') -> popMode;

mode GUID_MODE;
GUID: ('{' FRAG_GUID FRAG_GUID FRAG_GUID FRAG_GUID FRAG_GUID FRAG_GUID FRAG_GUID FRAG_GUID
	'-' FRAG_GUID FRAG_GUID FRAG_GUID FRAG_GUID 
	'-' FRAG_GUID FRAG_GUID FRAG_GUID FRAG_GUID 
	'-' FRAG_GUID FRAG_GUID FRAG_GUID FRAG_GUID 
	'-' FRAG_GUID FRAG_GUID FRAG_GUID FRAG_GUID 
			FRAG_GUID FRAG_GUID FRAG_GUID FRAG_GUID 
			FRAG_GUID FRAG_GUID FRAG_GUID FRAG_GUID '}' ) ->popMode ;



fragment FRAG_GUID: [a-zA-Z0-9] ;

//////////////////////////////////////////////////////////////////////
/////////////////////////  TYPES COMENTADOS  /////////////////////////
//////////////////////////////////////////////////////////////////////
// pus estes types a ler strings normais, em vez das palavras, visto
// que são vários atributos "type", com conjuntos de palavras
// que aparecem várias vezes... não sei mt bem o que fazer.

/*
TYPESFUEL_WORDS: '73'|'87'|'100'|'130'|'145'|'MOGAS'|'JET'|'JETA'
	|'JETA1'|'JETAP'|'JETB'|'JET4'|'JET5'|'UNKNOWN';	


TYPEDELETESTART:
		'RUNWAY'			|
		'HELIPAD'			|
		'WATER'				;

 TYPEDELETEFREQUENCY:
	'APPROACH'				|
	'ASOS'					|
	'ATIS'					|
	'AWOS'					|
	'CENTER'				|
	'CLEARANCE'				|
	'CLEARANCE_PRE_TAXI'	|
	'CTAF'					|
	'DEPARTURE'				|
	'FSS'					|
	'GROUND'				|
	'MULTICOM'				|
	'REMOTE_CLEARANCE_DELIVERY'|
	'TOWER'					|
	'UNICOM'				;

VASI_TYPE: 
	'PAPI2'
	'PAPI4'
	'PVASI'
	'TRICOLOR'
	'TVASI' 
	'VASI21'
	'VASI22'
	'VASI23'
	'VASI31'
	'VASI32'
	'VASI33'
	'BALL'
	'APAP'
	'PANELS';


TAXIWAYPOINTTYPE: 'NORMAL' | 'HOLD_SHORT' | 'ILS_HOLD_SHORT' | 'HOLD_SHORT_NO_DRAW' | 'ILS_HOLD_SHORT_NO_DRAW';

TAXIWAYPATHTYPE: 'RUNWAY' | 'PARKING' | 'TAXI' | 'PATH' | 'CLOSED' | 'VEHICLE';

TAXIWAYPARKINGTYPE: 
'NONE'
| 'DOCK_GA'
| 'FUEL'
| 'GATE_'['HEAVY'|'MEDIUM'|'SMALL']
| 'RAMP_CARGO'
| 'RAMP_GA'('_'('LARGE'|'MEDIUM'|'SMALL'))?
| 'RAMP_MIL_'['CARGO'|'COMBAT']
| 'VEHICLE';

*/

///////////////// NAME COMENTADO //////////////
/* este name também está comentado pois há um name que leva isto, 
   e outro que é uma string qq */

/*
NAMETAXIWAYPARKING:
'PARKING'
| 'DOCK'
| 'GATE'
| 'GATE_'[A-Z] 
| 'NONE'
| ['N'|'NE'|'NW'|'SE'|'S'|'SW'|'W'|'E']'_PARKING';

*/