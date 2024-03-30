import ReSwift
import Foundation

final class AppStore: StoreSubscriber, DispatchingStoreType, ObservableObject {

  private let store: Store<AppState>
  public var dispatchFunction: DispatchFunction {
    return store.dispatchFunction
  }
//  public var notification: NotificationCenterService

  @Published fileprivate(set) var state: AppState

  init(_ store: Store<AppState> = makeStore, notification: NotificationCenter = .default) {
    self.store = store
    self.state = store.state
//    self.notification = NotificationCenterService(center: notification,
//                                                  dispatch: self.store.dispatchFunction)

    store.subscribe(self)
  }

  deinit {
    store.unsubscribe(self)
  }

  func newState(state: AppState) {
    DispatchQueue.main.async {
      self.state = state
    }
  }

  func dispatch(_ action: Action) {
    DispatchQueue.main.async { [weak self] in
      self?.store.dispatch(action)
    }
  }

  static var makeStore: Store<AppState> {
    return Store(
      reducer: mainReducer,
      state: AppState(),
      middleware: [thunksMiddleware]
    )
  }
}
