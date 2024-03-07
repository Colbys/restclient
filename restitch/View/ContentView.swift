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
    @State private var requestBody: String = ""
    
    var body: some View {
        NavigationSplitView {
            List {
                Text("Item 2")
            }
        } detail: {
            HStack {
                RequestConfigurationView(
                    headers: $headers,
                    queries: $queries,
                    requestBody: $requestBody
                )
                    .frame(minWidth: 450)
                ResponseView(response: restClient.response)
                    .frame(minWidth: 400)
            }
            
        }
        .toolbar {
            ToolbarItemGroup(placement: .status) {
                Menu("\(httpMethod.rawValue)") {
                    ForEach(HTTPMethod.allCases) { method in
                        Button(action: {
                            httpMethod = method
                        }) {
                            Text("\(method.rawValue)")
                                .foregroundStyle(getColor(method))
                        }
                    }
                }
                .menuStyle(.borderlessButton)
                TextField("URL", text: $url)
                    .frame(width: 350)
                    .multilineTextAlignment(.center)
                Button("Send") {
                    restClient.sendRequest(
                        url,
                        httpMethod: httpMethod,
                        headers: headers,
                        queries: queries
                    )
                }
                .buttonStyle(.borderless)
            }
        }
        .navigationTitle("")

    }
}

func getColor(_ httpMethod: HTTPMethod) -> Color {
    switch httpMethod {
    case .GET:
        return Color.blue
    case .POST:
        return Color.green
    case .PUT:
        return Color.orange
    case .PATCH:
        return Color.yellow
    case .DELETE:
        return Color.red
    default:
        return Color.black
    }
}

#Preview {
    ContentView()
        .environmentObject(RestClient())
}
