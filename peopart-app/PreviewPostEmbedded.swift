import Foundation


struct PreviewPostEmbedded : PostEmbeddedProtocol, PostProtocol, UserProtocol {
  let userId: UUID
  
  let id: UUID
  
  let image: URL
  
  let text: String
  
  let date: Date
  
  let name: String
  
  let avatar: URL
  
  let badge: String
  
  var post: PostProtocol {
    self
  }
  
  var author: UserProtocol {
    self
  }
  
  var comments: [CommentProtocol]
  
  
}
