func twoSum(nums []int, target int) []int {
    temp := make(map[int]int)
	for i := 0; i < len(nums); i++ {
		complement := target - nums[i]
		if value, exist := temp[complement]; exist {
			return []int{value, i}
		}
		temp[nums[i]] = i
	}
	return []int{}
}