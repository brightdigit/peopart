//
//  InterfaceController.swift
//  peopart-app WatchKit Extension
//
//  Created by Leo Dion on 5/30/19.
//  Copyright © 2019 Leo Dion. All rights reserved.
//

import WatchKit
import Foundation

struct ItemDataType : DataType {
  func fetch(_ completion: ([DataItem]) -> Void) {
    completion( [ItemType(type: .user), ItemType(type: .post)] )
  }
  
//  var numberOfItems: Int {
//    return 2
//  }
//
//  func configure(_ rowController: RowController, forIndex index: Int) {

//  }
  
}

class ItemType : NSObject, DataItem {
  
  let type : Int
  let dataType: DataType
  
  init (type: Types) {
    self.type = type.rawValue
    self.dataType = ItemDataType()
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
  
//  func table(_ table: WKInterfaceTable, configureRowAtIndex index: Int) {

//  }
  
  
}

protocol DataItem {
  func controller( _ controller : WKInterfaceController, table: WKInterfaceTable, configureRowAtIndex index: Int)
  func controller( _ controller : WKInterfaceController, table: WKInterfaceTable, didSelectRowAt index: Int)
  
  var dataType : DataType { get }
}

protocol DataType {
  //var numberOfItems : Int { get }
  //func configure(_ rowController : RowController, forIndex index: Int)
 
  func fetch (_ completion :  @escaping ([DataItem]) -> Void )
}

class InterfaceController: WKInterfaceController {
  var dataType : DataType = ItemDataType()
  var items : [DataItem]? = nil
  @IBOutlet weak var table: WKInterfaceTable!
  
  override func awake(withContext context: Any?) {
    super.awake(withContext: context)
    
    if let itemType = context as? DataItem {
      self.dataType = itemType.dataType
    }
    
    
    // Configure interface objects here.
    dataType.fetch { (items) in
      self.items = items
      DispatchQueue.main.async {
        self.reload()
      }
      
    }
    
//    table.setNumberOfRows(dataType.numberOfItems, withRowType: "row")
//
//    for index in 0..<dataType.numberOfItems {
//      guard let rowController = table.rowController(at: index) as? RowController else {
//        continue
//      }
//      dataType.configure(rowController, forIndex: index)
//    }
  }
  
  func reload () {
    guard let items = self.items else {
      return
    }
    table.setNumberOfRows(items.count, withRowType: "row")
    
    for (index, item) in items.enumerated() {
      item.controller(self, table: table, configureRowAtIndex: index)
    }
  }
  
  override func willActivate() {
    // This method is called when watch view controller is about to be visible to user
    super.willActivate()
  }
  
  override func didDeactivate() {
    // This method is called when watch view controller is no longer visible
    super.didDeactivate()
  }
  
  
  override func table(_ table: WKInterfaceTable, didSelectRowAt rowIndex: Int) {
    guard let item = items?[rowIndex] else {
      return
    }
    
    item.controller(self, table : table, didSelectRowAt: rowIndex)
  }
  
}
