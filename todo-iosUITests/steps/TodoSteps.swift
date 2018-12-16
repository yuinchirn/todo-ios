//
//  TodoSteps.swift
//  todo-iosUITests
//
//  Created by Yuta Chiba on 2018/12/16.
//  Copyright © 2018 xxxx. All rights reserved.
//

import XCTest

protocol TodoSteps {
    
    // given
    func given_TODO一覧画面にいる状態で()
    
    // when
    func when_アプリが起動すると()
    
    func when_＋ボタンを押すと()
    
    // then
    func then_TODO一覧画面が表示される()
    
    func then_TODO登録画面が表示される()
}

extension TodoSteps {
    
    // given
    func given_TODO一覧画面にいる状態で() {
        XCUIApplication().launch()
        XCTAssertTrue(XCUIApplication().navigationBars["TODO一覧"].exists)
    }
    
    // when
    func when_アプリが起動すると() {
        XCUIApplication().launch()
    }
    
    func when_＋ボタンを押すと() {
        XCUIApplication().buttons["Add"].tap()
    }
    
    // then
    func then_TODO一覧画面が表示される() {
       // タイトルがTODO一覧であるNavigationBarが存在することでTODO一覧画面が表示されていることを確認
        XCTAssertTrue(XCUIApplication().navigationBars["TODO一覧"].exists)
    }
    
    func then_TODO登録画面が表示される() {
        XCTAssertTrue(XCUIApplication().navigationBars["TODO登録"].exists)
    }
    
}
