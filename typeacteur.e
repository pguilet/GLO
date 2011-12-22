note
	description: "Summary description for {TYPEACTEUR}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	TYPEACTEUR
	create
 		makeTypeActeur

 	feature
 		typeActeur:STRING
 		--contient les attributs des acteurs de type typeACTEUR du fichier règle sous la forme clé=nom de l'attribut et valeur=type de l'attribut('STRING','INTEGER' ou 'ARRAY')
 		attributs: HASH_TABLE[STRING,STRING]

 	feature {ANY}
		makeTypeActeur (ty:STRING)
		do
			typeacteur:=ty
			create attributs.make(0)
		end

		getId:STRING
		do
			result:=id
		end
end
