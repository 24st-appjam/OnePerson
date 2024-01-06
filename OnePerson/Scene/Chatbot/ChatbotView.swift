import SwiftUI

struct ChatbotView: View {
    @State var chats: [(String, Bool)] = [
        ("안녕하세요! 저한테 궁금한\n 점을 물어봐주세요!", false)
    ]
    @State var text = ""
    @State var chatList: [(String, Bool)] = [
        ("안녕하세요! 저한테 궁금한\n 점들을 물어봐주세요!", false),
        ("파란색 모터 필터를 금속망 그릴에서 꺼내 주세요. 버튼을 누르고 금속망 그릴을 오른쪽으로 돌려 잠금을 해제하고 위로 올려 투명 먼지 통과 분리하세요. 쓰레기통에 먼지를 털어 주세요. 흐르는 물에 깨끗하게 세척한 후 그늘에서 24시간 이상 완전히 말려 주세요", false)
    ]
    @FocusState var isFocused: Bool

    var body: some View {
        ScrollView {
            VStack {
                Spacer()
                    .frame(height: 8)

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
            }
        }
        .overlay(alignment: .bottom) {
            HStack {
                TextField("메시지를 입력해주세요!", text: $text)
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 14)
                    .background {
                        RoundedRectangle(cornerRadius: 16)
                            .fill(Color.gray50)
                            .stroke(Color.gray100)
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
            .padding(.bottom, isFocused ? 0 : 56)
            .safeAreaPadding(.bottom)
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                NavigationTitleText(text: "챗봇")
            }
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

#Preview {
    ChatbotView()
}
