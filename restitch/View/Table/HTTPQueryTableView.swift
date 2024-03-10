//
//  HTTPQueryTableView.swift
//  restclient
//
//  Created by Alexander Ionov on 2/28/24.
//

import SwiftUI

struct HTTPQueryTableView: View {
    @Binding var content: [HTTPQuery]
    
    @State private var selection: Set<HTTPQuery.ID> = []
    
    func enabledBinding(_ query: HTTPQuery) -> Binding<Bool> {
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
    
    func add(_ query: HTTPQuery) {
        content.append(query)
    }
    
    func delete(_ query: HTTPQuery) {
        if let index = content.firstIndex(of: query) {
            content.remove(at: index)
        }
    }
    
    var body: some View {
        VStack(alignment: .trailing) {
            Table(of: HTTPQuery.self, selection: $selection) {
                TableColumn("Name", value: \.name)
                TableColumn("Value", value: \.value)
                TableColumn("Enabled") { query in
                    Toggle("", isOn: enabledBinding(query))
                }
            } rows: {
                ForEach(content) { item in
                    TableRow(item)
                        .contextMenu {
                            Button("Delete", role: .destructive) {
                                delete(item)
                            }
                        }
                }
            }
            // TODO: look up if there's more appropriate button for adding new entries
            Button("+") {
                add(HTTPQuery(name: "Query", value: "Value", toggled: true))
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
