import SwiftUI

struct FavoritesView: View {
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
        List(favoritesVM.liked, id:\.id) { event in
            ZStack {
                EventView(event: event).frame(maxWidth: .infinity)
                NavigationLink(destination: EmptyView()) {
                    EmptyView()
                }.opacity(0)
            }
            
        }.listSectionSpacing(5)
    }
}
