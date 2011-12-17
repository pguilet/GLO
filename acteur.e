note
	description: "Summary description for {ACTEUR}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ACTEUR

	create
 		make

 	feature
 		id:STRING
 		typeActeur:STRING
 		listeAttributsJeu : ARRAYED_LIST[ATTRIBUT]

		make (ty:STRING)
		do
			typeacteur:=ty
			create listeAttributsJeu.make(0)
		end

 		ajouterAttribut(attribut : ATTRIBUT)
 		do
 			listeAttributsJeu.put_front(attribut)
 		end
end
