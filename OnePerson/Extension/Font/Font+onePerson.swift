import SwiftUI

extension Font {
    enum OnePersonFonStyle {
        case h1
        case h2
        case h3
        case h4
        case h5
        case body1
        case body2
        case body3
        case body4
        case caption
    }
    static func onePerson(_ style: OnePersonFonStyle) -> Font {
        Font.custom(style.fontName, size: style.size)
    }
}

struct OPText: View {
    var text: String
    var style: Font.OnePersonFonStyle

    var body: some View {
        Text(text)
            .font(Font.onePerson(style))
    }
}

extension Font.OnePersonFonStyle {
    var fontName: String {
        switch self {
        case .h1, .h2, .h3, .h4, .body1, .body3:
            return "Pretendard-SemiBold"

        case .h5, .body2, .body4, .caption:
            return "Pretendard-Medium"
        }
    }

    var size: CGFloat {
        switch self {
        case .h1: return 24
        case .h2: return 22
        case .h3: return 20
        case .h4, .h5: return 18
        case .body1, .body2: return 16
        case .body3, .body4: return 14
        case .caption: return 12
        }
    }
}
