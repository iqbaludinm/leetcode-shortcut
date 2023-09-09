func isValid(s string) bool {
    // menggunakan stack / tumpukan yg menganut First In Last Out
	stack := []rune{}

	// mapping tutup bracket : bracket buka
	bracketMap := map[rune]rune{
		')': '(',
		']': '[',
		'}': '{',
	}

	for _, char := range s {
		if char == '(' || char == '[' || char == '{' { 
			// kalo misalnya ada ketiga char ini, maka masukkan ke stack 
			stack = append(stack, char)
		} else if len(stack) == 0 || stack[len(stack) - 1] != bracketMap[char] { 
			// kalo kiranya udh gada lagi. maka periksa kedua diliatin panjang dari stacknya berapa? kalo 0 berarti kan ga valid alias mungkin stringnya isinya tutup bracket semua. atau. periksa element tumpukan paling atas, apakah tidak sama dengan nilai dari bracketMap
			// katakan input: ([]) -> maka waktu element ke 3 which is adalah ]. diperiksa tuh, kan tumpukan paling atas adalah [. nah ini [ apakah tidak sama dengan bracketMap[]] maka nilainya false. jadi deh masuk kondisi selanjutnya yang dimana tumpukan paling atas di-pop atau dibuang.
			// katakan input: ([]}) -> maka waktu element ke 4 which is adalah }. diperiksa tuh, kan tumpukan terakhir atau paling atas adalah [. nah apakah [ != bracketMap[}] alias { maka nilainya true. jadi deh return false
			return false
		} else {
			stack = stack[:len(stack)-1]
		}
	}

	return len(stack) == 0
}