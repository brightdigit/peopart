
struct UserDataType : DataType {
  func fetch(_ completion: @escaping (Result<[DataItem], Error>) -> Void) {
    Database.shared.users { (result) in
      completion(result.map{
        $0.map(UserDataItem.init)
      })
    }
  }
}
