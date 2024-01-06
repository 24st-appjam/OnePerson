import Foundation

struct ShopEntity: Equatable, Hashable {
    let name: String
    let imageURL: String
    let location: String
    let tag: [String]
    let link: String
}

let shopList = [
    ShopEntity(
        name: "오아시스마켓",
        imageURL: "https://img.etoday.co.kr/pto_db/2022/04/600/20220426101600_1744565_1200_900.jpg",
        location: "서울특별시 양천구 목동동로 309 (목동) 1층",
        tag: ["식자재", "그린푸드"],
        link: "https://naver.me/FaZhpltZ"
    ),
    ShopEntity(
        name: "초록마을",
        imageURL: "https://m.choroc.com/resources/images/sub/@place_img.png",
        location: "서울 광진구 뚝섬로 522 삼희빌딩",
        tag: ["식자재", "그린푸드"],
        link: "https://naver.me/xecKuCGo"
    )
]
