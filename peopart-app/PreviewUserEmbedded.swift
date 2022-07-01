import Foundation

struct PreviewUserEmbedded : UserEmbeddedProtocol, UserProtocol {
  internal init(id: UUID, name: String, avatar: URL, badge: String, posts: [PostProtocol]) {
    self.id = id
    self.name = name
    self.avatar = avatar
    self.badge = badge
    self.posts = posts
  }

  
  internal init(id: UUID, name: String, avatar: URL, badge: String, children: [PreviewUserEmbeddedPost]) {
    let userID = UUID()
    let posts = children.map { child in
      PreviewPost(userPost: child, userID: userID)
    }
    self.init(id: userID, name: name, avatar: avatar, badge: badge, posts: posts)
  }
  
  let id: UUID
  
  let name: String
  
  let avatar: URL
  
  let badge: String
  
  var user: UserProtocol {
    self
  }
  
  let posts: [PostProtocol]
  
  
}
