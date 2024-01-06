import SwiftUI

struct MindTabView: View {
    enum Tab: String, CaseIterable {
        case mind = "마음"
        case worry = "고민 털어놓기"
    }
    @State var selectedTab = Tab.mind
    @Namespace var mindTabAnimation

    var body: some View {
        VStack(spacing: 24) {
            tabbar()
                .animation(.easeInOut, value: selectedTab)

            TabView(selection: $selectedTab) {
                MindView()
                    .tag(Tab.mind)

                WorryView()
                    .tag(Tab.worry)
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
        }
        .padding(.top, 8)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background {
            Color.gray900
                .ignoresSafeArea()
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                NavigationTitleText(text: "당신의 마음이 항상 빛나길", foreground: .white)
            }
        }
    }

    @ViewBuilder
    func tabbar() -> some View {
        HStack(spacing: 16) {
            ForEach(Tab.allCases, id: \.self) { tab in
                Text(tab.rawValue)
                    .font(.onePerson(.body1))
                    .foregroundStyle(selectedTab == tab ? .blue500 : .gray800)
                    .frame(height: 35)
                    .buttonWrapper {
                        withAnimation {
                            selectedTab = tab
                        }
                    }
                    .overlay(alignment: .bottom) {
                        if selectedTab == tab {
                            Capsule()
                                .fill(Color.blue500)
                                .frame(height: 3)
                                .matchedGeometryEffect(id: "MIND_TAB", in: mindTabAnimation)
                        }
                    }
            }

            Spacer()
        }
        .padding(.horizontal, 20)
    }
}

#Preview {
    MindTabView()
}
