//import SwiftUI
//
//struct NutritionView: View {
//    enum Tab: Int, CaseIterable {
//        case mealManage
//        case material
//    }
//    @State var currentTab = Tab.mealManage
//    @Namespace var tabAnimation
//    let items = ["식사 관리", "식자재 관리"]
//
//    var body: some View {
//        VStack(spacing: 12) {
//            tabbar()
//                .animation(.easeInOut, value: currentTab)
//
//            TabView(selection: $currentTab) {
//                MealManageView()
//                    .tag(Tab.mealManage)
//
//                FoodMaterialView()
//                    .tag(Tab.material)
//            }
//            .tabViewStyle(.page(indexDisplayMode: .never))
//        }
//    }
//
//    @ViewBuilder
//    func tabbar() -> some View {
//        HStack(spacing: 0) {
//            ForEach(Tab.allCases, id: \.self) { tab in
//                VStack(spacing: 12) {
//                    Text(items[tab.rawValue])
//                        .font(.onePerson(.body3))
//                        .foregroundStyle(.blue500)
//
//                    if currentTab == tab {
//                        RoundedRectangle(cornerRadius: 17)
//                            .fill(Color.blue500)
//                            .frame(height: 1)
//                            .matchedGeometryEffect(id: "TAB", in: tabAnimation, properties: .position)
//                    } else {
//                        Color.clear
//                            .frame(height: 1)
//                    }
//                }
//                .background {
//                    Color.white
//                }
//                .onTapGesture {
//                    withAnimation {
//                        currentTab = tab
//                    }
//                }
//            }
//        }
//    }
//}
//
//#Preview {
//    NutritionView()
//}
