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
	attributString: ATTRIBUTSTRING
	attributInteger: ATTRIBUTINTEGER
	listeAttributs : ARRAYED_LIST[STRING]
	--listeObjet : ANY
	--objet : INTEGER_REF
	make
		-- Run application.
	do
		--| Add your code here

	--	create jeu.make
	--	create attributString.makeAttributString("NomAttribut 1")
	--	jeu.ajouterAttribut(attributString)

	--	create attributInteger.makeAttributInteger("NomAttribut 2")
	--	jeu.ajouterAttribut(attribut)
	--	jeu.listeAttributsJeu.at(2).inserervaleur (1)
	--	jeu.listeAttributsJeu.at(1).inserervaleur ("chien")

	--	create listeAttributs.make(0)
	--	listeAttributs.put_front("test1")
	--	listeAttributs.put_front("test2")
	--	create attribut.make("array","ARRAY")
	--	attribut.inserervaleur (listeAttributs)
		--jeu.ajouterAttribut(attribut)

	  --	listeObjet:=jeu.listeAttributsJeu.at(2).value
		--objet ?= listeObjet
	--	objet:= objet+3
	--	print(objet)

	--	print("%N")
	--	print(jeu.listeAttributsJeu.at(2).value)
	--	print("%N")
	--	print(jeu.listeAttributsJeu.at(1).value)
	--	print("%N")

	end

end
