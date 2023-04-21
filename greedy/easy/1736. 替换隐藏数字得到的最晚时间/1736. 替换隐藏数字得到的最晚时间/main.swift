//
//  main.swift
//  1736. 替换隐藏数字得到的最晚时间
//
//  Created by 徐恩 on 2023/3/31.
//

import Foundation

class Solution {
    func maximumTime(_ time: String) -> String {
        var time = Array(time)

        let ch0 = time[0]
        let ch1 = time[1]
        
        if ch0 == "?" && ch1 == "?" {
            time[0] = "2"
            time[1] = "3"
        } else if ch1 == "?" {
            if ch0 == "2" {
                time[1] = "3"
            } else {
                time[1] = "9"
            }
        } else if ch0 == "?" {
            if ch1 <= "3" {
                time[0] = "2"
            } else {
                time[0] = "1"
            }
        }
        
        if time[3] == "?" {
            time[3] = "5"
        }
        
        if time[4] == "?" {
            time[4] = "9"
        }
        
        return String(time)
    }
}

let s = Solution()
assert(s.maximumTime("2?:?0") == "23:50")
assert(s.maximumTime("0?:3?") == "09:39")
assert(s.maximumTime("1?:22") == "19:22")
assert(s.maximumTime("??:??") == "23:59")
assert(s.maximumTime("2?:3?") == "23:39")
assert(s.maximumTime("??:?3") == "23:53")
assert(s.maximumTime("?3:?3") == "23:53")
assert(s.maximumTime("?4:??") == "14:59")
assert(s.maximumTime("1?:??") == "19:59")
assert(s.maximumTime("23:??") == "23:59")
assert(s.maximumTime("??:23") == "23:23")
print("done")
