import SwiftUI

struct NavigationTitleText: View {
    let text: String
    let foreground: Color

    init(text: String, foreground: Color = .gray900) {
        self.text = text
        self.foreground = foreground
    }

    var body: some View {
        Text(text)
            .font(.custom("EliceDXNeolliOTF-Bd", size: 16))
            .foregroundStyle(foreground)
    }
}
