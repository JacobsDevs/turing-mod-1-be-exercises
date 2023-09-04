numbers = [[1, 2, 3], [4, 5, 6]]

# 1. what is numbers.count: 2
p "Expect 2"
p numbers.count
# 2. what is numbers.first.count
p "Expect 3"
p numbers.first.count
# 3. how can I access the element 5
p numbers.last[1]
# 4. how can I add [7,8,9] to the numbers array
numbers << [7, 8, 9]
p numbers
# 5. What element does numbers[0] return?
p "Expect [1, 2, 3]"
p numbers[0]
