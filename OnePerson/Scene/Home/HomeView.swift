import SwiftUI
import NukeUI

struct HomeView: View {
    @State var isNavigateSupport = false
    @Environment(\.openURL) var openURL

    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                VStack(alignment: .leading, spacing: 8) {
                    let today = Date()
                    let todayString = "\(today.year)년 \(today.month)월 \(today.day)일"
                    Text(todayString)
                        .font(.onePerson(.body4))
                        .foregroundStyle(.gray400)

                    Text("이주영님을 위해 이런 서비스를 준비했어요")
                        .font(.onePerson(.h3))
                        .foregroundStyle(.gray900)
                }

                VStack(spacing: 12) {
                    cardView(title: "나를 위한 지원 알아보기", description: "나를 위한 지원 사업 알아보고 지원금받자!") {
                        isNavigateSupport = true
                    }

                    cardView(title: "내 건강을 위해 식단 체크해보기", description: "식단을 기록하고 돌아보고 건강도 챙기자!") {
                        
                    }

                    cardView(title: "지친 내마음, 달래줄 곳이 필요하다면?", description: "무거운 이야기들, 챗봇에게 털어놓자") {
                        
                    }
                }

                VStack(spacing: 12) {
                    HStack {
                        Text("내 주변 친환경 마트")
                            .font(.onePerson(.h4))
                            .foregroundStyle(.gray900)
                        
                        Spacer()
                    }

                    ScrollView(.horizontal) {
                        LazyHStack(spacing: 12) {
                            ForEach(shopList, id: \.self) { shop in
                                shopRow(shop: shop)
                            }
                        }
                    }
                    .scrollIndicators(.hidden)
                }
            }
            .padding(.horizontal, 20)
        }
        .navigationDestination(isPresented: $isNavigateSupport) {
            SupportView()
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                NavigationTitleText(text: "이주영님!")
            }
        }
    }

    @ViewBuilder
    func cardView(
        title: String,
        description: String,
        onTap: @escaping () -> Void
    ) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text(title)
                    .font(.onePerson(.body1))
                    .foregroundStyle(.gray900)

                Spacer()

                Image(systemName: "arrow.right")
                    .resizable()
                    .frame(width: 12, height: 12)
                    .foregroundStyle(.black)
            }

            Text(description)
                .font(.onePerson(.body4))
                .foregroundStyle(.gray300)
        }
        .padding(.vertical, 24)
        .padding(.horizontal, 20)
        .background {
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.gray50)
        }
        .buttonWrapper(onTap: onTap)
    }

    @ViewBuilder
    @MainActor
    func shopRow(shop: ShopEntity) -> some View {
        VStack(spacing: 12) {
            HStack(spacing: 12) {
                LazyImage(url: URL(string: shop.imageURL)) { state in
                    if let image = state.image {
                        image
                            .resizable()
                            .aspectRatio(1, contentMode: .fit)
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                            .frame(width: 48, height: 48)
                    } else {
                        RoundedRectangle(cornerRadius: 16)
                            .fill(Color.gray200)
                            .frame(width: 48, height: 48)
                    }
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text(shop.name)
                        .font(.onePerson(.body2))
                        .foregroundStyle(.gray900)

                    Text(shop.location)
                        .font(.onePerson(.body4))
                        .foregroundStyle(.gray500)
                }
            }

            ScrollView(.horizontal) {
                LazyHStack(spacing: 12) {
                    ForEach(shop.tag, id: \.self) { tag in
                        Text(tag)
                            .font(.onePerson(.caption))
                            .foregroundStyle(.blue500)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 8)
                            .background {
                                Capsule()
                                    .fill(Color.blue50)
                                    .stroke(Color.blue100)
                            }
                    }
                }
            }

            Divider()
                .frame(height: 1)
                .foregroundStyle(.gray100)

            HStack(spacing: 8) {
                Text("\"\(shop.name)\"의 매장 정보 더보기")
                    .font(.onePerson(.caption))
                    .foregroundStyle(Color.blue500)

                Image(systemName: "chevron.right")
                    .resizable()
                    .frame(width: 8, height: 12)
                    .foregroundStyle(Color.blue500)
            }
            .buttonWrapper {
                guard let url = URL(string: shop.link) else { return }
                openURL(url)
            }
        }
        .padding(18)
        .background {
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.gray50)
                .stroke(Color.gray100)
        }
    }
}

#Preview {
    HomeView()
}
