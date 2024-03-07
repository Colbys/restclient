//
//  HTTPQueryTableView.swift
//  restclient
//
//  Created by Alexander Ionov on 2/28/24.
//

import SwiftUI

struct HTTPQueryTableView: View {
    @Binding var content: [HTTPQuery]
    
    func enabledBinding(query: HTTPQuery) -> Binding<Bool> {
        return Binding<Bool>(
            get: {
                return query.toggled
            },
            set: { isEnabled in
                if let index = content.firstIndex(where: { $0.id == query.id }) {
                    content[index].toggled = isEnabled
                }
            }
        )
    }
    
    var body: some View {
        Table(content) {
            TableColumn("Name", value: \.name)
            TableColumn("Value", value: \.value)
            TableColumn("Enabled") { query in
                Toggle("", isOn: enabledBinding(query: query))
            }
        }
    }
}

#Preview {
    @State var list: [HTTPQuery] = [
        HTTPQuery(name: "query", value: "sample", toggled: true)
    ]
    
    return HTTPQueryTableView(content: $list)
}
