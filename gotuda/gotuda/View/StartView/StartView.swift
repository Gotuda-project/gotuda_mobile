import SwiftUI

struct StartView: View {
    @EnvironmentObject var store: AppStore
    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                Image("MainLogo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .edgesIgnoringSafeArea(.top)
                    .padding([.trailing, .leading], 20)
                Text("Найди встречи, найти друзей")
                    .font(.montserrat(.bold, size: 32))
                    .padding([.trailing, .leading], 37)
                    .padding([.bottom], 104)
                    .padding([.top], 34)
                    .frame(maxWidth: .infinity, alignment: .leading)
                VStack(spacing: 15, content: {

                    NavigationLink(destination: LoginView()) {
                        NavigationButton(title: "Войти")
                    }
                    
                    NavigationLink(destination: RegistrationView()) {
                        NavigationButton(title: "Зарегистрироваться", backgroundColor: Color.white, foregroundColor: Color.black)
                    }.onAppear {
                        // Apply the extension to remove back button text
                        UINavigationBar.appearance().topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
                    }
                    
                })
                
            }.frame(maxHeight: .infinity, alignment: .topLeading)
                .padding([.top], 30)
        }
        
    }
}

#Preview {
    StartView()
}
