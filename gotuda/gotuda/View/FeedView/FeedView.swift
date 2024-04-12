import SwiftUI


struct FeedView: View {
    private let token: String?
    @StateObject private var eventListVM: EventListViewModel
    @State private var searchText: String = ""
    
    init(token: String?) {
        self._eventListVM = StateObject(wrappedValue: EventListViewModel(token: token))
        self.token = token
        
    }
    
    var body: some View {
        NavigationView {
            List(eventListVM.events, id:\.id) { event in
                ZStack {
                    EventView(event: event).frame(maxWidth: .infinity)
                    NavigationLink(destination: EmptyView()) {
                                    EmptyView()
                    }.opacity(0)
                }
                
            }.listSectionSpacing(5)
                .searchable(text: $searchText)
                .onChange(of: searchText) { oldValue, newValue in
                    eventListVM.search(token: token, searchText: newValue)
                }
        }
    }
}
