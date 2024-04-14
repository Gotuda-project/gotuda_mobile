import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var store: AppStore
    private let token: String?
    @StateObject private var profileVM: ProfileViewModel
    @State private var tab: String = "like"
    
    init(token: String?) {
        self._profileVM = StateObject(wrappedValue: ProfileViewModel(token: token))
        self.token = token
        
    }
    
    var body: some View {
        GeometryReader { g in
            ScrollView {
                ProfileViewHeader(profile: profileVM.user).frame(maxWidth: .infinity).padding()
                Spacer()
                Picker(selection: $tab) {
                    Text("Избранное").tag("like")
                    Text("Уже записан").tag("visit")
                } label: {
                    Text("Picker")
                }.pickerStyle(SegmentedPickerStyle())
                Spacer()
                if tab == "like" {
                    FavoritesView(token: token).frame(width: g.size.width - 5, height: g.size.height - 10, alignment: .center)
                } else {
                    VisitsView(token: token).frame(width: g.size.width - 5, height: g.size.height - 10, alignment: .center)
                }

            }.frame(maxWidth: .infinity).refreshable {
                
            }
        }
        
        
    }
}
