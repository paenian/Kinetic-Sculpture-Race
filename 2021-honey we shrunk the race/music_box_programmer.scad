

//Defines whether a pre-defined song or the NoteString shall be used.
SongPicker = "Star-Spangled Banner"; // [Note-String,Star-Spangled Banner]

//Defines where to set the holes for the notes. You have the notes c1 to c3. The first two characters define the note (c1,d1,e1...b1,c2,...c3), the last two characters define the beat. You have 50 beats to use. After every note-definition place a |. One c1 on the third beat would result in this NoteString: "c103|". Don't forget the | at the end!
NoteString = ["c101","d102","e103","f104","g105","a106","b107","c208","d209","e210","f211","g212","a213","b214","c315"];

//The layer-thickness must not be more then 0.4mm. Otherwise it won't fit into the music box! Also try to print at least two layers - so slice it with a layer height of 0.2mm.
LayerThickness = 0.4;

//Defines the width of the stripe (in mm).
StripeWidth = 41; // [30:50]

//Defines the length of the stripe. 15 beats need a length around 60mm. The full 50 beats would need 200mm.
StripeLength = 900; // [10:200]

//For fine-tuning only: defines how far the c1 is away from the left stripe-border (in mm).
MarginLeft = 5; // [2:10]

//For fine-tuning only: defines the distance between the beats.
BeatDistance = 8;

//For fine-tuning only: defines the distance between the beats.
ToneDistance = 2;

//how big the note holes are
note_hole_rad = 1.2;

Stripe = 4;
StripeOverlap = 30;

$fn=18;
projection(cut = false){
    translate([0,-Stripe*StripeLength,0]) Start(Stripe = Stripe);
}

module Start(Stripe = Stripe)
{
NoteString_AmericanAnthem = "a101|f103|d104|f106|d106|a108|e108|d210|d110|f113|f214|f114|e215|f115|d216|f116|f118|d118|g120|d120|a122|c122|a131|f133|d134|f106|d106|a108|e108|d210|d110|f113|f214|f114|e215|f115|d216|f116|f118|d118|g120|d120|a122|c122|";

NoteString_wreckingball = [
        ["a2",0,07],["d2",0,09],["a2",0,11],["d2",0,13],["a2",0,15],["c2",0,17],["a2",0,19],["c2",0,21],["c2",0,23],["e2",0,24],["d2",0,26],["e2",0,29],["d2",0,30],["e2",0,31],["f2",0,32],["d2",0,34],
        ["a2",4,07],["d2",4,09],["a2",4,11],["d2",4,13],["a2",4,15],["c2",4,17],["a2",4,19],["c2",4,21],["c2",4,23],["e2",4,24],["d2",4,26],["e2",4,29],["d2",4,30],["e2",4,31],["f2",4,32],["d2",4,34],
        ["d2",9,1],["d2",9,3],["d2",9,5],["c2",9,6],["a1",9,7],["d2",10,1],["d2",10,3],["d2",10,5],["c2",10,6],["a1",10,7],["c2",11,1],["c2",11,3],["c2",11,5],["b1",11,6],["a1",11,8],["f1",12,2],
        ["d2",13,1],["d2",13,3],["d2",13,5],["c2",13,6],["a1",13,7],["d2",14,1],["d2",14,3],["d2",14,5],["c2",14,6],["a1",14,7],["c2",15,1],["c2",15,3],["c2",15,5],["b1",15,6],["a1",15,8],["f1",16,2],
        ["b2",17,4],["b2",17,5],["b2",17,6],["b2",17,7],["b2",17,8],["b2",18,1],["a2",18,4],["a2",18,5],["g2",18,8],["f2",19,4],["b2",19,5],["a2",19,6],["g2",19,7],["f2",19,8],["b2",20,1],["a2",20,4],["a2",20,5],
    //I came in like a wrecking ball, I never hit so hard in love.
        ["f2",21,3],["f2",21,4],["b2",21,5],["a2",21,6],["g2",21,7],["f2",21,8],["b2",22,1],["a2",22,4],["a2",22,5],["g2",22,8],
    //all I wanted was to break your walls
        ["f2",23,3],["f2",23,4],["b2",23,5],["a2",23,6],["g2",23,7],["f2",23,8],["b2",24,5],["a2",24,6.33333],["g2",24,7.66666],["b2",25,1],
    //all you ever did was wreck me
        ["f2",25,7],["f2",25,8],["f2",26,4],["b2",26,5],["a2",26,6.33333],["g2",26,7.66666],["b2",27,1],
    //yeah you, you wreck me
        ["a2",27,07],["d2",27,09],["a2",27,11],["d2",27,13],["a2",27,15],["c2",27,17],["a2",27,19],["c2",27,21],["c2",27,23],["e2",27,24],["d2",27,26],["e2",27,29],["d2",27,30],["e2",27,31],["f2",27,32],["d2",27,34],
    //I put you high up in the sky and now, you're not coming down
        ["a2",31,07],["d2",31,09],["a2",31,11],["d2",31,13],["a2",31,15],["c2",31,17],["a2",31,19],["c2",31,21],["c2",31,23],["e2",31,24],["d2",31,26],["e2",31,29],["d2",31,30],["e2",31,31],["f2",31,32],["d2",31,34],
    //It slowly turned you let me burn and now, we're ashes on the ground
    
        ["d2",36,1],["d2",36,3],["d2",36,5],["c2",36,6],["a1",36,7],["d2",37,1],["d2",37,3],["d2",37,5],["c2",37,6],["a1",37,7],["c2",38,1],["c2",38,3],["c2",38,5],["b1",38,6],["a1",38,8],["f1",39,2],
    //don't you ever say I just walked away I will always want you
        ["d2",40,1],["d2",40,3],["d2",40,5],["c2",40,6],["a1",40,7],["d2",41,1],["d2",41,3],["d2",41,5],["c2",41,6],["a1",41,7],["c2",42,1],["c2",42,3],["c2",42,5],["b1",42,6],["a1",42,8],["f1",43,2],
    //I can't live a lie, running for my life, I will always want you.
        ["b2",43,4],["b2",43,5],["b2",43,6],["b2",43,7],["b2",43,8],["b2",44,1],["a2",44,4],["a2",44,5],["g2",44,8],["f2",45,4],["b2",45,5],["a2",45,6],["g2",45,7],["f2",45,8],["b2",46,1],["a2",46,4],["a2",46,5],
    //I came in like a wrecking ball, I never hit so hard in love.
        ["f2",47,3],["f2",47,4],["b2",47,5],["a2",47,6],["g2",47,7],["f2",47,8],["b2",48,1],["a2",48,4],["a2",48,5],["g2",48,8],
    //all I wanted was to break your walls
        ["f2",49,3],["f2",49,4],["b2",49,5],["a2",49,6],["g2",49,7],["f2",49,8],["b2",50,5],["a2",50,6.33333],["g2",50,7.66666],["b2",51,1],
    //all you ever did was wreck me
        ["b2",51,4],["b2",51,5],["b2",51,6],["b2",51,7],["b2",51,8],["b2",52,1],["a2",52,4],["a2",52,5],["g2",52,8],["f2",53,4],["b2",53,5],["a2",53,6],["g2",53,7],["f2",53,8],["b2",54,1],["a2",54,4],["a2",54,5],
    //I came in like a wrecking ball, yeah I just closed my eyes and swung,
        ["f2",55,3],["f2",55,4],["b2",55,5],["a2",55,6],["g2",55,7],["f2",55,8],["b2",56,1],["a2",56,4],["a2",56,5],["g2",56,8],
        ["f2",57,3],["f2",57,4],["b2",57,5],["a2",57,6],["g2",57,7],["f2",57,8],["b2",58,5],["a2",58,6.33333],["g2",58,7.66666],["b2",59,1],
    //all you ever did was wreck me
        ["f2",59,7],["f2",59,8],["f2",60,4],["b2",60,5],["a2",60,6.33333],["g2",60,7.66666],["b2",61,1],
    //yeah you, you wreck me 
];

if( SongPicker == "Star-Spangled Banner")
	BuildStripe(NoteString_wreckingball, Stripe);
else if (SongPicker == "Note-String")
	BuildStripe(NoteString);
}

module BuildStripe(NoteStringLocal, Stripe=Stripe){
	//takte=search("|",NoteStringLocal,1000)[0];
	difference()
	{
		BuildBase(Stripe);
		for(i=[0:len(NoteStringLocal)-1])
		{
            echo(NoteStringLocal[i]);
            note = NoteStringLocal[i][0];
            beat = 8*NoteStringLocal[i][1] + NoteStringLocal[i][2];
            
            echo(note, beat);
            
			printNote2(beat, note);
		}
	}
}

module printNote2(takt,note)
{
	if (note == "c1")
		MakeHole(takt,1);
	else if (note == "d1")
		MakeHole(takt,2);
	else if (note == "e1")
		MakeHole(takt,3);
	else if (note == "f1")
		MakeHole(takt,4);
	else if (note == "g1")
		MakeHole(takt,5);
	else if (note == "a1")
		MakeHole(takt,6);
	else if (note == "b1") //h
		MakeHole(takt,7);
	else if (note == "c2")
		MakeHole(takt,8);
	else if (note == "d2")
		MakeHole(takt,9);
	else if (note == "e2")
		MakeHole(takt,10);
	else if (note == "f2")
		MakeHole(takt,11);
	else if (note == "g2")
		MakeHole(takt,12);
	else if (note == "a2")
		MakeHole(takt,13);
	else if (note == "b2") //h
		MakeHole(takt,14);
	else if (note == "c3")
		MakeHole(takt,15);
}

module MakeHole(beatNumber,pitchNumber){
	Y = MarginLeft + (beatNumber * BeatDistance);
	X = StripeWidth - MarginLeft - (pitchNumber * ToneDistance) + 1;

	translate([X,Y,-1]) cylinder(h=LayerThickness*20,r=note_hole_rad);
}

module BuildBase(Stripe=Stripe){
	translate([0,Stripe*StripeLength]) cube([StripeWidth,StripeLength+StripeOverlap,LayerThickness]);
}



function s2d(h="0",base=10,i=-1) =
// converts a string of hexa/or/decimal digits into a decimal 
// integers only
	(i == -1)
	? s2d(h,base,i=len(h)-1)
	: 	(i == 0)
		? _chkBase(_d2n(h[0]),base)
		: _chkBase(_d2n(h[i]),base) + base*s2d(h,base,i-1);

function _chkBase(n,b) = 
	(n>=b)
	? (0/0)		// 0/0=nan
	: n;

function _d2n(digitStr) =
// SINGLE string Digit 2 Number, decimal (0-9) or hex (0-F) - upper or lower A-F
	(digitStr == undef 
				|| len(digitStr) == undef 
				|| len(digitStr) != 1)
	? -1 // 0/0 = nan
	: _d2nV()[search(digitStr,_d2nV(),1,0)[0]][1];

function _d2nV()= 
// Digit 2 Number Vector, use function instead of variable - no footprints
  [	["0",0],["1",1],["2",2],["3",3],["4",4],
		["5",5],["6",6],["7",7],["8",8],["9",9],
		["a",10],["b",11],["c",12],
		["d",13],["e",14],["f",15],
		["A",10],["B",11],["C",12],
		["D",13],["E",14],["F",15]
	];




