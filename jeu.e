note
	description: "Summary description for {JEU}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"
--variables globales accessibles &| modifiables depuis toutes les autres classes
class
	JEU
 	create
 		make

 	feature
 		x:INTEGER
 		y:INTEGER
 		listeAttributsJeu : ARRAYED_LIST[ATTRIBUT]
	feature {ANY}
		make
		do
			create listeAttributsJeu.make(0)
		end

		coordonnees(xi,yi:INTEGER)
		do
			x:=xi
			y:=yi
		end
 		ajouterAttribut(attribut : ATTRIBUT)
 		do
 			listeAttributsJeu.put_front(attribut)
 		end
end
