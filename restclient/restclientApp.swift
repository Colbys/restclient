//
//  restclientApp.swift
//  restclient
//
//  Created by Alexander Ionov on 2/23/24.
//

import SwiftUI

@main
struct restclientApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(RestClient())
        }
    }
}
