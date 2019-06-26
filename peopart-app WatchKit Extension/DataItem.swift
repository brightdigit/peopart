import WatchKit

protocol DataItem : AnyObject, NSObjectProtocol {
  func controller( _ controller : WKInterfaceController, table: WKInterfaceTable, configureRowAtIndex index: Int)
  func controller( _ controller : WKInterfaceController, table: WKInterfaceTable, didSelectRowAt index: Int)
  
  var dataType : DataType? { get }
}
