import SwiftUI


struct FeedView: View {
    @EnvironmentObject var store: AppStore
    private let token: String?
    @StateObject private var eventListVM: EventListViewModel
    @State private var searchText: String = ""
    
    init(token: String?) {
        self._eventListVM = StateObject(wrappedValue: EventListViewModel(token: token))
        self.token = token
    }
    
    var body: some View {
        NavigationView {
            List(eventListVM.events, id:\.self.id) { event in
                if store.state.likedEvents.contains(event.id) {
                    if store.state.visitEvents.contains(event.id)  {
                        EventView(event: event, isLiked: true, isVisited: true).frame(maxWidth: .infinity)
                    } else if store.state.notVisitEvents.contains(event.id) {
                        EventView(event: event, isLiked: true, isVisited: false ).frame(maxWidth: .infinity)
                    } else {
                        EventView(event: event, isLiked: true).frame(maxWidth: .infinity)
                    }
                    
                } else if store.state.removeLikeEvent.contains(event.id){
                    if store.state.visitEvents.contains(event.id)  {
                        EventView(event: event, isLiked: false, isVisited: true).frame(maxWidth: .infinity)
                    } else if store.state.notVisitEvents.contains(event.id) {
                        EventView(event: event, isLiked: false, isVisited: false ).frame(maxWidth: .infinity)
                    } else {
                        EventView(event: event, isLiked: false).frame(maxWidth: .infinity)
                    }
                } else {
                    if store.state.visitEvents.contains(event.id)  {
                        EventView(event: event, isVisited: true).frame(maxWidth: .infinity)
                    } else if store.state.notVisitEvents.contains(event.id) {
                        EventView(event: event, isVisited: false ).frame(maxWidth: .infinity)
                    } else {
                        EventView(event: event).frame(maxWidth: .infinity)
                    }
                }
                
            }.listSectionSpacing(5)
                .searchable(text: $searchText)
                .onChange(of: searchText) { oldValue, newValue in
                    eventListVM.search(token: token, searchText: newValue)
                }
                .refreshable {
                    eventListVM.search(token: token, searchText: "")
                }
        }
    }
}

extension FeedView {
    func buildView(likedEvents: Set<Int>, removeLikeEvent: Set<Int>, visitEvents: Set<Int>, notVisitEvents: Set<Int>, event: EventModel) -> AnyView {
        var isLiked: Bool = event.isLiked
        if likedEvents.contains(event.id) {
            isLiked = true
        }
        if removeLikeEvent.contains(event.id) {
            isLiked = false
        }
        var isVisited: Bool = event.isVisited
        if visitEvents.contains(event.id) {
            isVisited = true
        }
        if notVisitEvents.contains(event.id) {
            isVisited = false
        }
    
        return AnyView(EventView(event: event, isLiked: isLiked, isVisited: isVisited).frame(maxWidth: .infinity))
    }
}
