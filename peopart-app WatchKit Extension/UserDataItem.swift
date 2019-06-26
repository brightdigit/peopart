import WatchKit

class UserDataItem : NSObject, DataItem {
  let dataType: DataType?
  let user: UserEmbeddedProtocol
  
  init (user: UserEmbeddedProtocol) {
    self.user = user
    self.dataType = PostDataType(data: .posts(user.posts))
  }
  func controller(_ controller: WKInterfaceController, table: WKInterfaceTable, configureRowAtIndex index: Int) {
    guard let rowController = table.rowController(at: index) as? RowController else {
      return
    }
    
    rowController.image.setImage(UIImage(named: "User"))
    rowController.label.setText(user.user.name)
  }
  
  func controller(_ controller: WKInterfaceController, table: WKInterfaceTable, didSelectRowAt index: Int) {
    controller.pushController(withName: "table", context: self)
  }
  
  
  
}
