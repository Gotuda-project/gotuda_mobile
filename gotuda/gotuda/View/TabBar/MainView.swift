import SwiftUI


enum TabType: Int {
    case createEvent
    case main
    case profile
}

struct MainView: View {
    @State private var selectedTab: TabType = .main

    var body: some View {
        TabView(selection: $selectedTab) {
            Text("CreateEvent").tabItem {
                Image(selectedTab == .createEvent ? "createEventActive" : "createEventInactive")
            }.tag(TabType.createEvent)
            
            Text("Main").tabItem {
                Image(selectedTab == .main ? "mainTabActive" : "mainTabInactive")
            }.tag(TabType.main)
            
            Text("Profile").tabItem {
                Image(selectedTab == .profile ? "profileTabActive" : "profileTabInactive")
            }.tag(TabType.profile)
        }
    }
}

#Preview {
    MainView()
}
