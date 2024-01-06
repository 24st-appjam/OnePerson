import SwiftUI

@main
struct OnePersonApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @StateObject var pickSupportStorage = PickSupportStorage()

    var body: some Scene {
        WindowGroup {
            OPTabView()
                .environmentObject(pickSupportStorage)
        }
    }
}
