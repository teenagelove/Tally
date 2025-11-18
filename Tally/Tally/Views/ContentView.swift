//
//  ContentView.swift
//  Tally
//
//  Created by Danil Kazakov on 18.11.2025.
//

import SwiftUI

struct ContentView: View {
    @State private var viewModel = TallyViewModel()

    var body: some View {
        VStack {
            headerBar
            editor
            stats
        }
        .padding()
    }
}

private extension ContentView {
    var headerBar: some View {
        HStack {
            Spacer()

            PasteButton(payloadType: String.self) { strings in
                viewModel.paste(strings)
            }
            .focusEffectDisabled()
            .buttonStyle(.glass)
        }
    }

    var editor: some View {
        @Bindable var vm = viewModel

        return TextEditor(text: $vm.text)
            .font(.body)
            .padding(8)
            .background(.colorBackground)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                    .shadow(radius: 3)
            )

    }

    var stats: some View {
        VStack {
            Text("\(viewModel.wordCount)")
                .font(.largeTitle)

            Text(.wordsTitle(arg1: viewModel.wordCount))
        }
    }
}

#Preview {
    ContentView()
}
