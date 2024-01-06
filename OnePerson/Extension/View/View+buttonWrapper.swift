import SwiftUI

extension View {
    func buttonWrapper(onTap: @escaping () -> Void) -> some View {
        Button(action: onTap) {
            self
        }
    }
}
