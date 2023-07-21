func twoSum(nums []int, target int) []int {
    var temp []int
    for idxI, i := range nums {
      for idxJ, j := range nums {
          if i + j == target && idxI != idxJ {
              return append(temp, idxI, idxJ)
          }
      }
    }
    return temp
}