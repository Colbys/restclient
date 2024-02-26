//
//  ContentView.swift
//  restclient
//
//  Created by Alexander Ionov on 2/23/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var restClient: RestClient
    
    @State private var url = "https://example.com"
    @State private var httpMethod: HTTPMethod = HTTPMethod.GET
    
    var body: some View {
        NavigationSplitView {
            List {
                Text("Item 2")
            }
        } detail: {
            HStack(
                alignment: .top
            ) {
                VStack {
                }
                .padding()
                ResponseView(response: restClient.response)
            }
        }
        .toolbar {
            ToolbarItemGroup(placement: .status) {
                Menu("\(httpMethod.rawValue)") {
                    ForEach(HTTPMethod.allCases) { method in
                        Button("\(method.rawValue)") {
                            httpMethod = method
                        }
                    }
                }
                .menuStyle(.button)
                TextField("URL", text: $url)
                Button("Send") {
                    restClient.sendRequest(
                        urlRaw: url,
                        httpMethod: httpMethod
                    )
                }
            }
        }
        .navigationTitle("")

    }
}

#Preview {
    ContentView()
        .environmentObject(RestClient())
}
