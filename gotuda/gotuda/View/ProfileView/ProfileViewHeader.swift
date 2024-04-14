import SwiftUI
import iPhoneNumberField

struct ProfileHeaderModel {
    let image: URL?
    let firstName: String
    let lastName: String
    let phone: String
    let email: String?
}

struct ProfileViewHeader: View {
    private let profile: ProfileHeaderModel?
    
    init(profile: ProfileHeaderModel?) {
        self.profile = profile
    }
    
    var body: some View {
        return HStack(alignment: .top) {
            AsyncImage(url: profile?.image, content: { image in
                image.resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
            }) {
                Color.linearGradient1
                    .frame(width: 80, height: 80)
                    .clipShape(Circle()).shimmering()
            }.frame(width: 80, height: 80)
            VStack(alignment: .leading) {
                Text(profile?.lastName ?? "").font(.montserrat(.bold, size: 16))
                Text(profile?.firstName ?? "").font(.montserrat(.bold, size: 16))
                Text(profile?.phone ?? "").font(.montserrat(.regular, size: 14))
                if let email = profile?.email {
                    Text(email).font(.montserrat(.regular, size: 14))
                }
            }
            Spacer()
            Image(systemName: "ellipsis").padding([.top], 5).onTapGesture {
                print("tap")
            }
            
            
        }.frame(maxWidth: .infinity)
        
        
    }
}


#Preview {
    ProfileViewHeader(
        profile: ProfileHeaderModel(image: URL(string: "https://tripus.hb.bizmrg.com/b797d772-a797-449d-982a-7051752c5f4b.jpg"),
                                    firstName: "Иван", lastName: "Константинопольский", phone: "79287725751", email: nil)
    )
}
