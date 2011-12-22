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
	listeTypeActeur: ARRAYED_LIST[TYPEACTEUR]
	listeTypeItem: ARRAYED_LIST[TYPEITEM]

	read:READFILE
	make
		-- Run application.
	do
		--| Add your code here
		print("test")
		create read.make
		read.parsefichierregle ("regle.txt",)

		print("test2")
	end

end
