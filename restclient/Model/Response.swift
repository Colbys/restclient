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
    var body: String
    
    init(statusCode: Int, mimeType: String, body: String) {
        self.statusCode = statusCode
        self.mimeType = mimeType
        self.body = body
    }
}
