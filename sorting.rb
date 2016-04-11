def merge_sort(arr,stacks=0)
	n = arr.count

	return arr if n == 1

	left = arr[0...n/2]
	right = arr[n/2...n]

	left = merge_sort left
	right = merge_sort right

	p "Merging: #{left} and #{right}"
	rez = merge(left,right)
	p "Merge result: #{rez}"
	puts ".............................."
	return rez
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

arr = [5,4,3,2,1,5,10,-2,42,2,12,45,312,34,51,-3,50]
p "Array to be sorted: #{arr}"
p merge_sort(arr)