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
    @State private var headers: [HTTPHeader] = [
        HTTPHeader(name: "Content-Type", value: "application/json", toggled: true)
    ]
    @State private var queries: [HTTPQuery] = [
        HTTPQuery(name: "query", value: "sample", toggled: true)
    ]
    @State private var cookies: [HTTPCookie] = [
        HTTPCookie(name: "cookie", value: "yes", toggled: true)
    ]
    
    var body: some View {
        NavigationSplitView {
            List {
                Text("Item 2")
            }
        } detail: {
            HStack(
                alignment: .top
            ) {
                TabView {
                    VStack() {
                        Text("Body")
                    }
                    .tabItem { 
                        Text("Body (JSON)")
                    }
                    HTTPHeaderTableView(content: $headers)
                    .tabItem {
                        Text("Headers (3)")
                    }
                    HTTPQueryTableView(content: $queries)
                    .tabItem {
                        Text("Queries (0)")
                    }
                    HTTPCookieTableView(content: $cookies)
                    .tabItem {
                        Text("Cookies (0)")
                    }
                }
                .padding(.top)
                .frame(minWidth: 450)
                ResponseView(response: restClient.response)
                    .frame(minWidth: 400)
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
                .menuStyle(.borderlessButton)
                TextField("URL", text: $url)
                Button("Send") {
                    restClient.sendRequest(
                        urlRaw: url,
                        httpMethod: httpMethod
                    )
                }
                .buttonStyle(.borderless)
            }
        }
        .navigationTitle("")

    }
}

#Preview {
    ContentView()
        .environmentObject(RestClient())
}
