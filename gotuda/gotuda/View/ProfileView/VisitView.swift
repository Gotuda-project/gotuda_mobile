import SwiftUI

struct VisitsView: View {
    @EnvironmentObject var store: AppStore
    private let token: String?
    @StateObject private var visitVM: EventDatetimeListViewModel
    
    init(token: String?) {
        self._visitVM = StateObject(wrappedValue: EventDatetimeListViewModel(token: token))
        self.token = token
        
    }
    
    var body: some View {
        if visitVM.visit.isEmpty {
            Spacer()
            Text("Вы не записались на мероприятие").multilineTextAlignment(.center)
        }
        List(visitVM.visit, id:\.id) { event in
            if store.state.notVisitEvents.contains(event.id) {
            } else {
                ZStack {
                    EventView(event: event, isVisited: true).frame(maxWidth: .infinity)
                    NavigationLink(destination: EmptyView()) {
                        EmptyView()
                    }.opacity(0)
                }
            }
        }.listSectionSpacing(5).onAppear {
            visitVM.getVisit(token: token)
        }
    }
}
