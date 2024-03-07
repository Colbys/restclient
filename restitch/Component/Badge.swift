//
//  Badge.swift
//  restclient
//
//  Created by Alexander Ionov on 3/2/24.
//

import SwiftUI

struct Badge<Content: View>: View {
    var color: Color = .teal
    @ViewBuilder let content: Content
    
    var body: some View {
        content
            .padding([.leading, .trailing])
            .background {
                Capsule(style: .circular)
                    .fill(color)
                    .frame(height: 24)
                    .overlay {
                        
                    }
            }
    }
}

#Preview {
    return Badge {
        Text("404")
            .bold()
            .foregroundStyle(.white)
    }
}
