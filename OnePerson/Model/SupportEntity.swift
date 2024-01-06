import Foundation

struct SupportEntity: Equatable, Hashable, Identifiable {
    let id: UUID = UUID()
    let title: String
    let benefit: String
    let category: String
}

let supportList: [SupportEntity] = [
    SupportEntity(
        title: "1인가구 대학생 취업 지원",
        benefit: "취업처 알선, 컨설팅 지원",
        category: "일자리"
    ),
    SupportEntity(
        title: "장애학생 취업 지원",
        benefit: "취업처 알선, 채용 정보 공유",
        category: "일자리"
    ),
    SupportEntity(
        title: "소외계층 청소년을 위한 자립 생활 지원",
        benefit: "주거 공간 제공",
        category: "주거"
    ),
    SupportEntity(
        title: "공공분야주택 입주 지원",
        benefit: "주거 공간 제공",
        category: "주거"
    ),
    SupportEntity(
        title: "1인가구 대학생 입주 지원",
        benefit: "주거 공간 제공",
        category: "주거"
    ),
    SupportEntity(
        title: "장애학생 교육 지원",
        benefit: "매주 10시간 이상 교육 제공",
        category: "교육"
    ),
    SupportEntity(
        title: "1인가구 대학생 온라인 교육 지원",
        benefit: "300개 이상의 온라인 강의 무료 제공",
        category: "교육"
    ),
]
