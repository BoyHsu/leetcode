//
//  main.swift
//  133. 克隆图
//
//  Created by 徐恩 on 2023/5/14.
//

import Foundation

public class Node {
    public var val: Int
    public var neighbors: [Node?]
    public init(_ val: Int) {
        self.val = val
        self.neighbors = []
    }
}


class Solution {
    
    var nodes = [Node?](repeating: nil, count: 101)
    
    func cloneGraph(_ node: Node?) -> Node? {
        guard let node = node else { return nil }
        if let copyNode = nodes[node.val] {
            return copyNode
        }
        let copyNode = Node(node.val)
        for neighbor in node.neighbors {
            copyNode.neighbors.append(cloneGraph(neighbor))
        }
        nodes[node.val] = copyNode
        return copyNode
    }
}

