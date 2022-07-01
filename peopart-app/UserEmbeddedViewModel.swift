import Foundation

struct UserEmbeddedViewModel : Identifiable {
  let object : UserEmbeddedProtocol
  
  var id: UUID {
    object.user.id
  }
}
