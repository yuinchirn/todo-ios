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
    
    func given_TODO一覧画面に掃除という項目がなく()
    
    // when
    func when_アプリが起動すると()
    
    func when_＋ボタンを押すと()
    
    func when_TODO登録画面に遷移したとき()
    
    func when_TODO一覧ボタンを押すと()
    
    func when_TODO名の欄に掃除と入力して登録ボタンを押すと()

    // then
    func then_TODO一覧画面が表示される()
    
    func then_TODO登録画面が表示される()
    
    func then_TODO名の入力欄が表示される()
    
    func then_登録ボタンが表示される()
    
    func then_TODO一覧ボタン（戻るボタン）が表示される()
    
    func then_TODO一覧画面に遷移する()
    
    func then_TODO一覧に掃除という項目が表示される()
}

extension TodoSteps {
    
    func isInTodoListView() -> Bool {
       return XCUIApplication().navigationBars["TODO一覧"].exists
    }
    
    func isInTodoAddView() -> Bool {
        return XCUIApplication().navigationBars["TODO登録"].exists
    }
    
    func tapAddButton() {
        XCUIApplication().buttons["Add"].tap()
    }
    
    func exists掃除cell() -> Bool {
        return XCUIApplication().staticTexts["掃除"].exists
    }
    
    // given
    func given_TODO一覧画面にいる状態で() {
        XCUIApplication().launch()
        XCTAssertTrue(isInTodoListView())
    }
    
    func given_TODO登録画面に遷移した状態で() {
        XCUIApplication().launch()
        tapAddButton()
        XCTAssertTrue(isInTodoAddView())
    }
    
    func given_TODO一覧画面に掃除という項目がなく() {
        XCUIApplication().launch()
        XCTAssertTrue(isInTodoListView())
        XCTAssertFalse(exists掃除cell())
    }
    
    // when
    func when_アプリが起動すると() {
        XCUIApplication().launch()
    }
    
    func when_＋ボタンを押すと() {
        tapAddButton()
    }
    
    func when_TODO登録画面に遷移したとき() {
        tapAddButton()
        XCTAssertTrue(isInTodoAddView())
    }
    
    func when_TODO一覧ボタンを押すと() {
        XCUIApplication().buttons["TODO一覧"].tap()
    }
    
    func when_TODO名の欄に掃除と入力して登録ボタンを押すと() {
        XCUIApplication().textFields["TODO名"].tap()
        XCUIApplication().textFields["TODO名"].typeText("掃除")
        XCUIApplication().buttons["登録"].tap()
    }
    
    // then
    func then_TODO一覧画面が表示される() {
       // タイトルがTODO一覧であるNavigationBarが存在することでTODO一覧画面が表示されていることを確認
        XCTAssertTrue(isInTodoListView())
    }
    
    func then_TODO登録画面が表示される() {
        XCTAssertTrue(isInTodoAddView())
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
        XCTAssertTrue(isInTodoListView())
    }
    
    func then_TODO一覧に掃除という項目が表示される() {
        XCTAssertTrue(exists掃除cell())
    }
}
