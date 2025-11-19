//
//  LiquidGlassModifier.swift
//  Tally
//
//  Created by Danil Kazakov on 19.11.2025.
//

import SwiftUI

extension View {
    @ViewBuilder
    func liquidGlassButtonIfAvailable(prominent: Bool = false) -> some View {
        if #available(macOS 26, *) {
            self.buttonStyle(.glass)
        } else {
            self
        }
    }
}
