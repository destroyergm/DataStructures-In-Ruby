require_relative "queue.rb"

class Vertex
	attr_accessor :edges
	attr_accessor :data
	attr_reader :id

	def initialize(data,id)
		@data = data
		@edges = []
		@id = id
	end

end

# Creates adj. list type graph
class Graph
	def initialize
		@vertices = []
		@vertices_count = 0
	end

	def add_vertex(data)
		@vertices << Vertex.new(data,@vertices_count)
		@vertices_count += 1
		# Returns the ID of the last created vertex
		@vertices_count-1
	end

	def each
		return unless block_given?
		@vertices.each { |element| yield(element) }
	end

	def vertices_count
		@vertices_count
	end

	def find(data)
		@vertices.each_with_index do |v,i|
			if v.data == data
				return i
			end
		end
		nil
	end

	# Can take a single vertex index, or array of vertex indexes as edges
	def add_edge(a,b)
		@vertices[a.id].edges << b
	end

	def [](ind)
		return @vertices[ind]
	end

	def to_s
		out = ""
		out += "Vertices count: #{@vertices_count}\n"
		out += "Connections:\n"
		@vertices.each_with_index do |vertex,index|
			out += "#{vertex.data} (id:#{index}): "
			out += vertex.edges.join("->")
			out += "\n"
		end

		out
	end
end

class Board
	attr_reader :size
	attr_accessor :board

	def initialize(size)
		@board = Array.new(size) { Array.new(size) }
		@size = size
		size.times do |i|
			size.times do |j|
				@board[i][j] = 0;
			end
		end
	end

	def knights_tour(start_pos,end_pos)
		# Generates a graph from the start position to the end position
		graph = generate_graph
		queue = Queue.new
		# Use BFS to find the shortest path
		# Graph.find returns an index of the node, it will return nil if not found
		start_node = graph[graph.find(start_pos)]
		# Info for calculating distance and predesesor
		info = []
		graph.each do |vertex| 
			info << {
				:distance => nil,
				:predesesor => nil
			}
		end

		info[start_node.id][:distance] = 0

		board[start_pos[0]][start_pos[1]] = 'S'
		board[end_pos[0]][end_pos[1]] = 'E'

		queue.enqueue(start_node)

		goal = nil # goal variable
		until queue.empty?
			vertex = queue.dequeue

			vertex.edges.each do |edge_id|
				next unless info[edge_id][:distance].nil?
				info[edge_id][:distance] = info[vertex.id][:distance] + 1
				info[edge_id][:predesesor] = vertex

				# Found the node
				if graph[edge_id].data == end_pos
					goal = graph[edge_id]
					break
				end
				queue.enqueue graph[edge_id]
			end
		end

		if goal.nil?
			p "I did not find any routes to goal"
			exit
		end

		out = []
		number_of_moves = 0
		until goal.nil? 
			out << goal.data
			goal = info[goal.id][:predesesor]
			number_of_moves += 1
		end

		puts "Took you #{number_of_moves-1} moves from #{start_pos} to #{end_pos}"
		out.reverse.each do |row|
			p row
		end
		
	end

	def to_s
		out = ""
		@board.each do |row|
			out += "\t\t\t" + row.join(" ")
			out += "\n"
		end		
		out
	end

	private
	def generate_graph
		g = Graph.new

		# Add vertices
		for i in 0..@board.count-1
			for j in 0..@board[0].count-1
				g.add_vertex [i,j]
			end
		end

		# Add edges
		g.each do |vertex|
			moves = get_posible_moves vertex.data
			moves.each do |move|
				edge_index = g.find move
				g.add_edge(vertex, edge_index)
			end
		end

		return g
	end

	def get_posible_moves(position)
		moves = []
		i = position[0]
		j = position[1]

		moves << [i-2,j-1]; moves << [i-2,j+1]; 
		moves << [i-1,j+2]; moves << [i+1,j+2];
		moves << [i+2,j-1]; moves << [i+2,j+1]; 
		moves << [i-1,j-2]; moves << [i+1,j-2];

		moves.select {|e| e[0] >= 0 && e[1] >= 0 && e[0] < @size && e[1] < @size}
	end
end

b = Board.new 8
b.knights_tour([0,4],[6,5])