note
	description: "Summary description for {ATTRIBUT}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ATTRIBUT
	create
 		makeAtt
	feature
		nomAttribut:STRING

		makeAtt(name : STRING)
		do
			nomAttribut:=name
		end
end
