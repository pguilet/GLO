note
	description : "ProjetGLO application root class"
	date        : "$Date$"
	revision    : "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS

create
	make

feature {NONE} -- Initialization
	jeu: JEU
	listeActeur: ARRAYED_LIST[ACTEUR]
	listeItem: ARRAYED_LIST[ITEM]
	listeAction: ARRAYED_LIST[ACTION]
	listeVictoire: ARRAYED_LIST[VICTOIRE]
	listeDefaite: ARRAYED_LIST[DEFAITE]
	listeTypeActeur: ARRAYED_LIST[TYPEACTEUR]
	listeTypeItem: ARRAYED_LIST[TYPEITEM]


	make
		-- Run application.
	do
		--| Add your code here


		create read.make
		read.parsefichierregle ("regle.txt")
	end

	is_comment (w:STRING):BOOLEAN
		do
			if(w.substring (1,2).is_equal ("//"))then
				result:=true
			else
				result:=false
			end

		end

		trim (s:STRING):STRING
		do
			s.replace_substring_all(" ","")
			result:=s

		end

		is_vocabulary (w:STRING):BOOLEAN
		do
			if (w.is_equal ("JEU:")) then
				result:=true
			elseif (w.is_equal ("ACTEUR:")) then
				result:=true
			elseif (w.is_equal ("ITEM:")) then
				result:=true
			elseif (w.is_equal ("ACTION:")) then
				result:=true
			elseif (w.is_equal ("VITOIRE:")) then
				result:=true
			elseif (w.is_equal ("DEFAITE:")) then
				result:=true
			else
				result:=false
			end
		end

		parserFichierEtat
		local
			line:STRING
			listSplit:LIST[STRING_8]
			acteur:ACTEUR
			item:ITEM
			reader :PLAIN_TEXT_FILE
		do
			create reader.make_open_read(file)
			line:=""
			from reader.start
			until reader.off
			loop
				if(not is_comment(reader.last_string)) then
					if(is_vocabulary(reader.last_string))then
						line:=reader.last_string
					end

					if(line.is_equal ("JEU:"))then
						--manipulation de jeu--
						listSplit:=reader.last_string.split ('=')
						jeu.setAttribut(listSplit.at (0),listSplit.at (1))
					elseif(line.is_equal ("ACTEUR:"))then
						listSplit:=reader.last_string.split (':')
						listSplit:=listSplit.at (1).split ('|')
						--regarder dans la liste d'acteur
						from listeActeur.start
						until listeActeur.exhausted
						loop
							if(listeActeur.item.getid.is_equal (listSplit.at (0)))then
								acteur:=listeActeur.item
								from listSplit.start
								until listSplit.exhausted
								loop
									listSplit.forth
									--on split l'élément courant de listSplit avec '=' pour avoir le nom et la valeur de l'attribut
									acteur.setAttribut (listSplit.item.split ('=').at (0), listSplit.item.split ('=').at (1))
								end
							end--if
						end
					elseif(line.is_equal ("ITEM:"))then
						listSplit:=reader.last_string.split (':')
						listSplit:=listSplit.at (1).split ('|')
						--regarder dans la liste d'item
						from listeItem.start
						until listeItem.exhausted
						loop
							if(listeItem.item.getid.is_equal (listSplit.at (0)))then
								item:=listeItem.item
								from listSplit.start
								until listSplit.exhausted
								loop
									listSplit.forth
									--on split l'élément courant de listSplit avec '=' pour avoir le nom et la valeur de l'attribut
									item.setAttribut (listSplit.item.split ('=').at (0), listSplit.item.split ('=').at (1))
								end
							end --if
						end
					end--elseif
				end-- comment
				reader.read_line
			end --end loop
		end --stateFile

		parseFichierRegle ( fileName : STRING )
		local
			ficregle		: PLAIN_TEXT_FILE
			ligne			: STRING
			partieJeu		: BOOLEAN
			partieActeur	: BOOLEAN
			partieVictoire	: BOOLEAN
			partieDefaite	: BOOLEAN

			firstSplit			: LIST[STRING]
		do
			partieJeu := false
			partieActeur := false
			partieActeur := false
			partieVictoire := false
			partieDefaite := false

			create ficregle.make_open_read (fileName)

			print("On commence%N")

			from  ficregle.start
			until ficregle.off
			loop
				ficregle.read_line
				ligne := ficregle.last_string
				if(not is_comment(ligne)) then
					firstSplit := ligne.split (':')
					if trim(firstSplit.at (1)).is_equal ("JEU") then
						partieJeu := true
					elseif trim(firstSplit.at (1)).is_equal ("ACTEUR") then
						partieJeu := false
						partieActeur := true
					elseif trim(firstSplit.at (1)).is_equal ("ITEM") then
					elseif trim(firstSplit.at (1)).is_equal ("ACTION") then
						partieActeur := false
						partieActeur := true
					elseif trim(firstSplit.at (1)).is_equal ("VICTOIRE") then
						partieActeur := false
						partieVictoire := true
					elseif trim(firstSplit.at (1)).is_equal ("DEFAITE") then
						partieVictoire := false
						partieDefaite := true
					end
					if partieJeu then
							-- print("%Nouveau jeu : " + nouveauJeu(ligne) + "%N")
						elseif partieActeur then
							print("%Nouveau modele  : " + creerObjet(ligne) + "%N")
						elseif partieActeur then
							-- print("Nouvelle action : " + creerAction(ligne) + "%N")
						elseif partieVictoire then
							-- creerVictoire(ligne)
							print("Nouvelle victoire %N")
						elseif partieDefaite then
							-- creerDefaite(ligne)
							print("Nouvelle défaite %N")
						end
				end
			end
			ficregle.close
		end

	creerObjet ( ligne : STRING ) : STRING
	 	local
			classDef			: LIST[STRING]
			attrDef				: LIST[STRING]
			className			: STRING
			splitAttr			: LIST[STRING]
		do
			classDef := ligne.split (':')
			className := trim(classDef.at (1))
			attrDef := classDef.at (2).split ('|')
			--create objet.make
			from  attrDef.start
			until attrDef.off
			loop
				if(not trim(attrDef.item).is_empty) then
					splitAttr := attrDef.item.split ('=')
					--objet.ajouterAttribut ((create {ATTRIBUT}.make(trim(splitAttr.at (1)), trim(splitAttr.at (2)))))
				end
				attrDef.forth
			end
			Result := className
		end

end
