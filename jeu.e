note
	description: "Summary description for {JEU}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"
--variables globales accessibles &| modifiables depuis toutes les autres classes
class
	JEU
	inherit OBJET
 	create
 		makeJeu

 	feature
 		--attention la cle est en deuxi�me position et la valeure en premi�re.
 		attributsRegle: HASH_TABLE[STRING,STRING]

	feature {ANY}
		makeJeu
		do
			makeObjet
			create attributsRegle.make(0)
		end

end
