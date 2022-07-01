
struct PostDataType : DataFetcher {
  let data : PostData?
  func fetch(_ completion: @escaping (Result<[MenuItem], Error>) -> Void) {
    switch self.data {
    case .some(.posts(let posts)):
      completion(.success(posts.map(PostDataItem.init)))
    default:
      Database.shared.posts(fromUserID: nil) { (result) in
        let newResult = result.map({ (posts) -> [MenuItem] in
          return posts.map(PostDataItem.init)
        })
        completion(newResult)
      }
    }
  }
}
