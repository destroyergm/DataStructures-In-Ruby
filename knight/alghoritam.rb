class Tile
	attr_accessor :edges, :parent, :position

	def initialize(position,parent=nil,edges=[])
		@edges = edges
		@position = position
		@parent = parent
	end

	def add_edge(edge)
		@edges << edge
	end
end

class Board
	attr_accessor :width, :height

	def initialize(width,height)
		@width = width
		@height = height
	end

	def knights_tour(start_position,end_position)
		start = Tile.new start_position,nil
		target = nil

		visited = [start]
		queue = [start]

		iteration = 0
		until queue.empty?
			system 'clear'
			puts "Iteration: #{iteration}"
			puts "Queue: #{queue.count}"

			node = queue.pop

			if node.position == end_position
				target = node
				break
			end

			moves = posible_moves(node.position)

			moves.each do |move| 
				node.add_edge Tile.new move,node
			end
			node.edges.each do |edge|
				next if visited.include? edge.position
				queue << edge
				visited << node.position
			end

			iteration += 1
		end
		return nil if target.nil?
		# Loop trough untill you get a nil parent
		path = []
		t = target
		until t.nil?
			path << t
			t = t.parent
		end
		path.reverse!
	end


	def posible_moves(position)
		moves = []
		x = position[0]
		y = position[1]
		# Add all the posible moves
		moves << [x-1,y+2]
		moves << [x+1,y+2]
		moves << [x+2,y+1]
		moves << [x+2,y-1]
		moves << [x+1,y-2]
		moves << [x-1,y-2]
		moves << [x-2,y-1]
		moves << [x-2,y+1]
		# Select only the valid moves
		moves.select! { |element| element[0] < width && element[0] >= 0 && element[1] < height  && element[1] >= 0 }

		moves
	end
end


board = Board.new 8,8
puts "Path: "
path = board.knights_tour([0,0],[5,5])
puts "It took #{path.count-1} moves to reach the destination."
path.each { |node| puts "#{node.position} " }