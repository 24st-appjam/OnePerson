import Foundation

enum MealTimeType: Equatable {
    case breakfast
    case lunch
    case dinner
}
struct Meal: Equatable {
    let timeType: MealTimeType
    let imageURL: String
}
