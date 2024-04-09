import SwiftUI
import ReSwift
import Moya
import RxSwift
import ObjectMapper
import Moya_ObjectMapper


@main
struct gotudaApp: App {
    @StateObject var store = AppStore()
    var body: some Scene {
        WindowGroup {
            if store.state.token == nil {
                StartView().environmentObject(store)
            } else {
                MainView()
            }
            
        }
    }
}
