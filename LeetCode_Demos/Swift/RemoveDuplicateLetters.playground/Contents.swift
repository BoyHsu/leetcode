class Solution {
    func removeDuplicateLetters(_ s: String) -> String {
        let chars = s.characters
        var charsArray = [Character]()
        
        for char in chars {
            if charsArray.contains(char) {
                continue
            } else {
                charsArray.append(char)
            }
        }
        charsArray.sort(by: <)
        
        return String.init(charsArray)
    }
}

let sol = Solution()
sol.removeDuplicateLetters("cbacdcbc")