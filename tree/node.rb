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
end


root = BinarySearchTree::Node.new(5)
root.insert(3)
root.insert(6)

puts root.inspect