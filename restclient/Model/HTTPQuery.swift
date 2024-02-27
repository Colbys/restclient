//
//  HTTPQuery.swift
//  restclient
//
//  Created by Alexander Ionov on 2/27/24.
//

import Foundation

struct HTTPQuery: TableItem {
    let id = UUID()
    let name: String
    let value: String
    var toggled: Bool
    
    init(name: String, value: String, toggled: Bool) {
        self.name = name
        self.value = value
        self.toggled = toggled
    }
}
