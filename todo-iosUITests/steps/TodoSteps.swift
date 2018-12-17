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
    
    func given_TODO登録画面に遷移した状態で()
    
    // when
    func when_アプリが起動すると()
    
    func when_＋ボタンを押すと()
    
    func when_TODO登録画面に遷移したとき()
    
    func when_TODO一覧ボタンを押すと()

    // then
    func then_TODO一覧画面が表示される()
    
    func then_TODO登録画面が表示される()
    
    func then_TODO名の入力欄が表示される()
    
    func then_登録ボタンが表示される()
    
    func then_TODO一覧ボタン（戻るボタン）が表示される()
    
    func then_TODO一覧画面に遷移する()
}

extension TodoSteps {
    
    // given
    func given_TODO一覧画面にいる状態で() {
        XCUIApplication().launch()
        XCTAssertTrue(XCUIApplication().navigationBars["TODO一覧"].exists)
    }
    
    func given_TODO登録画面に遷移した状態で() {
        XCUIApplication().launch()
        XCUIApplication().buttons["Add"].tap()
        XCTAssertTrue(XCUIApplication().navigationBars["TODO登録"].exists)
    }
    
    // when
    func when_アプリが起動すると() {
        XCUIApplication().launch()
    }
    
    func when_＋ボタンを押すと() {
        XCUIApplication().buttons["Add"].tap()
    }
    
    func when_TODO登録画面に遷移したとき() {
        XCUIApplication().buttons["Add"].tap()
        XCTAssertTrue(XCUIApplication().navigationBars["TODO登録"].exists)
    }
    
    func when_TODO一覧ボタンを押すと() {
        XCUIApplication().buttons["TODO一覧"].tap()
    }
    
    // then
    func then_TODO一覧画面が表示される() {
       // タイトルがTODO一覧であるNavigationBarが存在することでTODO一覧画面が表示されていることを確認
        XCTAssertTrue(XCUIApplication().navigationBars["TODO一覧"].exists)
    }
    
    func then_TODO登録画面が表示される() {
        XCTAssertTrue(XCUIApplication().navigationBars["TODO登録"].exists)
    }
    
    func then_TODO名の入力欄が表示される() {
        XCTAssertTrue(XCUIApplication().textFields["TODO名"].exists)
    }
    
    func then_登録ボタンが表示される() {
        XCTAssertTrue(XCUIApplication().buttons["登録"].exists)
    }
    
    func then_TODO一覧ボタン（戻るボタン）が表示される() {
        XCTAssertTrue(XCUIApplication().buttons["TODO一覧"].exists)
    }
    
    func then_TODO一覧画面に遷移する() {
        XCTAssertTrue(XCUIApplication().navigationBars["TODO一覧"].exists)
    }
}
