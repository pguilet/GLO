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

	feature {ANY}
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

		read (file :STRING)
			local
				line :STRING --va sauvegarder la valeur des chaînes comme JEU ou ACTEUR
				listString : LIST[STRING_8] --va permettre les splits et la récupération des données
				jeu :JEU
				--listes d'acteurs, d'items, d'actions, de victoire et de défaite.
				listeActeur: ARRAYED_LIST[ACTEUR]
				listeItem: ARRAYED_LIST[ITEM]
				listeAction: ARRAYED_LIST[ACTION]
				listeVictoire: ARRAYED_LIST[VICTOIRE]
				listeDefaite: ARRAYED_LIST[DEFAITE]
			do
				create reader.make_open_read(file)
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
								create jeu.make(listString.at (0).to_integer,listString.at (0).to_integer)
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
						end
					elseif(line.is_equal ("ITEM:")) then
						reader.read_line
						if(is_vocabulary(reader.last_string)) then
							line:=reader.last_string
						else
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
