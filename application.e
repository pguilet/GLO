note
	description : "ProjetGLO application root class"
	date        : "$Date$"
	revision    : "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS

create
	make

feature {NONE} -- Initialization
	jeu: JEU
	listeActeur: ARRAYED_LIST[ACTEUR]
	listeItem: ARRAYED_LIST[ITEM]
	listeAction: ARRAYED_LIST[ACTION]
	listeVictoire: ARRAYED_LIST[VICTOIRE]
	listeDefaite: ARRAYED_LIST[DEFAITE]
	make
		-- Run application.
	do
		--| Add your code here

	end

end
