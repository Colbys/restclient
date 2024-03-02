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
                    HStack {
                        Badge {
                            Text("\(response?.statusCode ?? 0)")
                                .bold()
                                .foregroundStyle(.white)
                        }
                        Badge {
                            Text("\(response?.mimeType ?? "")")
                                .bold()
                                .foregroundStyle(.white)
                        }
                    }
                    ScrollView {
                        Text(response?.body ?? "")
                    }
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
