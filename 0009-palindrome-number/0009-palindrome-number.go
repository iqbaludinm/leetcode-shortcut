func isPalindrome(x int) bool {
    // kalo mau cek digitNumber menggunakan inputan tipe data number
    // digNum := int(math.Floor(math.Log10(float64(x))) + 1)

    start := x
    reversed := 0

    // kita coba balikkan bilangan dengan loop kondisi x > 0
    for x > 0 {
        lastDig := x % 10 // check last digit of number input
        reversed = (reversed * 10) + lastDig // dikali 10 + lastDig. ini proses pembalikan/reversed
        x = int(math.Floor((float64( x / 10 )))) // gunanya untuk menghapus 1 digit dibelakang
    }

    return start == reversed
}

/*
- this function below is convert integer to string
- in short, first step we convert (I)nteger (to) A(string) using strconv
- init var start = 0 and end = length of string - 1
- do iterate, as long as the condition (start < end) is met then iteration continues tobe done
- on iteration scope, check if first letter isn't the same as the last letter, execute false asap. coz it is certain that it is not palindrome pattern
- if it satisfies, it do increment start + 1 and end - 1 until meet in the middle of the index string
- if all is done, return true

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
*/