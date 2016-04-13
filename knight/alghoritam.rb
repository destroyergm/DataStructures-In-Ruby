module KnightTour
	class Point
		attr_accessor :x, :y

		def initialize(x=0,y=0)
			@x = x
			@y = y
		end

		def to_s
			"Point: (#{x},#{y})"
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
				out += "\t\t\t"
				row.each_with_index do |e,i|
					out += "#{e}"
					out += "|" unless i == row.count - 1
				end
				out += "\n"
			end
			out
		end
	end

	
end


def check_input(line)
	unless line =~ /^\d,\d$/ 
		puts "Wrong input."
		exit
	end
end

### Program Entry point
print "Enter knight position(format i,j): "
line = gets.chomp
check_input(line)
numbers = line.split(',')
p1 = KnightTour::Point.new numbers[0].to_i, numbers[1].to_i
puts p1.inspect

print "Enter goal position(format i,j): "
line = gets.chomp
check_input(line)
numbers = line.split(',')
p2 = KnightTour::Point.new numbers[0].to_i, numbers[1].to_i
puts p2.inspect


board = KnightTour::Board.new


