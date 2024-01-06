import SwiftUI

struct MealManageView: View {
    let weekdays = ["월", "화", "수", "목", "금", "토", "일"]
    let today = Date()
    let currentDate = Date()
    var todayString: String {
        "\(today.year)년 \(today.month)월 \(today.day)일"
    }
    var todayWeekString: String {
        "\(today.year)년 \(today.month)월 \(today.weekOfMonth)주차"
    }

    var body: some View {
        VStack(spacing: 0) {
            VStack(alignment: .leading, spacing: 20) {
                VStack(alignment: .leading, spacing: 8) {
                    Text(todayString)
                        .font(.onePerson(.body4))
                        .foregroundStyle(.gray400)

                    Text("이주영님의 식사")
                        .font(.onePerson(.h3))
                        .foregroundStyle(.gray900)
                }
                .padding(.horizontal, 20)

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
                .padding(.horizontal, 20)

                HStack(spacing: 30) {
                    ForEach(weekdays.indices, id: \.self) { index in
                        VStack(spacing: 8) {
                            Text(weekdays[index])
                                .font(.onePerson(.body4))
                                .foregroundStyle(.gray300)

                            Image(.meal)
                                .resizable()
                                .frame(width: 24, height: 24)

                            Text("\(index + 1)")
                                .font(.onePerson(.body4))
                                .foregroundStyle(.gray300)
                        }
                    }
                }
                .padding(.horizontal, 20)

                Color.gray50
                    .frame(height: 8)

                HStack {
                    Text("\(currentDate.month)월 \(currentDate.day)일")
                        .font(.onePerson(.body1))
                        .foregroundStyle(.blue500)

                    Spacer()

                    Image(systemName: "plus")
                        .resizable()
                        .frame(width: 14, height: 14)
                        .foregroundStyle(.blue500)
                        .padding(8)
                        .background {
                            Color.blue50
                                .clipShape(Circle())
                        }
                }
                .padding(.horizontal, 20)
            }
            .padding(.top, 12)

            Spacer()
        }
    }
}

#Preview {
    MealManageView()
}
