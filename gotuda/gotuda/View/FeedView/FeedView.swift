import SwiftUI


struct FeedView: View {
    private let token: String?
    @StateObject private var eventListVM: EventListViewModel
    
    init(token: String?) {
        self._eventListVM = StateObject(wrappedValue: EventListViewModel(token: token))
        self.token = token
        
    }
    
    var body: some View {
        NavigationView {
            List(eventListVM.events, id:\.id) { event in
                EventView(event: event).frame(maxWidth: .infinity)
            }.listSectionSpacing(5)
        }
    }
}
