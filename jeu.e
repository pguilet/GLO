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
 		x:INTEGER
 		y:INTEGER
 		--attention la cle est en deuxième position et la valeure en première.
 		attributsRegle: HASH_TABLE[STRING,STRING]

	feature {ANY}
		makeJeu
		do
			makeObjet
			create attributsRegle.make(0)
		end

		coordonnees(xi,yi:STRING)
		do
			x:=xi.to_integer
			y:=yi.to_integer_32
		end
end
