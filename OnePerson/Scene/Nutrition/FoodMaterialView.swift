//import SwiftUI
//
//struct FoodMaterialView: View {
//    let shopList = [
//        ShopEntity(
//            name: "오아시스마켓",
//            imageURL: "https://img.etoday.co.kr/pto_db/2022/04/600/20220426101600_1744565_1200_900.jpg",
//            location: "서울특별시 양천구 목동동로 309 (목동) 1층",
//            distance: 132
//        ),
//        ShopEntity(
//            name: "초록마을",
//            imageURL: "https://m.choroc.com/resources/images/sub/@place_img.png",
//            location: "서울 광진구 뚝섬로 522 삼희빌딩",
//            tag:
//        )
//    ]
//    var body: some View {
//        VStack(spacing: 16) {
//            VStack(alignment: .leading, spacing: 8) {
//                Text("근처에 있는 건강한 식자재")
//                    .font(.onePerson(.h3))
//                    .foregroundStyle(.gray900)
//
//                Text("식자재 구매하고 건강과 마일리지 둘 다 얻자!")
//                    .font(.onePerson(.body4))
//                    .foregroundStyle(.gray400)
//            }
//            .frame(maxWidth: .infinity, alignment: .leading)
//
//            LazyVStack(spacing: 8) {
//                ForEach(shopList, id: \.self) { shop in
//                    shopRow(shop: shop)
//                }
//            }
//
//            Spacer()
//        }
//        .padding(.horizontal, 20)
//        .toolbar {
//            ToolbarItem(placement: .topBarLeading) {
//                NavigationTitleText(text: "매장추천")
//            }
//        }
//    }
//
//    @ViewBuilder
//    func shopRow(shop: ShopEntity) -> some View {
//        HStack(spacing: 12) {
//            AsyncImage(url: URL(string: shop.imageURL)) { phase in
//                switch phase {
//                case let .success(image):
//                    image
//                        .resizable()
//
//                case .failure, .empty:
//                    Color.gray200
//                @unknown default:
//                    EmptyView()
//                }
//            }
//            .frame(width: 44, height: 44)
//            .clipShape(RoundedRectangle(cornerRadius: 8))
//
//            VStack(alignment: .leading, spacing: 8) {
//                HStack {
//                    Text(shop.name)
//                        .font(.onePerson(.body1))
//                        .foregroundColor(.gray900)
//
//                    Spacer()
//
//                    Text("\(shop.distance)m")
//                        .font(.onePerson(.caption))
//                        .foregroundColor(.gray300)
//                }
//
//                Text(shop.location)
//                    .font(.onePerson(.body4))
//                    .foregroundColor(.gray300)
//                
//            }
//        }
//        .padding(.horizontal, 20)
//        .padding(.vertical, 24)
//        .background {
//            RoundedRectangle(cornerRadius: 16)
//                .fill(Color.gray50)
//        }
//    }
//}
//
//#Preview {
//    FoodMaterialView()
//}
