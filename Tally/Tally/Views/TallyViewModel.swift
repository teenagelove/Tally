//
//  TallyViewModel.swift
//  Tally
//
//  Created by Danil Kazakov on 18.11.2025.
//

import Foundation
import Observation

@Observable
final class TallyViewModel {
    var text: String = ""

    var wordCount: Int {
        let words = text.split { $0.isWhitespace || $0.isNewline }
        return words.count
    }

    func paste(_ strings: [String]) {
        text = strings.first ?? ""
    }
}
