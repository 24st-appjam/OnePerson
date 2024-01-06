import SwiftUI

struct WorryView: View {
    @State var chats: [(String, Bool)] = [
        
    ]
    @State var text = ""
    @State var chatList: [(String, Bool)] = [
        ("많이 외로우시군요.... 제 진심을 담아 위로 드리고 싶네요.", false)
    ]
    @FocusState var isFocused: Bool

    var body: some View {
        VStack {
            LazyVStack(spacing: 24) {
                ForEach(chats, id: \.0) { text in
                    Group {
                        if text.1 {
                            myChat(text: text.0)
                        } else {
                            otherChat(text: text.0)
                        }
                    }
                    .padding(.horizontal, 20)
                }
            }

            Spacer()
                .frame(height: 56)

            Spacer()
        }
        .overlay(alignment: .bottom) {
            HStack {
                TextField("메시지를 입력해주세요!", text: $text)
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 14)
                    .foregroundStyle(.white)
                    .background {
                        RoundedRectangle(cornerRadius: 16)
                            .fill(Color.gray800)
                            .stroke(Color.gray700)
                    }
                    .focused($isFocused)

                Image(.airplaneSend)
                    .buttonWrapper {
                        chats.append((text, true))
                        text = ""

                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            chats.append(chatList.removeFirst())
                        }
                    }
            }
            .padding(.horizontal, 20)
            .padding(.bottom, isFocused ? 0 : 72)
            .safeAreaPadding(.bottom)
        }
    }

    @ViewBuilder
    func otherChat(text: String) -> some View {
        HStack(spacing: 8) {
            Image(.appJami)
                .resizable()
                .frame(width: 31, height: 24)
                .background {
                    Circle()
                        .fill(Color.gray100)
                        .frame(width: 36, height: 36)
                }

            VStack(alignment: .leading, spacing: 4) {
                Text("앱잼이")
                    .font(.onePerson(.body4))
                    .foregroundStyle(.gray900)

                Text(text)
                    .lineLimit(nil)
                    .font(.onePerson(.body4))
                    .foregroundStyle(.gray900)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 16)
                    .background {
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.gray50)
                    }
            }

            Spacer()
        }
    }

    @ViewBuilder
    func myChat(text: String) -> some View {
        HStack {
            Spacer()

            Text(text)
                .font(.onePerson(.body4))
                .foregroundStyle(.white)
                .padding(.horizontal, 20)
                .padding(.vertical, 16)
                .background {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.blue500)
                }
        }
    }
}
