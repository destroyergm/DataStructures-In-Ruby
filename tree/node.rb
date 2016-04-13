module BinarySearchTree
	class Node
		attr_accessor :left, :right, :value

		def initialize(value)
			@left = nil
			@right = nil
			@value = value
		end

		def to_s
			@value.to_s
		end

		def insert(v)
			case v <=> value
				when -1 then insert_left(v)
				when 1 then insert_right(v)
				when 0 then false
			end
		end

		def breadth_first_search(value)
			queue = [] # Unshift to add to queue / pop to remove from queue
			queue.unshift(self)
			until queue.empty?
				node = queue.pop
				queue.unshift node.left unless node.left.nil?
				queue.unshift node.right unless node.right.nil?
				return node if value == node.value
			end
			nil
		end

		def depth_first_search(value)
			#TODO IMPLEMENT
		end

		def dfs_rec(value, node)
			if value == node.value
				puts "Found node!"
				return node
			end
			dfs_rec(value, node.left) if !node.left.nil?
			dfs_rec(value, node.right) if !node.right.nil?
		end

		private
		def insert_left(value)
			if left
				left.insert(value)
			else
				self.left = Node.new value
			end
		end

		def insert_right(value)
			if right
				right.insert(value)
			else
				self.right = Node.new value
			end
		end
	end

	def self.build_tree(array)
		root = Node.new array[0]
		array.each_with_index do |e,i|
			next if i == 0
			root.insert(e)
		end
		root
	end
end


tree = BinarySearchTree::build_tree([8,9,1,0,13,2])
puts tree.dfs_rec(13,tree)