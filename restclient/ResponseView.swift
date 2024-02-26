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
            VStack {
                if (response != nil) {
                    HStack(
                        spacing: 30
                    ) {
                        Text("\(response?.statusCode ?? 0)")
                        Text("\(response?.mimeType ?? "")")
                    }
                    Text(response?.body ?? "")
                } else {
                    Text("No Response")
                }
                
            }
        }
        .padding()
        .frame(minWidth: 100, maxWidth: .infinity)
    }
}

#Preview {
    ResponseView(response: Response(
        statusCode: 200,
        mimeType: "application/json",
        body: "{\"\"}"
    ))
}
