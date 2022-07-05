import Foundation

struct PostEmbeddedViewModel : Identifiable, Hashable {
    static func == (lhs: PostEmbeddedViewModel, rhs: PostEmbeddedViewModel) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        self.id.hash(into: &hasher)
    }
    
  let object : PostEmbeddedProtocol
  
  var id: UUID {
    object.post.id
  }
}
