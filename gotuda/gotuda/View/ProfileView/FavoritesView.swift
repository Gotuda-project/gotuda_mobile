import SwiftUI

struct FavoritesView: View {
    @EnvironmentObject var store: AppStore
    private let token: String?
    @StateObject private var favoritesVM: FavoritesListViewModel
    
    init(token: String?) {
        self._favoritesVM = StateObject(wrappedValue: FavoritesListViewModel(token: token))
        self.token = token
        
    }
    
    var body: some View {
        if favoritesVM.liked.isEmpty {
            Spacer()
            Text("Пока нет избранных мероприятий").multilineTextAlignment(.center)
        }
        List(favoritesVM.liked, id:\.self.id) { event in
            if store.state.removeLikeEvent.contains(event.id) {
            } else {
                ZStack {
                    EventView(event: event, isLiked: true).frame(maxWidth: .infinity)
                    NavigationLink(destination: EmptyView()) {
                        EmptyView()
                    }.opacity(0)
                }
            }
        }.listSectionSpacing(5).onAppear {
            favoritesVM.getLikes(token: token)
        }
    }
}
