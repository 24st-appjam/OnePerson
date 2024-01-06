import SwiftUI

struct OPSelectionTabbKey: EnvironmentKey {
    static var defaultValue: Binding<OPTabView.Tab> = .constant(.home)
}

extension EnvironmentValues {
    var opSelectionTabbKey: Binding<OPTabView.Tab> {
        get { self[OPSelectionTabbKey.self] }
        set { self[OPSelectionTabbKey.self] = newValue }
    }
}
