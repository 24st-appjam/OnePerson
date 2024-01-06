import SwiftUI
import NukeUI

struct HealthView: View {
    let today = Date()
    let currentDate = Date()
    let monthDate = Date()
    var todayString: String {
        "\(today.year)년 \(today.month)월 \(today.day)일"
    }
    var todayWeekString: String {
        "\(today.year)년 \(today.month)월 \(today.weekOfMonth)주차"
    }
    @State var histories: [Int: Bool] = [:]
    @State var meals: [MealTimeType: String] = [
        .breakfast:  "https://github.com/baekteun/TodayWhat-new/assets/74440939/77009d1e-4fa2-4171-a8e3-b8a6b59e071e"
    ]
    @Environment(\.openURL) var openURL
    @State var isNavigateAddHistory = false

    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                VStack(alignment: .leading, spacing: 20) {
                    VStack(alignment: .leading, spacing: 8) {
                        Text(todayString)
                            .font(.onePerson(.body4))
                            .foregroundStyle(.gray400)

                        Text("이주영님의 영양 상태")
                            .font(.onePerson(.h3))
                            .foregroundStyle(.gray900)
                    }

                    HStack(spacing: 24) {
                        Text(todayWeekString)
                            .font(.onePerson(.body3))
                            .foregroundStyle(.gray700)

                        Spacer()

                        HStack(spacing: 12) {
                            Image(systemName: "chevron.left")
                                .foregroundStyle(.gray700)

                            Image(systemName: "chevron.right")
                                .foregroundStyle(.gray700)

                            Text("주")
                                .font(.onePerson(.caption))
                                .foregroundStyle(.gray600)
                                .padding(.horizontal, 8)
                                .padding(.vertical, 3)
                                .background {
                                    RoundedRectangle(cornerRadius: 16)
                                        .fill(Color.gray100)
                                }
                        }
                    }

                    HStack(spacing: 30) {
                        let dates = monthDate.fetchAllDatesInCurrentWeek()
                        ForEach(dates, id: \.self) { date in
                            VStack(spacing: 8) {
                                Text(date.weekdayString)
                                    .font(.onePerson(.body4))
                                    .foregroundStyle(.gray300)

                                let mealColor = if histories[date.day] != nil {
                                    Color.green300
                                } else {
                                    Color.gray300
                                }
                                Image(.meal)
                                    .resizable()
                                    .renderingMode(.template)
                                    .frame(width: 24, height: 24)
                                    .foregroundStyle(mealColor)

                                Text("\(date.day)")
                                    .font(.onePerson(.body4))
                                    .foregroundStyle(.gray300)
                                    .padding(.horizontal, 8)
                                    .padding(.vertical, 4)
                                    .background {
                                        if date.day == today.day {
                                            Circle()
                                                .fill(.blue500)
                                        }
                                    }
                            }
                        }
                    }

                    VStack(spacing: 12) {
                        HStack {
                            Text("영양 상태 기록하기")
                                .font(.onePerson(.h4))
                                .foregroundStyle(.gray900)

                            Spacer()

                            let string = if histories[currentDate.day] != nil {
                                "· 정상입니다."
                            } else {
                                "· 아직 부족해요."
                            }
                            let color = if histories[currentDate.day] != nil {
                                Color.green500
                            } else {
                                Color.red500
                            }
                            Text(string)
                                .font(.onePerson(.caption))
                                .foregroundStyle(color)
                        }

                        VStack(spacing: 8) {
                            let breakfast = meals[.breakfast]
                            Group {
                                if let breakfast {
                                    LazyImage(url: URL(string: breakfast)) { state in
                                        if let image = state.image {
                                            image
                                                .resizable()
                                        } else {
                                            Image(.lunch)
                                                .resizable()
                                        }
                                    }
                                } else {
                                    Image(.lunch)
                                        .resizable()
                                }
                            }
                            .aspectRatio(3.5, contentMode: .fit)
                            .frame(maxWidth: .infinity)
                            .overlay(alignment: .topLeading) {
                                Text("아침")
                                    .padding(.top, 12)
                                    .padding(.leading, 16)
                                    .font(.onePerson(.h4))
                                    .foregroundStyle(breakfast != nil ? .white : .gray500)
                            }
                            .overlay(alignment: .bottomTrailing) {
                                if breakfast != nil {
                                    historyCompleteButton()
                                        .padding([.bottom, .trailing], 12)
                                } else {
                                    addHistoryButton {
                                        isNavigateAddHistory = true
                                    }
                                    .padding([.bottom, .trailing], 12)
                                }
                            }

                            let lunch = meals[.lunch]
                            Group {
                                if let lunch {
                                    LazyImage(url: URL(string: lunch)) { state in
                                        if let image = state.image {
                                            image
                                                .resizable()
                                        } else {
                                            Image(.lunch)
                                                .resizable()
                                        }
                                    }
                                } else {
                                    Image(.lunch)
                                        .resizable()
                                }
                            }
                            .aspectRatio(3.5, contentMode: .fit)
                            .frame(maxWidth: .infinity)
                            .overlay(alignment: .topLeading) {
                                Text("점심")
                                    .padding(.top, 12)
                                    .padding(.leading, 16)
                                    .font(.onePerson(.h4))
                                    .foregroundStyle(lunch != nil ? .white : .gray500)
                            }
                            .overlay(alignment: .bottomTrailing) {
                                if lunch != nil {
                                    historyCompleteButton()
                                        .padding([.bottom, .trailing], 12)
                                } else {
                                    addHistoryButton {
                                        isNavigateAddHistory = true
                                    }
                                    .padding([.bottom, .trailing], 12)
                                }
                            }

                            let dinner = meals[.dinner]
                            Group {
                                if let dinner {
                                    LazyImage(url: URL(string: dinner)) { state in
                                        if let image = state.image {
                                            image
                                                .resizable()
                                        } else {
                                            Image(.lunch)
                                                .resizable()
                                        }
                                    }
                                } else {
                                    Image(.lunch)
                                        .resizable()
                                }
                            }
                            .aspectRatio(3.5, contentMode: .fit)
                            .frame(maxWidth: .infinity)
                            .overlay(alignment: .topLeading) {
                                Text("저녁")
                                    .padding(.top, 12)
                                    .padding(.leading, 16)
                                    .font(.onePerson(.h4))
                                    .foregroundStyle(dinner != nil ? .white : .gray500)
                            }
                            .overlay(alignment: .bottomTrailing) {
                                if dinner != nil {
                                    historyCompleteButton()
                                        .padding([.bottom, .trailing], 12)
                                } else {
                                    addHistoryButton {
                                        isNavigateAddHistory = true
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                                            meals[.dinner] = "https://github.com/baekteun/TodayWhat-new/assets/74440939/0a6dfcde-f98a-4f62-98c2-69af7adebee3"
                                            histories[currentDate.day] = true
                                        }
                                    }
                                    .padding([.bottom, .trailing], 12)
                                }
                            }
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
                .padding(.top, 24)

                Spacer()
                    .frame(height: 80)

                Spacer()
            }
        }
        .navigationDestination(isPresented: $isNavigateAddHistory) {
            AddHistoryView()
        }
        .scrollIndicators(.hidden)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                NavigationTitleText(text: "영양 관리")
            }
        }
    }

    @ViewBuilder
    func historyCompleteButton() -> some View {
        Text("기록완료")
            .font(.onePerson(.caption))
            .foregroundStyle(.green500)
            .padding(8)
            .background {
                RoundedRectangle(cornerRadius: 8)
                    .fill(.green50)
                    .stroke(Color.green200)
            }
    }

    @ViewBuilder
    func addHistoryButton(
        onTap: @escaping () -> Void
    ) -> some View {
        Text("+ 기록하기")
            .font(.onePerson(.caption))
            .foregroundStyle(.blue500)
            .padding(8)
            .background {
                RoundedRectangle(cornerRadius: 8)
                    .fill(.blue50)
                    .stroke(Color.blue200)
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
    HealthView()
}
