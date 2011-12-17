note
	description: "Summary description for {READFILE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	READFILE

	create
		read
	feature {NONE}
		reader :PLAIN_TEXT_FILE

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

	feature {ANY}
		read (file :STRING)
		do
			create reader.make_open_read(file)
		end

		initialize(jeu :JEU;listeActeur: ARRAYED_LIST[ACTEUR];listeItem: ARRAYED_LIST[ITEM];listeAction: ARRAYED_LIST[ACTION];listeVictoire: ARRAYED_LIST[VICTOIRE];listeDefaite: ARRAYED_LIST[DEFAITE])
			local
				line :STRING --va sauvegarder la valeur des chaînes comme JEU ou ACTEUR
				listString : LIST[STRING_8] --va permettre les splits et la récupération des données
				listString2 : LIST[STRING_8] --quand besoin de re-split sans perdre les autres données
				acteur: ACTEUR
				item: ITEM
				action: ACTION
				victoire: VICTOIRE
				defaite: DEFAITE
			do

				line:=reader.last_string

				from
					reader.start
				until
					reader.off
				loop

					if(line.is_equal ("JEU:")) then
						reader.read_line
						if(is_vocabulary(reader.last_string)) then
							line:=reader.last_string
						else
							listString:=reader.last_string.split (':')

							if(listString.at (0).is_equal("plateau")) then
								listString:=listString.at (1).split ('|')
								create jeu.coordonnees(listString.at (0).to_integer,listString.at (1).to_integer)
							else
								if(listString.at (1).is_equal("INTEGER")) then
								--creation d'un ATTRIBUTINTEGER
								else
								--creation d'un ATTRIBUTSTRING
								end
							end
							reader.read_line --on avance que si la ligne n'est pas un mot clé pour pouvoir comparer
						end
					elseif(line.is_equal ("ACTEUR:")) then
						reader.read_line
						if(is_vocabulary(reader.last_string)) then
							line:=reader.last_string
						else
							listString:=reader.last_string.split (':')
							create acteur.make (listString.at (0))
							listeActeur.put_front(acteur)
							listString:=listString.at (1).split ('|')
							from
								listString.start
							until
								listString.exhausted
							loop
								listString2:=listString.item.split ('=')
								if(listString2.at (1).is_equal ("INTEGER"))then
									--creation d'attributinteger
								else
									--creation d'attributstring
								end
								--ajout de l'attribut avec pour nom listString2.at(0)
							end
						end
					elseif(line.is_equal ("ITEM:")) then
						reader.read_line
						if(is_vocabulary(reader.last_string)) then
							line:=reader.last_string
						else
							listString:=reader.last_string.split (':')
							create item.makeItem(listString.at (0))
							listeItem.extend(item)
							listString:=listString.at (1).split ('|')
							from
								listString.start
							until
								listString.exhausted
							loop
								listString2:=listString.item.split ('=')
								if(listString2.at (1).is_equal ("INTEGER"))then
									--creation d'attributinteger
								else
									--creation d'attributstring
								end
								--ajout de l'attribut avec pour nom listString2.at(0)
							end
						end
					elseif(line.is_equal ("ACTION:")) then
						reader.read_line
						if(is_vocabulary(reader.last_string)) then
							line:=reader.last_string
						else
						end
					elseif(line.is_equal ("VITOIRE:")) then
						reader.read_line
						if(is_vocabulary(reader.last_string)) then
							line:=reader.last_string
						else
						end
					elseif(line.is_equal ("DEFAITE:")) then
						reader.read_line
						if(is_vocabulary(reader.last_string)) then
							line:=reader.last_string
						else
						end
					end
					print("%N")
				end

				--on regarde ce qu'il y a dans la liste de string
				from
					listString.start
				until
					listString.exhausted
				loop
					print(listString.item)
					print("%N")
					listString.forth
				end
			end

end
