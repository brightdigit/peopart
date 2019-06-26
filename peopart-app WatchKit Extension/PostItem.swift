
enum PostItem {
  case post(PostProtocol), embed(PostEmbeddedProtocol)
  
  var title : String {
    switch self {
    case .embed(let value): return value.post.title
    case .post(let value): return value.title
    }
  }
}
