import WatchKit

class ItemType : NSObject, DataItem {
  
  let type : Int
  let dataType: DataType?
  
  init (type: Types) {
    self.type = type.rawValue
    let dataType : DataType
    switch type {
    case .user:
      dataType = UserDataType()
    case .post:
      dataType = PostDataType(data: nil)
    }
    self.dataType = dataType
  }
  enum Types : Int {
    case user = 0, post = 1
  }
  func controller(_ controller: WKInterfaceController, table: WKInterfaceTable, configureRowAtIndex index: Int) {
    guard let type = Types(rawValue: index) else {
      return
    }
    guard let rowController = table.rowController(at: index) as? RowController else {
      return
    }
    switch (type) {
    case .user:
      rowController.image.setImage(UIImage(named: "User"))
      rowController.label.setText("Users")
    case .post:
      rowController.image.setImage(UIImage(named: "Post"))
      rowController.label.setText("Posts")
    }
  }
  
  func controller(_ controller: WKInterfaceController, table: WKInterfaceTable, didSelectRowAt index: Int) {
    controller.pushController(withName: "table", context: self)
  }
  
}
