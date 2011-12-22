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

		is_comment (w:STRING):BOOLEAN
		do
			if(w.substring (1,2).is_equal ("//"))then
				result:=true
			else
				result:=false
			end

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

	feature {ANY}
		read (file :STRING)
		do
			create reader.make_open_read(file)
		end

		stateFile(jeu :JEU;listeActeur: ARRAYED_LIST[ACTEUR];listeItem: ARRAYED_LIST[ITEM])
		local
			line:STRING
			listSplit:LIST[STRING_8]
			acteur:ACTEUR
			item:ITEM
		do
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
end
