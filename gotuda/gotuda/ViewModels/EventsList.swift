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
        objectWillChange.send()
    }
}

class EventsMapper {
    static func map(events: [Event]) -> [EventModel] {
        return events.map { event in
            EventModel(
                id: event.id ?? 0,
                title: event.title ?? "",
                user: mapAuthor(author: event.author),
                date: mapDate(date: event.eventDatetime?.datetime),
                vibes: mapVibes(vibes: event.vibes),
                userImage: URL(string: event.author?.avatar?.urlToImage ?? ""),
                eventImage: URL(string: event.images?.urlToImages?[0].urlToImage ?? ""),
                address: mapAddress(address: event.address),
                categories: event.categories ?? [],
                isLiked: event.isLiked ?? false,
                isVisited: event.isVisited ?? false
            )
        }
    }
    
    private static func mapDate(date: String?) -> String {
        guard let date  else { return ""}
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let dateDate = dateFormatter.date(from: date)
        guard let dateDate else { return "" }
        
        let anotherDateFormatter = DateFormatter()
        anotherDateFormatter.dateFormat = "dd.MM.yyyy hh:mm"
        return anotherDateFormatter.string(from: dateDate)
    }
    
    private static func mapAuthor(author: Author?) -> String {
        guard let author else { return "" }
        return (author.firstName ?? "") + " " + (author.lastName ?? "")
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
