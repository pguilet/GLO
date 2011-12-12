note
	description: "Summary description for {ACTEUR}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ACTEUR

	create make

	feature

		listeAttributsActeur : ARRAYED_LIST[TYPEACTEUR]

		make
		do
			create listeAttributsActeur.make(0)
		end

		ajouterAttribut(attribut : ATTRIBUT)
 		do
 			listeAttributsActeur.put_front(attribut)
 		end

end
