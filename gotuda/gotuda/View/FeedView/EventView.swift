import SwiftUI

struct EventModel {
    let title: String
    let user: String
    let date: String
    let vibes: String
    let userImage: UIImage?
    let eventImage: UIImage?
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
                    Image(uiImage: event.eventImage ?? UIImage())
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                    Image(uiImage: event.userImage ?? UIImage()).resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
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
                }
                Button {
                    print("like")
                    isLiked.toggle()
                } label: {
                    isLiked
                    ? Image(systemName: "heart.fill")
                        .resizable()
                        .frame(width: 20.0, height: 18.0)
                        .foregroundColor(.pink)
                    : Image(systemName: "heart")
                        .resizable()
                        .frame(width: 20.0, height: 18.0)
                        .foregroundColor(.black)
                }
            }
            HStack {
                HStack(spacing: 0) {
                    Image(systemName: "mappin")
                    Text(event.address)
                        .font(.montserrat(.regular, size: 10))
                        .frame(maxWidth: 180)
                }
                Button {
                    print("Tap")
                } label: {
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
                }
            }
        }
    }
}

#Preview {
    EventView(event: EventModel(
        title: "Прогулка по Москве и бар",
        user: "Иван Петров",
        date: "05.08.2024 15:30",
        vibes: "#веселое #культурное",
        userImage: UIImage(named: "profileTabInactive"),
        eventImage:  UIImage(named: "createEventActive"),
        address: "г. Москва, Большая Спасская улица, 8",
        categories: ["прогулка", "бар"]
    )
    )
}
