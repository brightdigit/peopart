
struct PostDataType : DataType {
  let data : PostData?
  func fetch(_ completion: @escaping (Result<[DataItem], Error>) -> Void) {
    switch self.data {
    case .some(.posts(let posts)): completion( .success(posts.map(PostDataItem.init)))
    default:
      Database.shared.posts { (result) in
        let newResult = result.map({ (posts) -> [DataItem] in
          return posts.map{
            PostDataItem(embed: $0)
          }
        })
        completion(newResult)
      }
      
    }
  }
}
