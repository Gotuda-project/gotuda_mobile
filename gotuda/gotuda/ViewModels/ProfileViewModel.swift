import SwiftUI

@MainActor
class ProfileViewModel: ObservableObject {
    
    @Published var user: ProfileHeaderModel?
    
    init(token: String?) {
        self.getMe(token: token)
    }
    
    func getMe(token: String?) {
        guard let token else {return}
        UserService.shared.getMe(token: token) { [weak self] userResponse in
            if let userResponse {
                self?.user = ProfileMapper.mapUser(userResponse: userResponse)
            }
            
        }
    }
}

class ProfileMapper {
    static func mapUser(userResponse: UserResponse) -> ProfileHeaderModel {
        ProfileHeaderModel(
            image: URL(string: userResponse.avatar?.urlToImage ?? ""),
            firstName: userResponse.firstName ?? "",
            lastName: userResponse.lastName ?? "",
            phone: userResponse.phoneNumber ?? "",
            email: userResponse.email
        )
    }
}
