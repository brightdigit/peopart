

protocol DataType {
  //var numberOfItems : Int { get }
  //func configure(_ rowController : RowController, forIndex index: Int)
  
  func fetch (_ completion :  @escaping (Result<[DataItem], Error>) -> Void )
}
