//
//  HTTPCookie.swift
//  restclient
//
//  Created by Alexander Ionov on 2/28/24.
//

import Foundation

struct HTTPCookie: TableItem {
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
