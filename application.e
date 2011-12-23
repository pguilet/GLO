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
	--tableActeur est une hashtable qui a comme clé un string qui représente l'id de l'acteur et comme valeur l'acteur
	--tableItem,tableAction,tableTypeActeur,tableTypeItem marche de la même manière
	tableActeur: HASH_TABLE[ACTEUR,STRING]
	tableItem: HASH_TABLE[ITEM,STRING]
	tableAction: HASH_TABLE[ACTION,STRING]
	listePredicatsVictoire: ARRAYED_LIST[PREDICATVICTOIREDEFAITE]
	listePredicatsDefaite: ARRAYED_LIST[PREDICATVICTOIREDEFAITE]
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
		create jeu.makejeu

		parseFichierRegle ("regle.txt")
		parserFichierEtat("etat.txt")

		print("%N---------------------------------------------------TEST PARSAGE REGLE----------------------------------------------------")
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
		print("%N-------------------------------------------------------------------------------------------------------------------------")
		print("%N---------------------------------------------------TEST PARSAGE ETAT-----------------------------------------------------")

		--boucle pour tester le parsage des acteurs du fichier état
		from tableActeur.start
		until tableActeur.off
		loop
			print("%N Attributs de l'acteur : "+tableActeur.item_for_iteration.getid)
			from tableActeur.item_for_iteration.getlisteattributsinteger.start
			until tableActeur.item_for_iteration.getlisteattributsinteger.exhausted
			loop
				print("%N       ->Nom Attribut : "+tableActeur.item_for_iteration.getlisteattributsinteger.item_for_iteration.nomattribut+" Valeur attribut : "+tableActeur.item_for_iteration.getlisteattributsinteger.item_for_iteration.value.out)
				tableActeur.item_for_iteration.getlisteattributsinteger.forth
			end

			from tableActeur.item_for_iteration.getlisteattributssring.start
			until tableActeur.item_for_iteration.getlisteattributssring.exhausted
			loop
				print("%N       ->Nom Attribut : "+tableActeur.item_for_iteration.getlisteattributssring.item_for_iteration.nomattribut+" Valeur attribut : "+tableActeur.item_for_iteration.getlisteattributssring.item_for_iteration.value.out)
				tableActeur.item_for_iteration.getlisteattributssring.forth
			end

			from tableActeur.item_for_iteration.getlisteattributsarray.start
			until tableActeur.item_for_iteration.getlisteattributsarray.exhausted
			loop
				print("%N       ->Nom de l'array : "+tableActeur.item_for_iteration.getlisteattributsarray.item_for_iteration.nomattribut)

				from tableActeur.item_for_iteration.getlisteattributsarray.item_for_iteration.listeitems.start
				until tableActeur.item_for_iteration.getlisteattributsarray.item_for_iteration.listeitems.exhausted
				loop
						print("%N            ->Nom de l'objet : "+tableActeur.item_for_iteration.getlisteattributsarray.item_for_iteration.listeitems.item_for_iteration.getId)
						tableActeur.item_for_iteration.getlisteattributsarray.item_for_iteration.listeitems.forth
				end

				tableActeur.item_for_iteration.getlisteattributsarray.forth
			end

			tableActeur.forth
		end

		--boucle pour tester le parsage des items du fichier état
		from tableItem.start
		until tableItem.off
		loop
			print("%N Attributs de l'item : "+tableItem.item_for_iteration.getid)
			from tableItem.item_for_iteration.getlisteattributsinteger.start
			until tableItem.item_for_iteration.getlisteattributsinteger.exhausted
			loop
				print("%N       ->Nom Attribut : "+tableItem.item_for_iteration.getlisteattributsinteger.item_for_iteration.nomattribut+" Valeur attribut : "+tableItem.item_for_iteration.getlisteattributsinteger.item_for_iteration.value.out)
				tableItem.item_for_iteration.getlisteattributsinteger.forth
			end

			from tableItem.item_for_iteration.getlisteattributssring.start
			until tableItem.item_for_iteration.getlisteattributssring.exhausted
			loop
				print("%N       ->Nom Attribut : "+tableItem.item_for_iteration.getlisteattributssring.item_for_iteration.nomattribut+" Valeur attribut : "+tableItem.item_for_iteration.getlisteattributssring.item_for_iteration.value.out)
				tableItem.item_for_iteration.getlisteattributssring.forth
			end
			tableItem.forth
		end


		--boucle pour tester le parsage du jeu du fichier état
		print("%N Attributs de jeu : ")
		from jeu.getlisteattributsinteger.start
		until jeu.getlisteattributsinteger.exhausted
		loop
			print("%N       ->Nom Attribut : "+jeu.getlisteattributsinteger.item_for_iteration.nomattribut+" Valeur attribut : "+jeu.getlisteattributsinteger.item_for_iteration.value.out)
			jeu.getlisteattributsinteger.forth
		end

		from jeu.getlisteattributssring.start
		until jeu.getlisteattributssring.exhausted
		loop
			print("%N       ->Nom Attribut : "+jeu.getlisteattributssring.item_for_iteration.nomattribut+" Valeur attribut : "+jeu.getlisteattributssring.item_for_iteration.value.out)
			jeu.getlisteattributssring.forth
		end


		print("%N-------------------------------------------------------------------------------------------------------------------------")
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
			s.replace_substring_all("%T","")
			result:=s

		end

		is_vocabulary (w:STRING):BOOLEAN
		do
			if (w.is_equal ("JEU")) then
				result:=true
			elseif (w.is_equal ("ACTEUR")) then
				result:=true
			elseif (w.is_equal ("ITEM")) then

				result:=true
			else
				result:=false
			end
		end

		parserFichierEtat(file : STRING)
		local
			fini : BOOLEAN

			--gestion des splits et des lignes
			line:STRING
			--variables utilisées pour les split
			tokensSDeuxPoint: LIST[STRING]
			tokensSBarre	: LIST[STRING]
			tokensSEgal		: LIST[STRING]

			--gestion des classes
			attributInt:ATTRIBUTTYPESIMPLE[INTEGER]
			attributStr:ATTRIBUTTYPESIMPLE[STRING]
			attributArr:ATTRIBUTARRAYOFITEM
			acteur:ACTEUR
			item:ITEM
			reader :PLAIN_TEXT_FILE
		do
			print("%N Parsage du fichier état :")
			create reader.make_open_read(file)
			line:=""
			fini:=false
			from reader.start
			until fini
			loop

				if(not is_comment(trim(reader.last_string.split (':').at (1)))) then
					if(is_vocabulary(trim(reader.last_string.split (':').at (1))))then
						--on met à jour l'objet dont on ajoute des instances quand on est rendu à un nouveau(ITEM, ACTEUR, JEU)
						line:=trim(reader.last_string.split (':').at (1))
						reader.read_line
					end
					if(line.is_equal ("JEU"))then

						--manipulation de jeu--
						--pre condition : tous les attributs de jeu doivent être renseignés  dans le fichier état.
						tokensSEgal:=trim(reader.last_string).split ('=')

						if(jeu.attributsregle.has_key (tokensSEgal.at (1)))then

							if(jeu.attributsregle.at (tokensSEgal.at (1)).is_equal ("INTEGER"))then
								jeu.setattributinteger (tokensSEgal.at (1),tokensSEgal.at (2).to_integer)
							elseif(jeu.attributsregle.at (tokensSEgal.at (1)).is_equal ("STRING"))then
								jeu.setattributstring (tokensSEgal.at (1), tokensSEgal.at (2))
							end
							--Si le jeu a des objets c'est dans item que ce sera definie
						end


					elseif(line.is_equal ("ACTEUR"))then

						tokensSDeuxPoint:=trim(reader.last_string).split (':')
						--je regarde si ce type d'acteur est définie dans les règles
						if(tableTypeActeur.has_key(tokensSDeuxPoint.at (1))) then
							tokensSBarre:=tokensSDeuxPoint.at (2).split ('|')

							--creation de l'acteur
							create acteur.makeacteur (tokensSBarre.at (1))

							--on initialise les sacs de type array
							from tableTypeActeur.item(tokensSDeuxPoint.at (1)).attributs.start
							until tableTypeActeur.item(tokensSDeuxPoint.at (1)).attributs.off
							loop

								if tableTypeActeur.at (tokensSDeuxPoint.at (1)).attributs.item_for_iteration.is_equal("ARRAY") then
								--	print("%Ntest"+tableTypeActeur.item(tokensSDeuxPoint.at (1)).typeacteur)
									create attributArr.makeattributarray (tableTypeActeur.at (tokensSDeuxPoint.at (1)).attributs.key_for_iteration)
									acteur.ajouterAttributArray(attributArr)
								end
								tableTypeActeur.item(tokensSDeuxPoint.at (1)).attributs.forth
							end

							from tokensSBarre.start
							until tokensSBarre.exhausted
							loop
								tokensSBarre.forth
								if(not tokensSBarre.exhausted)then
									tokensSEgal:=tokensSBarre.item_for_iteration.split ('=')

									--on vérifié que le nom de l'attribut qu'on veut ajouter existe bien dans la liste d'attribut du type
									if(tableTypeActeur.at(tokensSDeuxPoint.at (1)).attributs.has_key(tokensSEgal.at (1)))then
										--on insère l'attribut en fonction de son type dans la bonne liste

										if(tableTypeActeur.at (tokensSDeuxPoint.at (1)).attributs.at (tokensSEgal.at (1)).is_equal ("INTEGER"))then
											--creation de l'attribut de type simple
											create attributInt.makeattribut (tokensSEgal.at (1))
											attributInt.inserervaleur (tokensSEgal.at (2).to_integer)
											--ajout de l'attribut

											acteur.ajouterattributinteger (attributInt)

										elseif(tableTypeActeur.at (tokensSDeuxPoint.at (1)).attributs.at (tokensSEgal.at (1)).is_equal ("STRING"))then
											--creation de l'attribut de type simple
											create attributStr.makeattribut (tokensSEgal.at (1))
											attributStr.inserervaleur (tokensSEgal.at (2))

											acteur.ajouterattributstring (attributStr)
										end
									end
								end
							end --end loop
							tableActeur.put (acteur, acteur.getid)
						end --end if acteur

					elseif(line.is_equal ("ITEM"))then

						tokensSDeuxPoint:=trim(reader.last_string).split (':')

						--je regarde si ce type d'item est définie dans les règles

						if(tableTypeItem.has_key(tokensSDeuxPoint.at (1))) then
							tokensSBarre:=tokensSDeuxPoint.at (2).split ('|')
							--creation de l'item
							create item.makeitem (tokensSBarre.at (1))

							from tokensSBarre.start
							until tokensSBarre.exhausted
							loop
								tokensSBarre.forth
								if(not tokensSBarre.exhausted)then
									tokensSEgal:=tokensSBarre.item_for_iteration.split ('=')

									--on vérifié que le nom de l'attribut qu'on veut ajouter existe bien dans la liste d'attribut du type
									if(tableTypeItem.at(tokensSDeuxPoint.at (1)).attributs.has_key(tokensSEgal.at (1)))then


										--on insère l'attribut en fonction de son type dans la bonne liste
										if(tableTypeItem.at (tokensSDeuxPoint.at (1)).attributs.at (tokensSEgal.at (1)).is_equal ("INTEGER"))then
											--creation de l'attribut de type simple
											create attributInt.makeattribut (tokensSEgal.at (1))
											attributInt.inserervaleur (tokensSEgal.at (2).to_integer)
											--ajout de l'attribut
											item.ajouterattributinteger (attributInt)

										elseif(tableTypeItem.at (tokensSDeuxPoint.at (1)).attributs.at (tokensSEgal.at (1)).is_equal ("STRING"))then
											--creation de l'attribut de type simple
											create attributStr.makeattribut (tokensSEgal.at (1))
											attributStr.inserervaleur (tokensSEgal.at (2))

											item.ajouterattributstring (attributStr)

										elseif(tableTypeItem.at (tokensSDeuxPoint.at (1)).attributs.at (tokensSEgal.at (1)).is_equal ("ARRAY"))then
											--creation de l'attribut de type array
											create attributArr.makeAttributArray (tokensSEgal.at (1))

											item.ajouterAttributArray(attributArr)
										end
									elseif(tokensSEgal.at (1).is_equal ("possesseur"))then

										acteur:=tableActeur.at (tokensSEgal.at (2))
										tokensSBarre.forth
										tokensSEgal:=tokensSBarre.item.split ('=')
										acteur.getAttributArray(tokensSEgal.at (2)).insererItem(item)
									end
								end
							end --end loop
							tableItem.put (item, item.getid)
						end --end if acteur
					end--elseif item
				end-- comment
				if(reader.off)then
					fini:=true
				else
					reader.read_line
				end

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
			definitionJeuIsValid : BOOLEAN

			--variables utilisées pour les split
			tokensSDeuxPoint: LIST[STRING]
			tokensSBarre	: LIST[STRING]
			tokensSEgal		: LIST[STRING]
			firstSplit		: LIST[STRING]

			nomAttribut		: STRING
			attributInt		:ATTRIBUTTYPESIMPLE[INTEGER]
			attributString	:ATTRIBUTTYPESIMPLE[STRING]
			attributArray	:ATTRIBUTARRAYOFITEM
			typeActeur 		:TYPEACTEUR
			typeItem 		:TYPEITEM
			i				:INTEGER
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
								jeu.setattributinteger ("x", trim(tokensSBarre.at (1)).to_integer)
								jeu.setattributinteger ("y", trim(tokensSBarre.at (2)).to_integer)
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
							typeActeur.addAttribute("x","INTEGER")
							typeActeur.addAttribute("y","INTEGER")
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

		parseFichierCommande ( fileName : STRING )
		local
			reader :PLAIN_TEXT_FILE
			listSplit:LIST[STRING]
		do
			reader.make_open_read(filename)
			from
				reader.start
			until
				reader.off
			loop
				if(not is_comment(reader.last_string) )then
					listSplit:=reader.last_string.split (' ')
					--if(tableAction.has_key (listSplit.at (1))) then

					--end

				end --end if not comment
				reader.read_line
			end
			reader.close
		end

end
