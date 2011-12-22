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

	feature {ANY}
		makeJeu
		do
			create listeAttributs.make(0)
		end

		coordonnees(xi,yi:INTEGER)
		do
			x:=xi
			y:=yi
		end
end
