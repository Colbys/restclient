//
//  Response.swift
//  restclient
//
//  Created by Alexander Ionov on 2/23/24.
//

import Foundation

struct Response {
    let statusCode: Int
    let mimeType: String
    let body: String
    
    init(statusCode: Int, mimeType: String, body: String) {
        self.statusCode = statusCode
        self.mimeType = mimeType
        self.body = body
    }
}
