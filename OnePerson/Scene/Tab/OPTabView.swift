import SwiftUI

struct OPTabView: View {
    @frozen
    enum Tab {
        case home
        case health
        case chatbot
        case mind
        case mypage
    }
    @State var selectedTab = Tab.home
    @State var isPresent = false

    var body: some View {
        NavigationStack {
            ZStack {
                switch selectedTab {
                case .home:
                    HomeView()

                case .health:
                    HealthView()

                case .chatbot:
                    ChatbotView()

                case .mind:
                    MindTabView()

                case .mypage:
                    MyPageView()
                }

                VStack {
                    Spacer()

                    HStack(spacing: 0) {
                        Spacer()

                        tabbarItem(tab: .home, imageName: "Home", title: "홈") {
                            selectedTab = .home
                        }

                        Spacer()

                        tabbarItem(tab: .health, imageName: "Health", title: "건강") {
                            selectedTab = .health
                        }

                        Spacer()

                        VStack(spacing: 4) {
                            Spacer()
                                .frame(width: 24, height: 24)

                            Text("챗봇")
                                .font(.onePerson(.caption))
                                .foregroundStyle(selectedTab == .chatbot ? .gray900 : .gray300)
                        }
                        .overlay {
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.blue500)
                                .frame(width: 48, height: 48)
                                .overlay {
                                    Image("Chatting")
                                }
                                .offset(y: -30)
                        }
                        .buttonWrapper {
                            selectedTab = .chatbot
                        }

                        Spacer()

                        VStack(spacing: 4) {
                            Image(.light)
                                .renderingMode(.template)
                                .foregroundStyle(.mind == selectedTab ? .white : .gray200)

                            Text("마음")
                                .font(.onePerson(.caption))
                                .foregroundStyle(.mind == selectedTab ? .white : .gray300)
                        }
                        .buttonWrapper {
                            selectedTab = .mind
                        }

                        Spacer()

                        tabbarItem(tab: .mypage, imageName: "MyPage", title: "마이") {
                            selectedTab = .mypage
                        }

                        Spacer()
                    }
                    .ignoresSafeArea(edges: .bottom)
                    .safeAreaPadding(.bottom)
                    .padding(.bottom, 12)
                    .background {
                        if selectedTab == .mind {
                            Color.gray900
                        } else {
                            Color.white
                        }
                    }
                }
                .ignoresSafeArea(edges: .bottom)
            }
            .environment(\.opSelectionTabbKey, $selectedTab)
        }
    }

    @ViewBuilder
    func tabbarItem(
        tab: Tab,
        imageName: String,
        title: String,
        onTap: @escaping () -> Void
    ) -> some View {
        VStack(spacing: 4) {
            let isSelected = tab == selectedTab
            Image(imageName)
                .renderingMode(.template)
                .foregroundStyle(isSelected ? .gray900 : disabledColor(disabled: isSelected))

            Text(title)
                .font(.onePerson(.caption))
                .foregroundStyle(isSelected ? .gray900 : disabledColor(disabled: isSelected))
        }
        .buttonWrapper(onTap: onTap)
    }

    func disabledColor(disabled: Bool) -> Color {
        if selectedTab == .mind, !disabled {
            Color.gray700
        } else {
            Color.gray300
        }
    }
}

#Preview {
    OPTabView()
}
