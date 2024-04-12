import SwiftUI


enum TabType: Int {
    case createEvent
    case main
    case profile
}

struct MainView: View {
    @EnvironmentObject var store: AppStore
    @State private var selectedTab: TabType = .main

    var body: some View {
        TabView(selection: $selectedTab) {
            MainCreateEventView().tabItem {
                Image(selectedTab == .createEvent ? "createEventActive" : "createEventInactive")
            }.tag(TabType.createEvent)
            
            FeedView(token: store.state.token).tabItem {
                Image(selectedTab == .main ? "mainTabActive" : "mainTabInactive")
            }.tag(TabType.main)
            
            Text("Profile").tabItem {
                Image(selectedTab == .profile ? "profileTabActive" : "profileTabInactive")
            }.tag(TabType.profile)
        }.safeAreaPadding()
    }
}
