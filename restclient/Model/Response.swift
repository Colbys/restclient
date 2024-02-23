//
//  Response.swift
//  restclient
//
//  Created by Alexander Ionov on 2/23/24.
//

import Foundation

struct Response {
    var statusCode: Int
    var mimeType: String
    
    init(statusCode: Int, mimeType: String) {
        self.statusCode = statusCode
        self.mimeType = mimeType
    }
}
