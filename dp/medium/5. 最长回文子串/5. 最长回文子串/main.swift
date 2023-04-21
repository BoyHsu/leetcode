//
//  main.swift
//  5. 最长回文子串
//
//  Created by 徐恩 on 2023/3/29.
//

import Foundation

//class Solution {
//
//    typealias Cache = [[(Int, Int)?]]
//    func longestPalindrome(_ s: String) -> String {
//        var arr = Cache(repeating: Array(repeating: nil, count: s.count), count: s.count)
//        let res = _longestPalindrome(s, 0, s.count-1, &arr)
//        let i0 = s.index(s.startIndex, offsetBy: res.0)
//        let i1 = s.index(s.startIndex, offsetBy: res.1)
//        return String(s[i0...i1])
//    }
//    //aacabdkacaa
//    func _longestPalindrome(_ s: String, _ startIdx: Int, _ endIdx: Int, _ cache: inout Cache) -> (Int, Int) {
//        if startIdx == endIdx {
//            return (startIdx, endIdx)
//        }
//        let l = s[s.index(s.startIndex, offsetBy: startIdx)]
//        let r = s[s.index(s.startIndex, offsetBy: endIdx)]
//        if l == r {
//            if endIdx - startIdx == 1 {
//                return (startIdx, endIdx)
//            } else {
//                let newRes: (Int, Int)
//                if let res = cache[startIdx+1][endIdx-1] {
//                    newRes = res
//                } else {
//                    newRes = _longestPalindrome(s, startIdx+1, endIdx-1, &cache)
//                    cache[startIdx+1][endIdx-1] = newRes
//                }
//                if newRes.0 == startIdx+1 && newRes.1 == endIdx-1 {
//                    return (startIdx, endIdx)
//                }
//            }
//        }
//
//        let resL: (Int, Int), resR: (Int, Int)
//
//        if let res = cache[startIdx][endIdx-1] {
//            resL = res
//        } else {
//            resL = _longestPalindrome(s, startIdx, endIdx-1, &cache)
//            cache[startIdx][endIdx-1] = resL
//        }
//        if let res = cache[startIdx+1][endIdx] {
//            resR = res
//        } else {
//            resR = _longestPalindrome(s, startIdx+1, endIdx, &cache)
//            cache[startIdx+1][endIdx] = resR
//        }
//
//
//        if resL.1-resL.0 > resR.1-resR.0 {
//            return resL
//        } else {
//            return resR
//        }
//    }
//
////    func longestPalindrome(_ s: String) -> String {
////        let res = _longestPalindrome(s, 0, s.count-1)
////        let i0 = s.index(s.startIndex, offsetBy: res.0)
////        let i1 = s.index(s.startIndex, offsetBy: res.1)
////        return String(s[i0...i1])
////    }
////
////    func _longestPalindrome(_ s: String, _ startIdx: Int, _ endIdx: Int) -> (Int, Int) {
////        if startIdx == endIdx {
////            return (startIdx, endIdx)
////        }
////        let l = s[s.index(s.startIndex, offsetBy: startIdx)]
////        let r = s[s.index(s.startIndex, offsetBy: endIdx)]
////        if l == r {
////            if endIdx - startIdx == 1 {
////                return (startIdx, endIdx)
////            } else {
////                let newRes = _longestPalindrome(s, startIdx+1, endIdx-1)
////                return (newRes.0 - 1, newRes.1 + 1)
////            }
////        } else {
////            let resL = _longestPalindrome(s, startIdx, endIdx-1)
////            let resR = _longestPalindrome(s, startIdx+1, endIdx)
////            if resL.1-resL.0 > resR.1-resR.0 {
////                return resL
////            } else {
////                return resR
////            }
////        }
////    }
//
//
////    func longestPalindrome(_ s: String) -> String {
////        let m = Array<[Bool?]>(repeating: Array(repeating: nil, count: s.count), count: s.count)
////        var res = ""
////        for i in 0..<s.count {
////            let iIdx = s.index(s.startIndex, offsetBy: i)
////            for j in i+1..<s.count {
////                var isPal = true
////                for k in i...j {
////                    if let match = m[k][i+j-k] {
////                        isPal = match
////                    } else {
////                        let idx1 = s.index(s.startIndex, offsetBy: k)
////                        let idx2 = s.index(s.startIndex, offsetBy: (i+j)-k)
////                        isPal = s[idx1] == s[idx2]
////                    }
////                    if !isPal {
////                        break
////                    }
////                }
////                if isPal, j-i+1 > res.count {
////                    let jIdx = s.index(s.startIndex, offsetBy: j)
////                    res = String(s[iIdx...jIdx])
////                }
////            }
////        }
////        return res
////    }
////    func longestPalindrome(_ s: String) -> String {
////        var res = ""
////        for i in 0..<s.count {
////            let iIdx = s.index(s.startIndex, offsetBy: i)
////            for j in i+1..<s.count {
////                var isPal = true
////                for k in i...j {
////                    let idx1 = s.index(s.startIndex, offsetBy: k)
////                    let idx2 = s.index(s.startIndex, offsetBy: (i+j)-k)
////                    if s[idx1] != s[idx2] {
////                        isPal = false
////                        break
////                    }
////                }
////                if isPal, j-i+1 > res.count {
////                    let jIdx = s.index(s.startIndex, offsetBy: j)
////                    res = String(s[iIdx...jIdx])
////                }
////            }
////        }
////        return res
////    }
//}

class Solution {
    func longestPalindrome(_ s: String) -> String {
        if s.count == 1 {
            return s
        }
        let chs = Array(s)
        var maxL = 0, maxR = 1
        var pals = [Int]()
        if chs[0] == chs[1] {
            pals.append(0)
            maxR = 2
        }
        
        for i in 2..<chs.count {
            let ch = chs[i]
            for j in (0..<pals.count).reversed() {
                let pal = pals[j]
                if pal == 0 || ch != chs[pal - 1] {
                    if i - pal > maxR - maxL {
                        maxL = pal
                        maxR = i
                    }
                    pals.remove(at: j)
                } else {
                    pals[j] = pal-1
                }
            }
            //abaabaaba
            if ch == chs[i-2] {
                pals.append(i-2)
            }
            if ch == chs[i-1] {
                pals.append(i-1)
            }
        }
        
        if !pals.isEmpty {
            let r = chs.count
            var l = r
            for pal in pals {
                if pal < l {
                    l = pal
                }
            }
            if r - l > maxR - maxL {
                maxR = r
                maxL = l
            }
        }
        
        let idxL = s.index(s.startIndex, offsetBy: maxL)
        let idxR = s.index(s.startIndex, offsetBy: maxR-1)
        return String(s[idxL...idxR])
    }
}

let s = Solution()
//var res = s.longestPalindrome("babad")
//assert(res == "bab" || res == "aba")
//assert(s.longestPalindrome("cbbd") == "bb")
//assert(s.longestPalindrome("cbbdbb") == "bbdbb")
assert(s.longestPalindrome("cbbdbbbcbbb") == "bbbcbbb")
assert(s.longestPalindrome("aacabdkacaa") == "aca")
assert(s.longestPalindrome("abaabaaba") == "abaabaaba")
assert(s.longestPalindrome("abaaaaaba") == "abaaaaaba")
assert(s.longestPalindrome("abaabaabaabaabaaba") == "abaabaabaabaabaaba")
assert(s.longestPalindrome("abaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaaba") == "abaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaabaaba")
let str = "ibvjkmpyzsifuxcabqqpahjdeuzaybqsrsmbfplxycsafogotliyvhxjtkrbzqxlyfwujzhkdafhebvsdhkkdbhlhmaoxmbkqiwiusngkbdhlvxdyvnjrzvxmukvdfobzlmvnbnilnsyrgoygfdzjlymhprcpxsnxpcafctikxxybcusgjwmfklkffehbvlhvxfiddznwumxosomfbgxoruoqrhezgsgidgcfzbtdftjxeahriirqgxbhicoxavquhbkaomrroghdnfkknyigsluqebaqrtcwgmlnvmxoagisdmsokeznjsnwpxygjjptvyjjkbmkxvlivinmpnpxgmmorkasebngirckqcawgevljplkkgextudqaodwqmfljljhrujoerycoojwwgtklypicgkyaboqjfivbeqdlonxeidgxsyzugkntoevwfuxovazcyayvwbcqswzhytlmtmrtwpikgacnpkbwgfmpavzyjoxughwhvlsxsgttbcyrlkaarngeoaldsdtjncivhcfsaohmdhgbwkuemcembmlwbwquxfaiukoqvzmgoeppieztdacvwngbkcxknbytvztodbfnjhbtwpjlzuajnlzfmmujhcggpdcwdquutdiubgcvnxvgspmfumeqrofewynizvynavjzkbpkuxxvkjujectdyfwygnfsukvzflcuxxzvxzravzznpxttduajhbsyiywpqunnarabcroljwcbdydagachbobkcvudkoddldaucwruobfylfhyvjuynjrosxczgjwudpxaqwnboxgxybnngxxhibesiaxkicinikzzmonftqkcudlzfzutplbycejmkpxcygsafzkgudy"
let date = Date()
assert(s.longestPalindrome(str) == "fklkf")
print(Date().timeIntervalSince(date))
print("done")
