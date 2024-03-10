//
//  RequestConfigurationView.swift
//  restclient
//
//  Created by Alexander Ionov on 2/28/24.
//

import SwiftUI
import CodeEditorView
import LanguageSupport

struct RequestConfigurationView: View {
    @Binding var headers: [HTTPHeader]
    @Binding var queries: [HTTPQuery]
    @Binding var requestBody: String
    
    var body: some View {
        TabView {
            VStack() {
                SourceCodeEditor(requestBody: $requestBody)
            }
            .tabItem {
                Text("Body (JSON)")
            }
            HTTPHeaderTableView(content: $headers)
            // TODO: add badge to tab
            // https://developer.apple.com/design/human-interface-guidelines/tab-views
            .tabItem {
                HStack {
                    Text("Headers")
                    Text("3")
                }
            }
            .badge(3)
            HTTPQueryTableView(content: $queries)
            .tabItem {
                Text("Queries (0)")
            }
        }
        .padding(.top)
    }
}

#Preview {
    @State var headers: [HTTPHeader] = []
    @State var queries: [HTTPQuery] = []
    @State var requestBody: String = ""
    
    return RequestConfigurationView(
        headers: $headers,
        queries: $queries,
        requestBody: $requestBody
    )
}
