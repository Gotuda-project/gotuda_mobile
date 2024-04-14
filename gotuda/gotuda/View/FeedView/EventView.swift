import SwiftUI
import SwiftUI_Shimmer

struct EventModel {
    let id: Int
    let title: String
    let user: String
    let date: String
    let vibes: String
    let userImage: URL?
    let eventImage: URL?
    let address: String
    let categories: [String]
    var isLiked: Bool
    let isVisited: Bool
}

struct EventView: View {
    @EnvironmentObject var store: AppStore
    private let event: EventModel
    private let isLiked: Bool
    private let isVisited: Bool
    
    
    init(event: EventModel, isLiked: Bool? = nil, isVisited: Bool? = nil) {
        self.event = event
        self.isLiked = isLiked ?? event.isLiked
        self.isVisited = isVisited ?? event.isVisited
    }
    var body: some View {
            VStack {
                HStack(alignment: .top) {
                    ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom)) {
                        AsyncImage(url: event.eventImage) { image in
                            image.resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100, height: 100)
                                .clipShape(Circle())
                        } placeholder: {
                            Color.linearGradient1
                                .frame(width: 100, height: 100)
                                .clipShape(Circle()).shimmering()
                        }
                       
                        AsyncImage(url: event.userImage) { image in
                            image.resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 50, height: 50)
                                .clipShape(Circle())
                        } placeholder: {
                            Color.linearGradient2.frame(width: 50, height: 50)
                                .clipShape(Circle()).shimmering()
                        }
                    }
                    VStack(alignment: .leading) {
                        Text(event.title)
                            .font(.montserrat(.bold, size: 14))
                        HStack {
                            Image(systemName: "person")
                                .foregroundColor(.gray)
                            Text(event.user)
                                .font(.montserrat(.regular, size: 10))
                                .foregroundColor(.gray)
                        }
                        
                        HStack {
                            Image(systemName: "calendar")
                                .foregroundColor(.gray)
                            Text(event.date)
                                .font(.montserrat(.regular, size: 10))
                                .foregroundColor(.gray)
                        }
                        
                        Text(event.vibes)
                            .font(.montserrat(.regular, size: 10))
                            .foregroundColor(.pink)
                        HStack {
                            ForEach(event.categories, id: \.self) { category in
                                Text(category)
                                    .padding([.top, .bottom], 4)
                                    .padding([.leading, .trailing], 10)
                                    .font(.montserrat(.regular, size: 10))
                                    .background(Color.lightGray)
                                    .cornerRadius(50)
                            }
                        }
                    }.frame(maxWidth: .infinity)
                        
                    LikeView(
                        isLiked: isLiked,
                        id: event.id
                    )
                }.frame(maxWidth: .infinity)
                ZStack {
                    HStack(spacing: 0) {
                        Image("pin")
                        Text(event.address)
                            .font(.montserrat(.regular, size: 10))
                        Spacer()
                        Spacer()
                    }
                    
                    HStack {
                        Spacer()
                        VisitView(isVisit: isVisited, id: event.id)
                    }
                    
                }.frame(maxWidth: .infinity)
            }
    }
    
}

struct LikeView: View {
    @State var isLiked: Bool
    @EnvironmentObject var store: AppStore
    private let id: Int
    
    init(isLiked: Bool, id: Int) {
        self.isLiked = isLiked
        self.id = id
    }
    
    var body: some View {
        Image(systemName: isLiked ? "heart.fill" : "heart")
            .resizable()
            .frame(width: 20.0, height: 18.0)
            .foregroundColor(isLiked ? .pink : .black).onTapGesture {
                if !isLiked {
                    LikesService.shared.setLike(eventId: id, token: store.state.token) { error in
                        if error == nil {
                            isLiked.toggle()
                            store.dispatch(EventAction.likeEvent(eventId: id))
                        }
                    }
                } else {
                    LikesService.shared.deleteLike(eventId: id, token: store.state.token) { error in
                        if error == nil {
                            isLiked.toggle()
                            store.dispatch(EventAction.deleteLike(eventId: id))
                        }
                    }
                }
            }
    }
}

struct VisitView: View {
    @State var isVisit: Bool
    @EnvironmentObject var store: AppStore
    private let id: Int
    
    init(isVisit: Bool, id: Int) {
        self.isVisit = isVisit
        self.id = id
    }
    
    var body: some View {
        if isVisit {
            isVisitView(isVisit: $isVisit, id: id)
        } else {
            NotVisitView(isVisit: $isVisit, id: id)
        }
    }
}

struct isVisitView: View {
    @Binding var isVisit: Bool
    @EnvironmentObject var store: AppStore
    private let id: Int
    
    init(isVisit: Binding<Bool>, id: Int) {
        self._isVisit = isVisit
        self.id = id
    }
    var body: some View {
        Text("Записан").font(.montserrat(.regular, size: 14)).padding([.top, .bottom], 13.5).padding([.leading, .trailing], 20).overlay( RoundedRectangle(cornerRadius: 25)
                               .stroke(LinearGradient(
                                   gradient: Gradient(
                                       colors:  [.linearGradient1, .linearGradient2]),
                                   startPoint: .leading,
                                   endPoint: .trailing
                               ), lineWidth: 5)
                     ).background(.white
           ).onTapGesture {
                         EventDatetimeService.shared.nonVisitEvent(eventdId: id, token: store.state.token) { error in
                             if error ==  nil {
                                 isVisit.toggle()
                                 store.dispatch(EventAction.notVisitEvent(eventId: id))
                             }
                         }
           }.foregroundColor(.black).cornerRadius(50)
    }
}

struct NotVisitView: View {
    @Binding var isVisit: Bool
    @EnvironmentObject var store: AppStore
    private let id: Int
    
    init(isVisit: Binding<Bool>, id: Int) {
        self._isVisit = isVisit
        self.id = id
    }
    var body: some View {
        Text("Хочу пойти")
            .font(.montserrat(.regular, size: 14))
            .padding([.top, .bottom], 13.5)
            .padding([.leading, .trailing], 20)
            .background(
                LinearGradient(
                    gradient: Gradient(
                        colors:  [.linearGradient1, .linearGradient2]),
                    startPoint: .leading,
                    endPoint: .trailing
                )
            )
            .foregroundColor(.white)
            .cornerRadius(50)
            .onTapGesture {
                EventDatetimeService.shared.visitEvent(eventdId: id, token: store.state.token) { error in
                    if error ==  nil {
                        isVisit.toggle()
                        store.dispatch(EventAction.visitEvent(eventId: id))
                    }
                }
            }
    }
}


#Preview {
    EventView(event: EventModel(
        id: 5, title: "Прогулка по Москве и бар",
        user: "Иван Петров",
        date: "05.08.2024 15:30",
        vibes: "#веселое #культурное",
        userImage: URL(string: "https://vip-1gl.ru/vipberrrt/10423beautiful_scenery_wallpaper.jpg"),
        eventImage:  URL(string: "https://vip-1gl.ru/vipberrrt/10423beautiful_scenery_wallpaper.jpg"),
        address: "г. Москва, Большая Спасская улица, 8sdfsdfsdfdsfsdfsdfdsfsfsdfsfsdf",
        categories: ["прогулка", "бар"],
        isLiked: false,
        isVisited: false
    )
    )
}
