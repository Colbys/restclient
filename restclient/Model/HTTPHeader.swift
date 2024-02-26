//
//  HTTPHeader.swift
//  restclient
//
//  Created by Alexander Ionov on 2/26/24.
//

import Foundation

struct HTTPHeader: Identifiable {
    let id = UUID()
    let name: String
    let value: String
    var enabled: Bool
    
    init(name: String, value: String, enabled: Bool) {
        self.name = name
        self.value = value
        self.enabled = enabled
    }
}
