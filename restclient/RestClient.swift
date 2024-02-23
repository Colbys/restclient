//
//  RestClient.swift
//  restclient
//
//  Created by Alexander Ionov on 2/23/24.
//

import Foundation

func sendRequest(urlRaw: String) {
    guard let url = URL(string: urlRaw) else {
        // TODO: display message in UI if URL is invalid
        fatalError("Invalid URL")
    }

    var urlRequest = URLRequest(url: url)
    urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
    urlRequest.httpMethod = "GET"
    
    let dataTask = URLSession.shared.dataTask(with: urlRequest) { (responseBody, response, error) in
        // TODO: handle response from server and save to state
    }
    
    dataTask.resume()
}
