import SwiftUI

struct Stamp: Equatable, Hashable {
    let id: UUID = UUID()
    let success: Bool
}

struct MyPageView: View {
    @State var stampList = [
        Stamp(success: true),
        Stamp(success: true),
        Stamp(success: true),
        Stamp(success: true),
        Stamp(success: true),

        Stamp(success: true),
        Stamp(success: true),
        Stamp(success: false),
        Stamp(success: false),
        Stamp(success: false)
    ]
    let grid = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        VStack {
            VStack(spacing: 32) {
                HStack(spacing: 24) {
                    Image(.appJami)
                        .resizable()
                        .frame(width: 41, height: 32)
                        .background {
                            Circle()
                                .fill(Color.gray100)
                                .frame(width: 64, height: 64)
                        }

                    VStack(alignment: .leading, spacing: 8) {
                        Text("안녕하세요")
                            .font(.onePerson(.h4))
                            .foregroundStyle(.gray400)

                        Text("이주영님")
                            .font(.onePerson(.h3))
                            .foregroundStyle(.gray900)
                    }

                    Spacer()
                }

                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Text("내가 모은 쿠폰")
                            .font(.onePerson(.body1))
                            .foregroundStyle(.gray900)

                        Spacer()

                        Image(systemName: "arrow.right")
                            .resizable()
                            .renderingMode(.template)
                            .frame(width: 12, height: 12)
                            .foregroundStyle(.gray400)
                    }

                    HStack(spacing: 0) {
                        Text("\(stampList.filter(\.success).count)")
                            .foregroundStyle(.blue500)

                        Text("/10")
                    }
                    .font(.onePerson(.body4))

                    LazyVGrid(columns: grid, spacing: 5) {
                        ForEach(stampList, id: \.self) { stamp in
                            if stamp.success {
                                Image(.appJamiStamp)
                                    .resizable()
                                    .frame(width: 58, height: 58)
                            } else {
                                Circle()
                                    .stroke(Color.gray100, lineWidth: 4)
                                    .frame(width: 58, height: 58)
                                    .overlay {
                                        Circle()
                                            .fill(Color.gray100)
                                            .stroke(Color.gray50)
                                            .frame(width: 52, height: 52)
                                    }
                            }
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 24)
                .padding(.horizontal, 20)
                .background {
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color.gray50)
                }

                HStack {
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            Text("쿠폰 교환하러 가기")
                                .font(.onePerson(.body1))
                                .foregroundStyle(.gray900)

                            Spacer()

                            Image(systemName: "arrow.right")
                                .resizable()
                                .renderingMode(.template)
                                .frame(width: 12, height: 12)
                                .foregroundStyle(.gray400)
                        }

                        Text("쿠폰으로 건강을 얻어가세요!")
                            .font(.onePerson(.body4))
                            .foregroundStyle(.gray300)
                    }

                    Spacer()
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 24)
                .padding(.horizontal, 20)
                .background {
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color.gray50)
                }

                Spacer()
            }
            .padding(.horizontal, 20)
            .padding(.top, 24)
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                NavigationTitleText(text: "마이페이지")
            }
        }
    }
}

#Preview {
    MyPageView()
}
