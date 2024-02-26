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
        HTTPHeader(name: "Content-Type", value: "application/json", enabled: true)
    ]
    
    func enabledBinding(header: HTTPHeader) -> Binding<Bool> {
        return Binding<Bool>(
            get: {
                return header.enabled
            },
            set: { isEnabled in
                if let index = headers.firstIndex(where: { $0.id == header.id }) {
                    headers[index].enabled = isEnabled
                }
            }
        )
    }
    
    var body: some View {
        NavigationSplitView {
            List {
                Text("Item 2")
            }
        } detail: {
            HStack(
                alignment: .top
            ) {
                Table(headers) {
                    TableColumn("Name", value: \.name)
                    TableColumn("Value", value: \.value)
                    TableColumn("Enabled") { header in
                        Toggle("", isOn: enabledBinding(header: header))
                    }
                }
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
