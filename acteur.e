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

		make
		do
			create listeAttributsJeu.make(0)
		end

 		ajouterAttribut(attribut : ATTRIBUT)
 		do
 			listeAttributsJeu.put_front(attribut)
 		end
end
