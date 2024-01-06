import SwiftUI

extension View {
    func bouncyEffect() -> some View {
        self
            .buttonStyle(BouncyEffectButtonStyle())
    }
}

struct BouncyEffectButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 2.0 : 1.0)
            .opacity(configuration.isPressed ? 0.6 : 1.0)
            .animation(.easeOut, value: configuration.isPressed)
    }
}
