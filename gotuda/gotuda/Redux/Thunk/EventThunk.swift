import ReSwift
import ReSwiftThunk

func makeEvent(
    image: UIImage?, token: String?,
    request: CreateEventRequest) -> Thunk<AppState> {
    return Thunk<AppState> { dispatch, getState in
        guard let image, let token else { return }
        ImageService.shared.saveImage(image: image, token: token) { imageResponse in
            if let id = imageResponse?.idImage {
                let newRequest = CreateEventRequest(title: request.title, description: request.description, address: request.address, eventDatetime: request.eventDatetime, categories: request.categories, vibes: request.vibes,
                                                    images: Images(ids: [id], mainImageIndex: 0)
                )
                EventService.shared.createEvent(request: newRequest, token: token) {
                    dispatch(EventAction.successCreate)
                }
            }
            
        }
    }

}
