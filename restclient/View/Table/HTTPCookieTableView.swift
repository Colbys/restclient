//
//  HTTPCookieTableView.swift
//  restclient
//
//  Created by Alexander Ionov on 2/28/24.
//

import SwiftUI

struct HTTPCookieTableView: View {
    @Binding var content: [HTTPCookie]
    
    func enabledBinding(cookie: HTTPCookie) -> Binding<Bool> {
        return Binding<Bool>(
            get: {
                return cookie.toggled
            },
            set: { isEnabled in
                if let index = content.firstIndex(where: { $0.id == cookie.id }) {
                    content[index].toggled = isEnabled
                }
            }
        )
    }
    
    var body: some View {
        Table(content) {
            TableColumn("Name", value: \.name)
            TableColumn("Value", value: \.value)
            TableColumn("Enabled") { cookie in
                Toggle("", isOn: enabledBinding(cookie: cookie))
            }
        }
    }
}

#Preview {
    @State var list: [HTTPCookie] = [
        HTTPCookie(name: "cookie", value: "yes", toggled: true)
    ]
    
    return HTTPCookieTableView(content: $list)
}
