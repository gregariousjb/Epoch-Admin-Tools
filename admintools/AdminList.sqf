// Epoch Admin Tools
//Replace 76561198096556433 with your ID. 
AdminList = [
"76561198096556433", // <TheHound>
"999999999" // <Admin In-Game Name>
];
ModList = [
"97025030", // <LittleRed>
"999999999" // <Moderator In-Game Name>
];

/*
	Base deletion variable. Default true.
	Determines default true or false for deleting all vehicles
	inside the base delete dome. Can be changed in game.
*/
BD_vehicles = true;




// DO NOT MODIFY ANYTHING BEYOND THIS POINT
tempList = []; 

/*
	Determines default on or off for admin tools menu
	Set this to false if you want the menu to be off by default.
	F11 turns the tool off, F10 turns it on.
	Leave this as True for now, it is under construction.
*/
if (isNil "toolsAreActive") then {toolsAreActive = true;};
