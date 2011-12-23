note
	description: "Summary description for {ATTRIBUTINTEGER}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ATTRIBUTTYPESIMPLE [G]

inherit
	ATTRIBUT

create
	makeattribut

feature

	value: G

	makeattribut (nomattributbis: STRING_8)
		do
			nomattribut := nomattributbis
		end

	inserervaleur (valeur: G)
		do
			value := valeur
		end

end -- class ATTRIBUTTYPESIMPLE

