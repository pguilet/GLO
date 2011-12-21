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
 		typeActeur:STRING

 	feature {ANY}
		makeActeur (ty:STRING)
		do
			typeacteur:=ty
		end

		getId:STRING
		do
			result:=id
		end
end
