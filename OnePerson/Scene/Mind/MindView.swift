import SwiftUI

struct MindView: View {
    @State var selectedWorry = "외로움"
    @Environment(\.openURL) var openURL

    var body: some View {
        ScrollView {
            Spacer()
                .frame(height: 1)

            VStack(spacing: 24) {
                HStack(spacing: 12) {
                    worryCard(image: Image(.heart), backgroundColor: .red800, title: "외로움")
                    worryCard(image: Image(.water), backgroundColor: .blue800, title: "지침")
                    worryCard(image: Image(.plaster), backgroundColor: .orange800, title: "상처")

                    Spacer()
                }

                ScrollView(.horizontal) {
                    LazyHStack(spacing: 12) {
                        wordCard(text: "나를 위한 최고의 행동은\n무엇일까?", color: .green900)
                        wordCard(text: "나를 위한 최고의 동기부여는\n무엇일까?", color: .orange900)
                    }
                }
                .scrollIndicators(.hidden)

                VStack(spacing: 12) {
                    HStack {
                        Text("이주영님을 위한 추천")
                            .font(.onePerson(.body1))
                            .foregroundStyle(.white)

                        Spacer()

                        Text("더보기")
                            .font(.onePerson(.caption))
                            .foregroundStyle(.blue500)
                    }

                    ScrollView(.horizontal) {
                        LazyHStack(spacing: 12) {
                            bigCard(
                                card: waterWorry(),
                                title: "삶이 지칠 때 도움이 되는 영상",
                                subTitle: "지침",
                                description: "삶이 지칠땐... 이 영상을 보세요.",
                                detail: "토픽 자세히 보기"
                            )

                            bigCard(
                                card: plasterWorry(),
                                title: "삶이 지칠 때 도움이 되는 영상",
                                subTitle: "지침",
                                description: "삶이 지칠땐... 이 영상을 보세요.",
                                detail: "토픽 자세히 보기"
                            )

                            bigCard(
                                card: plasterWorry(),
                                title: "삶이 지칠 때 도움이 되는 영상",
                                subTitle: "지침",
                                description: "삶이 지칠땐... 이 영상을 보세요.",
                                detail: "토픽 자세히 보기"
                            )
                        }
                    }
                    .scrollIndicators(.hidden)
                }

                VStack(spacing: 12) {
                    HStack {
                        Text("외로움 토픽")
                            .font(.onePerson(.body1))
                            .foregroundStyle(.white)

                        Spacer()

                        Text("더보기")
                            .font(.onePerson(.caption))
                            .foregroundStyle(.blue500)
                    }

                    ScrollView(.horizontal) {
                        LazyHStack(spacing: 12) {
                            bigCard(
                                card: heartWorry(),
                                title: "외로울 때 도움이 되는 방법",
                                subTitle: "외로움",
                                description: "외로울 땐 이렇게 해보세요.",
                                detail: "토픽 자세히 보기"
                            )

                            bigCard(
                                card: heartWorry(),
                                title: "외로울 때 도움이 되는 방법",
                                subTitle: "외로움",
                                description: "외로울 땐 이렇게 해보세요.",
                                detail: "토픽 자세히 보기"
                            )

                            bigCard(
                                card: heartWorry(),
                                title: "외로울 때 도움이 되는 방법",
                                subTitle: "외로움",
                                description: "외로울 땐 이렇게 해보세요.",
                                detail: "토픽 자세히 보기"
                            )
                        }
                    }
                    .scrollIndicators(.hidden)
                }

                VStack(spacing: 12) {
                    HStack {
                        Text("나의 일기")
                            .font(.onePerson(.body1))
                            .foregroundStyle(.white)

                        Spacer()

                        Text("더보기")
                            .font(.onePerson(.caption))
                            .foregroundStyle(.blue500)
                    }

                    ScrollView(.horizontal) {
                        LazyHStack(spacing: 12) {
                            bigCard(
                                card: heartWorry(),
                                title: "외로울 땐 어떻게 해?",
                                subTitle: "2024.01.06",
                                description: "이주영님은 외로움이라는 주제로 저와 \n이야기를 나누셨네요.",
                                detail: "그 날 나의 일기 더보기"
                            )

                            bigCard(
                                card: heartWorry(),
                                title: "오늘 너무 무서웠어요",
                                subTitle: "두려움",
                                description: "이주영님은 심리적 두려움이라는 주제로 저와 \n이야기를 나누셨네요.",
                                detail: "그 날 나의 일기 더보기"
                            )

                            bigCard(
                                card: heartWorry(),
                                title: "오늘 너무 무서웠어요",
                                subTitle: "두려움",
                                description: "이주영님은 심리적 두려움이라는 주제로 저와 \n이야기를 나누셨네요.",
                                detail: "그 날 나의 일기 더보기"
                            )
                        }
                    }
                    .scrollIndicators(.hidden)
                }

                Spacer()
                    .frame(height: 80)
            }
            .padding(.horizontal, 20)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background {
            Color.gray900
                .ignoresSafeArea()
        }
    }

    func heartWorry() -> some View {
        Image(.heart)
            .frame(width: 53, height: 53)
            .background {
                RoundedRectangle(cornerRadius: 16)
                    .fill(.red800)
            }
    }

    func waterWorry() -> some View {
        Image(.water)
            .frame(width: 53, height: 53)
            .background {
                RoundedRectangle(cornerRadius: 16)
                    .fill(.blue800)
            }
    }

    func plasterWorry() -> some View {
        Image(.plaster)
            .frame(width: 53, height: 53)
            .background {
                RoundedRectangle(cornerRadius: 16)
                    .fill(.orange800)
            }
    }

    @ViewBuilder
    func worryCard(
        image: Image,
        backgroundColor: Color,
        title: String
    ) -> some View {
        VStack(spacing: 8) {
            image
                .frame(width: 53, height: 53)
                .background {
                    RoundedRectangle(cornerRadius: 16)
                        .fill(backgroundColor)
                }
                .buttonWrapper {
                    withAnimation {
                        selectedWorry = title
                    }
                }

            Text(title)
                .font(.onePerson(.body4))
                .foregroundStyle(selectedWorry == title ? .white : .gray600)
        }
    }

    @ViewBuilder
    func wordCard(
        text: String,
        color: Color
    ) -> some View {
        Text(text)
            .font(.custom("EliceDXNeolliOTF-Bd", size: 14))
            .foregroundStyle(.white)
            .frame(width: 282, alignment: .leading)
            .padding(.horizontal, 20)
            .padding(.vertical, 24)
            .background {
                RoundedRectangle(cornerRadius: 16)
                    .fill(color)
            }
    }

    @ViewBuilder
    func bigCard(
        card: some View,
        title: String,
        subTitle: String,
        description: String,
        detail: String,
        onTap: @escaping () -> Void = {}
    ) -> some View {
        VStack(spacing: 12) {
            HStack(spacing: 12) {
                card

                VStack(alignment: .leading, spacing: 8) {
                    Text(title)
                        .font(.onePerson(.body1))
                        .foregroundStyle(.white)

                    Text(subTitle)
                        .font(.onePerson(.body4))
                        .foregroundStyle(.gray600)
                }
            }

            Text(description)
                .font(.onePerson(.body4))
                .foregroundStyle(.gray600)

            Divider()
                .frame(height: 1)
                .foregroundStyle(.gray700)

            HStack(spacing: 8) {
                Text(detail)
                    .font(.onePerson(.body4))
                    .foregroundStyle(Color.blue500)

                Image(systemName: "chevron.right")
                    .resizable()
                    .frame(width: 8, height: 12)
                    .foregroundStyle(Color.blue500)
            }
            .buttonWrapper {
                guard let url = URL(string: "https://www.youtube.com/watch?v=iJyac4AXKKY") else { return }
                openURL(url)
            }
        }
        .padding(18)
        .background {
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.gray800)
        }
    }
}

#Preview {
    MindView()
}
