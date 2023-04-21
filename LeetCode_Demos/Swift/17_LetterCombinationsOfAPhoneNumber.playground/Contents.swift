class Solution {
    func letterCombinations(_ digits: String) -> [String] {
        var result = [String]()
        
        let charDigits = digits.characters
        
        for char in charDigits {
            arraysCombination(&result, lettersForDigit(char))
        }
        return result
    }
    
    func arraysCombination(_ currentComb: inout [String], _ newArray: [Character]) {
        var newCombs = [String]()
        
        if currentComb.count == 0 {
            for char in newArray {
                newCombs.append(String.init(char))
            }
        } else {
            for char in newArray {
                for comb in currentComb {
                    var newComb = comb
                    newComb.append(char)
                    newCombs.append(newComb)
                }
            }
        }
        
        currentComb = newCombs
    }
    
    func lettersForDigit(_ digit: Character) -> [Character] {
        switch digit {
        case "0" :
            return [" "]
        case "2":
            return [Character("a"), Character("b"), Character("c")]
        case "3":
            return [Character("d"), Character("e"), Character("f")]
        case "4":
            return [Character("g"), Character("h"), Character("i")]
        case "5":
            return [Character("j"), Character("k"), Character("l")]
        case "6":
            return [Character("m"), Character("n"), Character("o")]
        case "7":
            return [Character("p"), Character("q"), Character("r"), Character("s")]
        case "8":
            return [Character("t"), Character("u"), Character("v")]
        case "9":
            return [Character("w"), Character("x"), Character("y"), Character("z")]
        default:
            return []
        }
    }
    
}

let sol = Solution()
		sol.letterCombinations("23")