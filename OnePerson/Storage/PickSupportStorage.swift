import Combine

final class PickSupportStorage: ObservableObject {
    @Published var pickedSupport = [SupportEntity]()
}
