//
//  ContentView.swift
//  restclient
//
//  Created by Alexander Ionov on 2/23/24.
//

import SwiftUI

struct ContentView: View {
    @State private var url = ""
    
    var body: some View {
        NavigationSplitView {
            List {
                Text("Item 2")
            }
        } detail: {
            VStack {
                HStack {
                    TextField("URL", text: $url)
                    Button("Send") {
                        sendRequest(urlRaw: url)
                    }
                }
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello, world!")
            }
            .padding()
        }

    }
}

#Preview {
    ContentView()
}
