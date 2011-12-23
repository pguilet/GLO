note
	description: "Summary description for {OBJET}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	OBJET
	create
 		makeObjet

 	feature
 		listeAttributsInteger : ARRAYED_LIST[ATTRIBUTTYPESIMPLE[INTEGER]]
 		listeAttributsString : ARRAYED_LIST[ATTRIBUTTYPESIMPLE[STRING]]
 		listeAttributsArray : ARRAYED_LIST[ATTRIBUTARRAYOFITEM]

	feature {ANY}
		makeObjet
		do
			create listeAttributsInteger.make(0)
			create listeAttributsString.make(0)
			create listeAttributsArray.make(0)
		end

		ajouterAttributArray(attribut : ATTRIBUTARRAYOFITEM)
		do
			listeAttributsArray.extend (attribut)
		end

		getListeAttributsArray:ARRAYED_LIST[ATTRIBUTARRAYOFITEM]
		do
			result:=listeAttributsArray
		end

		getAttributArray(name:STRING):ATTRIBUTARRAYOFITEM
 		do
 			from listeAttributsArray.start
 			until listeAttributsArray.exhausted
 			loop
 				if(listeAttributsArray.item.nomattribut.is_equal (name))then
 					result:=listeAttributsArray.item
 				end
 				listeAttributsArray.forth
 			end
 		end

		ajouterAttributString(attribut : ATTRIBUTTYPESIMPLE[STRING])
 		do
 			listeAttributsString.put_front(attribut)
 		end

 		getListeAttributsSring:ARRAYED_LIST[ATTRIBUTTYPESIMPLE[STRING]]
 		do
 			result:=listeAttributsString
 		end

 		getAttributString(name:STRING):ATTRIBUTTYPESIMPLE[STRING]
 		do
 			from listeAttributsString.start
 			until listeAttributsString.exhausted
 			loop
 				if(listeAttributsString.item.nomattribut.is_equal (name))then
 					result:=listeAttributsString.item
 				end
 			end
 		end

 		setAttributString(name:STRING value:STRING)
 		local
			atStr: ATTRIBUTTYPESIMPLE[STRING]
			attributNonPresent:BOOLEAN
 		do
 			attributNonPresent:=true
 			from listeAttributsString.start
			until listeAttributsString.exhausted
			loop
				if(listeAttributsString.item.nomattribut.is_equal (name))then
					attributNonPresent:=false
				end
				listeAttributsString.forth
			end
			if(attributNonPresent)then
				create atStr.makeAttribut(name)
				atStr.insererValeur(value)
				listeAttributsString.replace(atStr)
			end
 		end

 		ajouterAttributInteger(attribut : ATTRIBUTTYPESIMPLE[INTEGER])
 		do
 			listeAttributsInteger.put_front(attribut)
 		end

 		getListeAttributsInteger:ARRAYED_LIST[ATTRIBUTTYPESIMPLE[INTEGER]]
 		do
 			result:=listeAttributsInteger
 		end

 		getAttributInteger(name:STRING):ATTRIBUTTYPESIMPLE[INTEGER]
 		do
 			from listeAttributsInteger.start
 			until listeAttributsInteger.exhausted
 			loop
 				if(listeAttributsInteger.item.nomattribut.is_equal (name))then
 					result:=listeAttributsInteger.item
 				end
 			end
 		end

 		setAttributInteger(name:STRING value:INTEGER)
 		local
 			atInt: ATTRIBUTTYPESIMPLE[INTEGER]
 			attributNonPresent:BOOLEAN
 		do
 			attributNonPresent:=true
 			from listeAttributsInteger.start
			until listeAttributsInteger.exhausted
			loop
				if( listeAttributsInteger.item.nomattribut.is_equal (name))then
					attributNonPresent:=false
				end
				listeAttributsInteger.forth
			end
			if( attributNonPresent)then
				create atInt.makeAttribut(name)
				atInt.insererValeur(value.to_integer)
				listeAttributsInteger.put_front(atInt)

			end
 		end


end
