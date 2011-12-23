note
	description: "Summary description for {ACTEUR}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ACTEUR
	inherit OBJET
	create
 		makeActeur

 	feature
 		id:STRING
 		typeActeur:TYPEACTEUR

 	feature {ANY}
		makeActeur (ty:TYPEACTEUR)
		do
			typeacteur:=ty
			makeObjet
		end

		getId:STRING
		do
			result:=id
		end
end
