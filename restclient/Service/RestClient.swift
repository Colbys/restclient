//
//  RestClient.swift
//  restclient
//
//  Created by Alexander Ionov on 2/23/24.
//

import Foundation

class RestClient: ObservableObject {
    
    @Published var response: Response? = nil
    
    func sendRequest(
        _ url: String,
        httpMethod: HTTPMethod,
        headers: [HTTPHeader],
        queries: [HTTPQuery]
    ) {
        var urlComponents = URLComponents(string: url)
        urlComponents?.queryItems = queries.map { query in
            return URLQueryItem(name: query.name, value: query.value)
        }
        
        guard let urlObj = urlComponents?.url else {
            // TODO: display message in UI if URL is invalid
            fatalError("Invalid URL")
        }

        var urlRequest = URLRequest(url: urlObj)
        for header in headers {
            urlRequest.addValue(header.value, forHTTPHeaderField: header.name)
        }
        urlRequest.httpMethod = httpMethod.rawValue
        
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, r, e) in
            guard let data = data else { return }
            guard let httpResponse = r as? HTTPURLResponse else { return }
            
            DispatchQueue.main.async {
                self.response = Response(statusCode: httpResponse.statusCode, mimeType: httpResponse.mimeType!, body: String(data: data, encoding: .utf8) ?? "")
            }
            
            print(httpResponse.expectedContentLength)
        }
        
        dataTask.resume()
    }
}
