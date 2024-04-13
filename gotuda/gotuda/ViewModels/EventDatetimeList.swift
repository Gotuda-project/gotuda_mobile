import SwiftUI

@MainActor
class EventDatetimeListViewModel: ObservableObject {
    
    @Published var visit: [EventModel] = []
    
    init(token: String?) {
        self.visit = []
        self.getVisit(token: token)
    }
    
    func getVisit(token: String?) {
        guard let token else {return}
        EventDatetimeService.shared.getVisit(token: token) { liked in
            self.visit = EventsMapper.map(events: liked)
        }
    }
}
