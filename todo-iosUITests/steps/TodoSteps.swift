//
//  TodoSteps.swift
//  todo-iosUITests
//
//  Created by Yuta Chiba on 2018/12/16.
//  Copyright © 2018 xxxx. All rights reserved.
//

import XCTest

protocol TodoSteps {
    
    // when
    func when_アプリが起動すると()
    
    // then
    func then_TODO一覧画面が表示される()
}

extension TodoSteps {
    
    // when
    func when_アプリが起動すると() {
        XCUIApplication().launch()
    }
    
    // then
    func then_TODO一覧画面が表示される() {
       // タイトルがTODO一覧であるNavigationBarが存在することでTODO一覧画面が表示されていることを確認
        XCTAssertTrue(XCUIApplication().navigationBars["TODO一覧"].exists)
    }
    
}
