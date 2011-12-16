note
	description: "Summary description for {ITEM}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ITEM

	create
		makeItem
	feature {NONE}
		type:STRING
		listeAttribut: ARRAYED_LIST[ATTRIBUT]
	feature {ANY}
		makeItem (ty:STRING)
		do
			type:=ty
			create listeAttribut.make(0)
		end

		ajouterAttribut(attribut:ATTRIBUT)
		do
			listeAttribut.extend(attribut)
		end

end
