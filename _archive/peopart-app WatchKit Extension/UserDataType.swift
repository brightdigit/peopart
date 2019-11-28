
struct UserDataType : DataFetcher {
  func fetch(_ completion: @escaping (Result<[MenuItem], Error>) -> Void) {
    Database.shared.users { (result) in
      completion(result.map{
        $0.map(UserDataItem.init)
      })
    }
  }
}
