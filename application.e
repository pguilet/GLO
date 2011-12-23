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

feature {ANY} -- Initialization
	jeu: JEU
	--!attention pour les hashtable la clé est à droite
	--listeActeur est une hashtable qui a comme clé un string qui représente le type de l'acteur et comme valeur la liste de tous les acteurs de ce type pour un accès plus rapide au données

	tableActeur: HASH_TABLE[ACTEUR,STRING]
	tableItem: HASH_TABLE[ITEM,STRING]
	tableAction: HASH_TABLE[ACTION,STRING]
	tableVictoire: HASH_TABLE[VICTOIRE,STRING]
	tableDefaite: HASH_TABLE[DEFAITE,STRING]
	tableTypeActeur: HASH_TABLE[TYPEACTEUR,STRING]
	tableTypeItem: HASH_TABLE[TYPEITEM,STRING]


	make
		-- Run application.
	do
		--| Add your code here
		--initialisation des différente listes
		create tableTypeActeur.make (0)
		create tableTypeItem.make (0)
		create tableItem.make (0)
		create tableActeur.make (0)

		parsefichierregle ("regle.txt")

		--boucle pour tester le parsage de jeu du fichier règle
		from jeu.attributsregle.start
		until jeu.attributsregle.off
		loop
			print("%N Attribut Jeu : "+jeu.attributsregle.item_for_iteration)
			jeu.attributsregle.forth
		end

		--boucle pour tester le parsage des acteurs du fichier règle
		from tableTypeActeur.start
		until tableTypeActeur.off
		loop
			print("%N Attribut Acteur : "+tableTypeActeur.item_for_iteration.typeacteur)
			from tableTypeActeur.item_for_iteration.attributs.start
			until tableTypeActeur.item_for_iteration.attributs.off
			loop
				print("%N       ->Nom Attribut : "+tableTypeActeur.item_for_iteration.attributs.key_for_iteration+" Valeur attribut : "+tableTypeActeur.item_for_iteration.attributs.item_for_iteration)
				tableTypeActeur.item_for_iteration.attributs.forth
			end
			tableTypeActeur.forth
		end

		--boucle pour tester le parsage des items du fichier règle
		from tableTypeItem.start
		until tableTypeItem.off
		loop
			print("%N Attribut Item : "+tableTypeItem.item_for_iteration.typeitem)
			from tableTypeItem.item_for_iteration.attributs.start
			until tableTypeItem.item_for_iteration.attributs.off
			loop
				print("%N       ->Nom Attribut : "+tableTypeItem.item_for_iteration.attributs.key_for_iteration+" Valeur attribut : "+tableTypeItem.item_for_iteration.attributs.item_for_iteration)
				tableTypeItem.item_for_iteration.attributs.forth
			end
			tableTypeItem.forth
		end

		--boucle pour voir les types d'acteur qui ont été inséré dans la hashtable listeActeur
		from tableActeur.start
		until tableActeur.off
		loop
			print("%N Type d'acteur : "+tableActeur.key_for_iteration)
			tableActeur.forth
		end

		--boucle pour voir les types d'item qui ont été inséré dans la hashtable listeItem
		from tableItem.start
		until tableItem.off
		loop
			print("%N Type d'item : "+tableItem.key_for_iteration)
			tableItem.forth
		end
	end

	is_comment (w:STRING):BOOLEAN
		do
			if(w.substring (1,2).is_equal ("//"))then
				result:=true
			else
				result:=false
			end

		end

		--méthode qui enlève les blancs potentiels. Ca donne un peu plus de flexibilité aux fichiers textes.
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

		parserFichierEtat(file : STRING)
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
						--jeu.setAttribut(listSplit.at (0),listSplit.at (1))
					elseif(line.is_equal ("ACTEUR:"))then
						listSplit:=reader.last_string.split (':')
						listSplit:=listSplit.at (1).split ('|')
						--regarder dans la liste d'acteur
						--from listeActeur.start
						--until listeActeur.exhausted
						--loop
						--	if(listeActeur.item.getid.is_equal (listSplit.at (0)))then
						--		acteur:=listeActeur.item
						--		from listSplit.start
						--		until listSplit.exhausted
						--		loop
						--			listSplit.forth
									--on split l'élément courant de listSplit avec '=' pour avoir le nom et la valeur de l'attribut
								--	acteur.setAttribut (listSplit.item.split ('=').at (0), listSplit.item.split ('=').at (1))
						--		end
						--	end--if
						-- end
					elseif(line.is_equal ("ITEM:"))then
						listSplit:=reader.last_string.split (':')
						listSplit:=listSplit.at (1).split ('|')
						--regarder dans la liste d'item
					--	from listeItem.start
					--	until listeItem.off
					--	loop
						--	if(listeItem.item.getid.is_equal (listSplit.at (0)))then
						--		item:=listeItem.item
							--	from listSplit.start
							--	until listSplit.exhausted
							--	loop
							--		listSplit.forth
									--on split l'élément courant de listSplit avec '=' pour avoir le nom et la valeur de l'attribut
								--	item.setAttribut (listSplit.item.split ('=').at (0), listSplit.item.split ('=').at (1))
							--	end
						--	end --if
					--	end
					end--elseif
				end-- comment
				reader.read_line
			end --end loop
		end --stateFile

		--pre requis : on part du principe que le fichier de règle déclare JEU, ACTEUR,ITEEM,ACTION,VICTOIRE et DEFAITE dans l'ordre définit dans les fichiers d'exemple.
		parseFichierRegle ( fileName : STRING )
		local
			ficregle		: PLAIN_TEXT_FILE
			ligne			: STRING
			partieJeu		: BOOLEAN
			partieActeur	: BOOLEAN
			partieItem		: BOOLEAN
			partieAction	: BOOLEAN
			partieVictoire	: BOOLEAN
			partieDefaite	: BOOLEAN
			tokensSDeuxPoint: LIST[STRING]
			tokensSBarre	: LIST[STRING]
			tokensSEgal		: LIST[STRING]
			nomAttribut		: STRING
			firstSplit		: LIST[STRING]
			definitionJeuIsValid : BOOLEAN
			attributInt		:ATTRIBUTTYPESIMPLE[INTEGER]
			attributString	:ATTRIBUTTYPESIMPLE[STRING]
			attributArray	:ATTRIBUTARRAYOFITEM
			typeActeur 		:TYPEACTEUR
			typeItem 		:TYPEITEM
			i				:INTEGER
			listeActeurs	:ARRAYED_LIST[ACTEUR]
			listeItems		:ARRAYED_LIST[ITEM]
		do
			partieJeu := false
			partieActeur := false
			partieItem := false
			partieAction := false
			partieVictoire := false
			partieDefaite := false
			definitionJeuIsValid := false

			create ficregle.make_open_read (fileName)

			print("%N Parsage du fichier règle :")

			from  ficregle.start
			until ficregle.off
			loop
				ficregle.read_line
				ligne := ficregle.last_string
				if(not is_comment(trim(ligne))) then
					firstSplit := ligne.split (':')
					if trim(firstSplit.at (1)).is_equal ("JEU") then
						partieJeu := true
						create jeu.makejeu
					elseif trim(firstSplit.at (1)).is_equal ("ACTEUR") then
						partieJeu := false
						partieActeur := true
					elseif trim(firstSplit.at (1)).is_equal ("ITEM") then
						partieActeur := false
						partieItem := true
					elseif trim(firstSplit.at (1)).is_equal ("ACTION") then
						partieActeur := false
						partieItem := false
						partieAction := true
					elseif trim(firstSplit.at (1)).is_equal ("VICTOIRE") then
						partieAction := false
						partieVictoire := true
					elseif trim(firstSplit.at (1)).is_equal ("DEFAITE") then
						partieAction := false
						partieVictoire := false
						partieDefaite := true
					else
						--on ajoute chaque attribut de JEU définit dans règle et on met à jour les coordonnées du plateau
						--si le fichier règle n'a pas de plateau alors on arrête le programme car c'est un pré-requis
						if partieJeu and not is_comment(trim(ligne)) then
							tokensSDeuxPoint := ligne.split (':')
							nomAttribut := trim(tokensSDeuxPoint.at (1))
							--définition des coordonnées x et y quand on a le token plateau
							if nomAttribut.is_equal ("plateau")then
								tokensSBarre:=tokensSDeuxPoint.at (2).split ('|')

								--precondition : les coordonnées en x et y sont des integer >1
								jeu.coordonnees (trim(tokensSBarre.at (1)), trim(tokensSBarre.at (2)))
								definitionJeuIsValid:=true
							else
								tokensSDeuxPoint := ligne.split (':')
								if(tokensSDeuxPoint.at (2).is_equal ("INTEGER") or tokensSDeuxPoint.at (2).is_equal ("STRING") or tokensSDeuxPoint.at (2).is_equal ("ARRAY"))then
									jeu.attributsRegle.put (tokensSDeuxPoint.at (2),tokensSDeuxPoint.at (1))
								end

							end

						elseif partieActeur and not is_comment(trim(ligne)) then
							tokensSDeuxPoint := ligne.split (':')
							--on créé un type acteur en passant le nom du type en paramètre.
							create typeActeur.maketypeacteur (tokensSDeuxPoint.at (1))
							--on initialise la liste d'acteurs qui correspond à la clé qui est le type d'acteur.
							tokensSBarre:=tokensSDeuxPoint.at (2).split ('|')
							--on insère tous les attributs du type acteur
							from i:=1
							until i>tokensSBarre.count
							loop
								tokensSEgal:=tokensSBarre.at (i).split ('=')
								if(tokensSEgal.at (2).is_equal ("INTEGER") or tokensSEgal.at (2).is_equal ("STRING") or tokensSEgal.at (2).is_equal ("ARRAY"))then
									typeActeur.addAttribute(tokensSEgal.at (1),tokensSEgal.at (2))
								end
								i:=i+1
							end
							tableTypeActeur.put (typeActeur, tokensSDeuxPoint.at (1))
						elseif partieItem and not is_comment(trim(ligne))then
							tokensSDeuxPoint := ligne.split (':')
							--on créé un type item en passant le nom du type en paramètre.
							create typeItem.maketypeitem (tokensSDeuxPoint.at (1))
							--on s'assure qu'il y a bien des attribut pour faire le split sur |
							if tokensSDeuxPoint.at (2).count>7 then
								tokensSBarre:=tokensSDeuxPoint.at (2).split ('|')
								--on insère tous les attributs du type item
								from i:=1
								until i>tokensSBarre.count
								loop

									tokensSEgal:=tokensSBarre.at (i).split ('=')
									if(tokensSEgal.at (2).is_equal ("INTEGER") or tokensSEgal.at (2).is_equal ("STRING") or tokensSEgal.at (2).is_equal ("ARRAY"))then
										typeItem.addAttribute(tokensSEgal.at (1),tokensSEgal.at (2))
									end
									i:=i+1
								end

							end
							tableTypeItem.put (typeItem, tokensSDeuxPoint.at (1))
						elseif partieAction and not is_comment(trim(ligne))then







						elseif partieVictoire and not is_comment(trim(ligne)) then
							-- creerVictoire(ligne)
							print("Nouvelle victoire %N")
						elseif partieDefaite and not is_comment(trim(ligne)) then
							-- creerDefaite(ligne)
							print("Nouvelle défaite %N")
						end
					end
				end
			end
			ficregle.close
		end

end
