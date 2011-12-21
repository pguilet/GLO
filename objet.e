note
	description: "Summary description for {OBJET}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	OBJET
	create
 		make

 	feature
 		listeAttributs : ARRAYED_LIST[ATTRIBUT]

	feature {ANY}
		make
		do
			create listeAttributs.make(0)
		end

		ajouterAttribut(attribut : ATTRIBUT)
 		do
 			listeAttributs.put_front(attribut)
 		end

 		getListeAttributs:ARRAYED_LIST[ATTRIBUT]
 		do
 			result:=listeAttributs
 		end

 		setAttribut(name:STRING;value:STRING)
 		local
 			atInt: ATTRIBUTINTEGER
			atStr: ATTRIBUTSTRING
 		do
 			from listeAttributs.start
			until listeAttributs.exhausted
			loop
				if(listeAttributs.item.nomattribut.is_equal (name))then
					if(value.is_integer)then
						atInt.makeAttributInteger(name)
						atInt.insererValeur(value.to_integer)
						listeAttributs.replace(atInt)
					else
						atStr.makeAttributString(name)
						atStr.insererValeur(value)
						listeAttributs.replace(atStr)
					end
				end
				listeAttributs.forth
			end
 		end
end
