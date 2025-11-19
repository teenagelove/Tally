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

            Button {
                viewModel.clearText()
            } label: {
                Image(systemName: "trash")
                    .font(.system(size: 15))

                Text(.clearTitle)
            }
            .focusEffectDisabled()
            .liquidGlassButtonIfAvailable()

            PasteButton(payloadType: String.self) { strings in
                viewModel.paste(strings)
            }
            .focusEffectDisabled()
            .liquidGlassButtonIfAvailable()
        }
    }

    var editor: some View {
        @Bindable var vm = viewModel

        return TextEditor(text: $vm.text)
            .font(.system(size: 16))
            .padding(8)
            .background(.colorBackground)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                    .shadow(radius: 3)
            )
    }

    @ViewBuilder
    var stats: some View {
        HStack(spacing: 40) {
            VStack {
                Text("\(viewModel.symbolsCount)")
                    .font(.largeTitle)

                Text(.symbolsTitle(arg1: viewModel.symbolsCount))
            }

            VStack {
                Text("\(viewModel.symbolsWithoutSpacesCount)")
                    .font(.largeTitle)

                Text(.spaceTitle)
                    .strikethrough()
            }


            VStack {
                Text("\(viewModel.wordCount)")
                    .font(.largeTitle)

                Text(.wordsTitle(arg1: viewModel.wordCount))
            }
        }
    }
}

#Preview {
    ContentView()
}
