class Queue
	def initialize
		@queue = []
	end

	def enqueue(element)
		@queue.unshift element
	end 

	def dequeue
		@queue.pop
	end

	def empty?
		@queue.empty?
	end

	def to_s 
		@queue.reverse.to_s
	end
end