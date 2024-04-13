import SwiftUI

struct ProfileView: View {
    private let token: String?
    @StateObject private var profileVM: ProfileViewModel
    @State private var tab: String = "like"
    
    init(token: String?) {
        self._profileVM = StateObject(wrappedValue: ProfileViewModel(token: token))
        self.token = token
        
    }
    
    var body: some View {
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
                FavoritesView(token: token)
            } else {
                VisitView(token: token)
            }

        }.frame(maxWidth: .infinity)
        
    }
}
