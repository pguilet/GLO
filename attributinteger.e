note
	description: "Summary description for {ATTRIBUTINTEGER}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ATTRIBUTINTEGER
	inherit ATTRIBUT
	create
		makeAttributInteger
	feature
		value:INTEGER

		makeAttributInteger(nomAttributBis:STRING)
		do
			nomAttribut := nomAttributBis
		end

		insererValeur(valeur:INTEGER)
		do
			value:= valeur
		end

end
