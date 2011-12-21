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
		type:STRING

	feature {ANY}
		makeItem (ty:STRING)
		do
			type:=ty
		end

end
