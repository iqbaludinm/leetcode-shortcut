func isPalindrome(x int) bool {
    nts := strconv.Itoa(x)
    start := 0
    end := len(nts) - 1
    
    for start < end {
        if nts[start] != nts[end] {
            return false
        }
        
        start++
        end--
    }
    return true
}