

protocol DataFetcher {
  func fetch (_ completion :  @escaping (Result<[MenuItem], Error>) -> Void )
}
