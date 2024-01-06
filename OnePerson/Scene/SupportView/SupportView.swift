import SwiftUI

struct SupportView: View {
    let categoryList = ["일자리", "주거", "교육", "코로나", "의료", "기타"]
    @State var selectedCategory = "일자리"
    @Namespace var categoryAnimation
    @EnvironmentObject var pickSupportStorage: PickSupportStorage
    var filteredSupportList: [SupportEntity] {
        supportList.filter { $0.category == selectedCategory }
    }
    var pickSupportSet: Set<SupportEntity> {
        Set(pickSupportStorage.pickedSupport)
    }

    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 8) {
                let today = Date()
                var todayString: String = "\(today.year)년 \(today.month)월 \(today.day)일"
                Text(todayString)
                    .font(.onePerson(.body4))
                    .foregroundStyle(.gray400)

                HStack {
                    Text("이주영님을 위한 지원 사업")
                        .font(.onePerson(.h3))
                        .foregroundStyle(.gray900)

                    Spacer()

                    Text("337개")
                        .font(.onePerson(.body4))
                        .foregroundStyle(.gray300)
                }
            }

            categoryTabView()
                .frame(height: 50)

            ScrollView {
                LazyVStack(spacing: 12) {
                    ForEach(filteredSupportList, id: \.self) { support in
                        supportRow(support: support)
                    }
                }
            }

            Spacer()
        }
        .padding(.horizontal, 20)
        .padding(.top, 12)
    }

    @ViewBuilder
    func categoryTabView() -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 0) {
                ForEach(categoryList, id: \.self) { category in
                    let isSelected = selectedCategory == category
                    Text(category)
                        .font(.onePerson(isSelected ? .body1 : .body2))
                        .foregroundStyle(isSelected ? .blue500 : .gray200)
                        .frame(height: 35)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .buttonWrapper {
                            withAnimation {
                                selectedCategory = category
                            }
                        }
                        .overlay(alignment: .bottom) {
                            Rectangle()
                                .fill(.gray200)
                                .frame(height: 1)

                            if isSelected {
                                Rectangle()
                                    .fill(.blue500)
                                    .frame(height: 2)
                                    .matchedGeometryEffect(id: "CATEGORY", in: categoryAnimation)
                            }
                        }
                }
            }
        }
    }

    @ViewBuilder
    func supportRow(support: SupportEntity) -> some View {
        HStack(spacing: 12) {
            VStack(alignment: .leading, spacing: 8) {
                Text(support.title)
                    .font(.onePerson(.body1))
                    .foregroundStyle(.gray900)

                Text(support.benefit)
                    .font(.onePerson(.body4))
                    .foregroundStyle(.gray300)
            }

            Spacer()

            let isPicked = pickSupportSet.contains(support)
            Image(systemName: "heart.fill")
                .frame(width: 20, height: 20)
                .foregroundStyle(isPicked ? .blue500 : .gray200)
                .buttonWrapper {
                    if isPicked {
                        pickSupportStorage.pickedSupport
                            .removeAll(where: { $0 == support })
                    } else {
                        pickSupportStorage.pickedSupport
                            .append(support)
                    }
                }
                .bouncyEffect()
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 24)
        .frame(maxWidth: .infinity)
        .background {
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.gray50)
        }
    }
}

#Preview {
    SupportView()
        .environmentObject(PickSupportStorage())
}
