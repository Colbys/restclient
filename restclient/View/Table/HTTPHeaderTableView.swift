//
//  HTTPHeaderTableView.swift
//  restclient
//
//  Created by Alexander Ionov on 2/28/24.
//

import SwiftUI

struct HTTPHeaderTableView: View {
    @Binding var content: [HTTPHeader]
    
    func enabledBinding(header: HTTPHeader) -> Binding<Bool> {
        return Binding<Bool>(
            get: {
                return header.toggled
            },
            set: { isEnabled in
                if let index = content.firstIndex(where: { $0.id == header.id }) {
                    content[index].toggled = isEnabled
                }
            }
        )
    }
    
    var body: some View {
        Table(content) {
            TableColumn("Name", value: \.name)
            TableColumn("Value", value: \.value)
            TableColumn("Enabled") { header in
                Toggle("", isOn: enabledBinding(header: header))
            }
        }
    }
}

#Preview {
    @State var list: [HTTPHeader] = [
        HTTPHeader(name: "Content-Type", value: "application/json", toggled: true)
    ]
    
    return HTTPHeaderTableView(content: $list)
}
