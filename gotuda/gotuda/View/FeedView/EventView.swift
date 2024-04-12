import SwiftUI

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
}

struct EventView: View {
    private let event: EventModel
    
    @State var isLiked: Bool = false
    
    init(event: EventModel) {
        self.event = event
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
                                .clipShape(Circle())
                        }
                        
                        AsyncImage(url: event.userImage) { image in
                            image.resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 50, height: 50)
                                .clipShape(Circle())
                        } placeholder: {
                            Color.linearGradient2.frame(width: 50, height: 50)
                                .clipShape(Circle())
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
                    
                    Image(systemName: isLiked ? "heart.fill" : "heart")
                        .resizable()
                        .frame(width: 20.0, height: 18.0)
                        .foregroundColor(isLiked ? .pink : .black).onTapGesture {
                            print("like")
                            isLiked.toggle()
                        }
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
                                print("Tap")
                            }
                    }
                    
                }.frame(maxWidth: .infinity)
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
        categories: ["прогулка", "бар"]
    )
    )
}
