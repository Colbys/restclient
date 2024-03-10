//
//  SourceCodeEditor.swift
//  restitch
//
//  Created by Alexander Ionov on 3/10/24.
//

import SwiftUI
import CodeEditorView
import LanguageSupport

struct SourceCodeEditor: View {
    @Binding var requestBody: String
    
    @State private var position: CodeEditor.Position = CodeEditor.Position()
    @State private var messages: Set<TextLocated<Message>> = Set()
    
    @Environment(\.colorScheme) private var colorScheme: ColorScheme
    
    // TODO: add disabled edit
    // TODO: add language support for JSON
    // example - https://github.com/mchakravarty/CodeEditorView/blob/main/Sources/LanguageSupport/SwiftConfiguration.swift
    var body: some View {
        CodeEditor(
            text: $requestBody,
            position: $position,
            messages: $messages,
            layout: .init(showMinimap: false, wrapText: true)
        )
        .environment(\.codeEditorTheme,
                           colorScheme == .dark ? Theme.defaultDark : Theme.defaultLight)
    }
}

func wrapSourceCode(sourceCode: String) -> Binding<String> {
    return Binding<String> {
        return sourceCode
    } set: { _ in
        
    }

}

#Preview {
    @State var sourceCode = ""
    
    return SourceCodeEditor(requestBody: $sourceCode)
}
