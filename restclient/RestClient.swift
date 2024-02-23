//
//  RestClient.swift
//  restclient
//
//  Created by Alexander Ionov on 2/23/24.
//

import Foundation

class RestClient: ObservableObject {
    
    @Published var response: Response? = nil
    
    func sendRequest(urlRaw: String) {
        guard let url = URL(string: urlRaw) else {
            // TODO: display message in UI if URL is invalid
            fatalError("Invalid URL")
        }

        var urlRequest = URLRequest(url: url)
        urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
        urlRequest.httpMethod = "GET"
        
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, r, e) in
            // TODO: handle response from server and save to state
            guard let data = data else { return }
            guard let httpResponse = r as? HTTPURLResponse else { return }
            
            DispatchQueue.main.async {
                self.response = Response(statusCode: httpResponse.statusCode, mimeType: httpResponse.mimeType!)
            }
            
            print(httpResponse.mimeType)
            print(httpResponse.expectedContentLength)
            print(httpResponse.statusCode)
            print(String(data: data, encoding: .utf8))
        }
        
        dataTask.resume()
    }
}
