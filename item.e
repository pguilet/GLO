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
		type:STRING

	feature {ANY}
		makeItem (ty:STRING)
		do
			type:=ty
		end

		getId:STRING
		do
			result:=id
		end
		
		getType:STRING
		do
			result:=type
		end
end
