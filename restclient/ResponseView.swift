//
//  ResponseVIew.swift
//  restclient
//
//  Created by Alexander Ionov on 2/23/24.
//

import SwiftUI

struct ResponseView: View {
    
    let response: Response?
    
    var body: some View {
        VStack(
            alignment: .leading
        ) {
            HStack(
                spacing: 30
            ) {
                if (response != nil) {
                    Text("\(response?.statusCode ?? 0)")
                    Text("\(response?.mimeType ?? "")")
                } else {
                    Text("No Response")
                }
            }
            Text("Hello, World!")
        }
        .padding()
        .frame(minWidth: 100, maxWidth: .infinity)
    }
}

#Preview {
    ResponseView(response: Response(statusCode: 200, mimeType: "text/html"))
}
