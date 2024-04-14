import ReSwift

enum EventAction: Action {
    case successCreate
    case returnToCreate
    case likeEvent(eventId: Int)
    case deleteLike(eventId: Int)
    case visitEvent(eventId: Int)
    case notVisitEvent(eventId: Int)
}
