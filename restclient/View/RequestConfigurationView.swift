//
//  RequestConfigurationView.swift
//  restclient
//
//  Created by Alexander Ionov on 2/28/24.
//

import SwiftUI

struct RequestConfigurationView: View {
    @Binding var headers: [HTTPHeader]
    @Binding var queries: [HTTPQuery]
    @Binding var cookies: [HTTPCookie]
    
    var body: some View {
        TabView {
            VStack() {
                Text("Body")
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
            HTTPCookieTableView(content: $cookies)
            .tabItem {
                Text("Cookies (0)")
            }
        }
        .padding(.top)
    }
}

#Preview {
    @State var headers: [HTTPHeader] = []
    @State var queries: [HTTPQuery] = []
    @State var cookies: [HTTPCookie] = []
    
    return RequestConfigurationView(headers: $headers, queries: $queries, cookies: $cookies)
}
