note
	description: "Summary description for {ACTION}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ACTION

	create
		makeAction

	feature {NONE}
		nom:STRING
		typeSource:STRING
		listParametres:LIST[STRING]
		predicat:STRING
		action:STRING

	feature{ANY}
		makeAction(n:STRING)
		do
			nom:=n
		end

		--mutateur
		setTypeSource(src:STRING)
		do
			typeSource:=src
		end

		setPredicat(w:STRING)
		do
			predicat:=w
		end

		setAction(w:STRING)
		do
			action:=w
		end

		ajouterParametre(w:STRING)
		do
			listParametres.extend(w)
		end

		setParametre(i:INTEGER;w:STRING)
		do
			listParametres.put_i_th(w,i)
		end

		setListParemetres(lst:LIST[STRING])
		do
			listParametres:=lst
		end

		--accesseur
		getTypeSource:STRING
		do
			result:=typeSource
		end

		getAction:STRING
		do
			result:=action
		end

		getPredicat:STRING
		do
			result:=predicat
		end

		getListParametres:LIST[STRING]
		do
			result:=listParametres
		end

		getParametre(i:INTEGER):STRING
		do
			result:=listParametres.at(i)
		end

end
