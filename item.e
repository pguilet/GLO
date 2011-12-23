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
		type:TYPEITEM

	feature {ANY}
		makeItem (ty:TYPEITEM)
		do
			type:=ty
			makeObjet
		end

		getId:STRING
		do
			result:=id
		end

		getType:TYPEITEM
		do
			result:=type
		end
end
