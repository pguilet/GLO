note
	description: "Summary description for {ITEM}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ITEM
	inherit OBJET
	create
		makeItem
	feature {NONE}
		id:STRING

	feature {ANY}
		makeItem (idi:STRING)
		do
			makeObjet
			id:=idi
		end

		getId:STRING
		do
			result:=id
		end
end
