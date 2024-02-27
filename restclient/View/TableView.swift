//
//  TableView.swift
//  restclient
//
//  Created by Alexander Ionov on 2/27/24.
//

import SwiftUI

struct TableView<T: TableItem>: View {
    @Binding var list: [T]
    // TODO: add column data for displaying columns
    
    func enabledBinding(entity: T) -> Binding<Bool> {
        return Binding<Bool>(
            get: {
                return entity.toggled
            },
            set: { isToggled in
                if let index = list.firstIndex(where: { $0.id == entity.id }) {
                    list[index].toggled = isToggled
                }
            }
        )
    }
    
    var body: some View {
        Table(list) {
            
            TableColumn("Enabled") { entity in
                Toggle("", isOn: enabledBinding(entity: entity))
            }
        }
    }
}

#Preview {
    @State var list: [HTTPHeader] = []
    
    return TableView<HTTPHeader>(list: $list)
}
