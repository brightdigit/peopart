import Foundation

struct PreviewPost : PostProtocol {
  let userPost : PreviewUserEmbeddedPost
  let userID : UUID
  
  var userId: UUID {
    userID
  }
  
  var id: UUID {
    userPost.id
  }
  
  var title: String{
    userPost.title
  }
  
  var image: URL{
    userPost.image
  }
  
  var text: String{
    userPost.text
  }
  
  var date: Date{
    userPost.date
  }
  
  
}
