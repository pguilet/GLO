note
	description: "Summary description for {TYPEITEM}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	TYPEITEM

	create
 		makeTypeItem

 	feature
 		typeItem:STRING
 		--contient les attributs des items de type typeITEM du fichier règle sous la forme clé=nom de l'attribut et valeur=type de l'attribut('STRING','INTEGER' ou 'ARRAY')
 		attributs: HASH_TABLE[STRING,STRING]

 	feature {ANY}
		makeTypeItem (ty:STRING)
		do
			typeItem:=ty
			create attributs.make(0)
		end

		addAttribute(cle:STRING valeur : STRING)
		do
			attributs.put (valeur, cle)
		end

end
