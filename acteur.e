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

 	feature{ANY}
 		id:STRING

 	feature {ANY}
		makeActeur (idi:STRING)
		do
			makeObjet
			id:=idi
		end

		getId:STRING
		do
			result:=id
		end
end
