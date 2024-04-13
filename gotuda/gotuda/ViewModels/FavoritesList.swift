import SwiftUI

@MainActor
class FavoritesListViewModel: ObservableObject {
    
    @Published var liked: [EventModel] = []
    
    init(token: String?) {
        self.liked = []
        self.getLikes(token: token)
    }
    
    func getLikes(token: String?) {
        guard let token else {return}
        LikesService.shared.getLikes(token: token) { liked in
            self.liked = EventsMapper.map(events: liked)
        }
    }
}
