module KnightTour
	class Point
		attr_accessor :x, :y

		def initialize(x=0,y=0)
			@x = x
			@y = y
		end
	end

	class Board
		attr_accessor :grid

		def initialize
			@grid = []
			8.times do
				row = []
				8.times do
					row << 0
				end
				@grid << row
			end
		end	

		def to_s
			out = ""
			@grid.each do |row|
				row.each do |e|
					out += " #{e}"
				end
				out += "\n"
			end
			out
		end
	end

	
end


### Program Entry point
board = KnightTour::Board.new
puts board