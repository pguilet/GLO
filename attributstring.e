note
	description: "Summary description for {ATTRIBUTSTRING}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ATTRIBUTSTRING
inherit ATTRIBUT
create
makeAttributString
	feature
		value:STRING

		makeAttributString(nomAttributBis:STRING)
		do
			nomAttribut:=nomAttributBis
		end

		insererValeur(valeur:STRING)
		do
			value:= valeur
		end

end
