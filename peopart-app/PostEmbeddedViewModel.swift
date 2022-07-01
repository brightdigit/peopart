import Foundation

struct PostEmbeddedViewModel : Identifiable {
  let object : PostEmbeddedProtocol
  
  var id: UUID {
    object.post.id
  }
}
