//
//  StoryboardTest.swift
//  ToDoListTests
//
//  Created by Pierce Tu on 10/16/19.
//  Copyright © 2019 Pierce. All rights reserved.
//

import XCTest
@testable import ToDoList

class StoryboardTest: XCTestCase {
  
  override func setUp() {
  }
  
  override func tearDown() {
  }
  
  func test_init_initialViewController_isItemListViewController() {
    let storyboard = UIStoryboard(name: Constants.MainBundleIdentifer, bundle: nil)
    
    let navigationController =
      storyboard.instantiateInitialViewController()
        as! UINavigationController
    
    let rootViewController = navigationController.viewControllers[0]
    
    XCTAssertTrue(rootViewController is ItemListViewController)
  }
}
