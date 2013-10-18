module ApplicationHelper
	require 'rexml/document'

	def getAreas()
		file = File.new("app/assets/xml/Properties.xml")
		doc = REXML::Document.new file
		areas = []
		doc.elements.each('//Area/option') do |ele|
			areas << [ele.text, ele.text]  #Now the options are text-value pairs.
		end

		areas
	end
end
