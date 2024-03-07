//
//  HTTPMethod.swift
//  restclient
//
//  Created by Alexander Ionov on 2/26/24.
//

import Foundation

enum HTTPMethod: String, CaseIterable, Identifiable {
    case GET, POST, PUT, PATCH, DELETE, OPTION
    
    var id: Self { self }
}
