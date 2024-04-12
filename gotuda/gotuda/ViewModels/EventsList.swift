import SwiftUI

@MainActor
class EventListViewModel: ObservableObject {
    
    @Published var events: [EventModel] = []
    
    init(token: String?) {
        self.events = []
        self.search(token: token, searchText: "")
    }
    
    func search(token: String?, searchText: String) {
        guard let token else {return}
        EventService.shared.getEvents(token: token, searchText: searchText) { events in
            self.events = EventsMapper.map(events: events)
        }
    }
}

class EventsMapper {
    static func map(events: [Event]) -> [EventModel] {
        events.map { event in
            EventModel(
                id: event.id ?? 0,
                title: event.title ?? "",
                user: String(event.userId ?? 0),
                date: event.eventDatetime?.datetime ?? "",
                vibes: mapVibes(vibes: event.vibes),
                userImage: nil,
                eventImage: URL(string: event.images?.urlToImages?[0].urlToImage ?? ""),
                address: mapAddress(address: event.address),
                categories: event.categories ?? []
            )
        }
    }
    
    private static func mapVibes(vibes: [String]?) -> String {
        guard let vibes else { return ""}
        return vibes.map { vibe in
            "#" + vibe
        }.joined(separator: " ")
    }
    
    private static func mapAddress(address: Address?) -> String {
        guard let address else { return ""}
        return (address.city ?? "") + " " + (address.address ?? "")
    }
}
