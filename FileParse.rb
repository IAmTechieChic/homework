module FileType
	def getJSON(file)
		return JSON.pretty_generate(file)
	end
end

module FileFormat
	def defaultExpression(line)
		return  /^(\$?[0-9]*.[0-9]*)\s*(\w.*)\s([0-9]{2}\/[0-9]{2}.*[0-9]{2}\/[0-9]{2})\s([0-9]*.[0-9]*)/.match(line)	
	end
end

class Parse
	include FileFormat
	
	attr_reader :file, :files, :fileHash

	def initialize(filePath)
		@filePath = filePath
		@file = File.new(filePath,"r")
		@files = []
		@fileHash = {}
	end

	def parse
		file.each_line do |f|
			string = defaultExpression(f)
			fileHash[:features] = string[2]
			fileHash[:date_range] = string[3]
			fileHash[:price] = string[4]

			files << fileHash
		end
	end
end

require "json"
include FileType


file = Parse.new("input.txt")
file.parse
puts getJSON(file.files)


