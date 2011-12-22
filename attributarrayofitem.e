note
	description: "Summary description for {ATTRIBUTARRAYOFITEM}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ATTRIBUTARRAYOFITEM

	inherit ATTRIBUT
	create
		makeAttributArray
	feature
		listeItems:ARRAYED_LIST[ITEM]

		makeAttributArray
		do
			create listeItems.make(0)
		end

		insererItem(item:ITEM)
		do
			listeItems.put_front(item)
		end

end
