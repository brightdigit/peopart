import Foundation

struct UserEmbeddedViewModel : Identifiable, Hashable {
  static func == (lhs: UserEmbeddedViewModel, rhs: UserEmbeddedViewModel) -> Bool {
    lhs.id == rhs.id
  }
  
  let object : UserEmbeddedProtocol
  
  var id: UUID {
    object.user.id
  }
  
  func hash(into hasher: inout Hasher) {
    self.id.hash(into: &hasher)
  }
}
