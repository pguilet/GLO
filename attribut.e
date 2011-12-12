note
	description: "Summary description for {ATTRIBUT}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ATTRIBUT

	create
		make
	feature
		nomAttribut:STRING
		typeAttribut:STRING
		value:ANY

		make(nomAttributBis:STRING typeAttributBis:STRING)
		do
			nomAttribut := nomAttributBis
			typeAttribut := typeAttributBis
			value:=void

		end

		insererValeur(valeur:ANY)
		do
			value:= valeur
		end

end
