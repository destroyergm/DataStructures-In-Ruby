module BinarySearchTree
	class Node
		attr_accessor :left, :right, :parent, :value

		def initialize(value)
			@parent = nil
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


tree = BinarySearchTree::build_tree([8,9,1,0,13,-5])
puts root.inspect