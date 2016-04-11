def merge_sort(arr)
	n = arr.count

	return arr if n == 1

	left = arr[0...n/2]
	right = arr[n/2...n]

	left = merge_sort left
	right = merge_sort right

	# Uncomment to see merge info
	# p "Merging: #{left} and #{right}"
	merge(left,right)
	# p "Merge result: #{rez}"
	# puts ".............................."
	# return rez
end

def merge(a,b)
	c = []
	while !a.empty? && !b.empty?
		if a[0] < b[0]
			c << a[0]
			a.delete_at(0)
		else
			c << b[0]
			b.delete_at(0)
		end
	end
	until a.empty?
		c << a[0]
		a.delete_at(0)
	end
	until b.empty?
		c << b[0]
		b.delete_at(0)
	end

	c
end

def buble_sort(arr) 
	unordered = true
	while unordered
		unordered = false
		for i in (1..arr.size-1)
			if(arr[i-1] > arr[i])
				arr[i-1], arr[i] = arr[i], arr[i-1] 
				unordered = true;
			end
		end
	end
	arr
end

def time_block(&block)
	start_time = Time.now
	block.call
	end_time = Time.now
	puts "Time elapsed #{(end_time - start_time)}"
end

def get_random_array(n)
	arr = []
	n.times { arr << rand(100) }
	arr
end

arr = [85,-4,1,2,55,23,0]
p "#{arr} before sort"
p buble_sort(arr) 
p "#{arr} after sort"