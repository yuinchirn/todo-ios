//
//  TodoFeatures.swift
//  todo-iosUITests
//
//  Created by Yuta Chiba on 2018/12/16.
//  Copyright © 2018 xxxx. All rights reserved.
//

import XCTest

class TodoFeatures: XCTestCase, TodoSteps {
    
    func test_Top画面はTODO一覧画面() {
        when_アプリが起動すると()
        then_TODO一覧画面が表示される()
    }
    
    func test_TODO一覧画面からTODO登録画面に遷移できる() {
        given_TODO一覧画面にいる状態で()
        when_＋ボタンを押すと()
        then_TODO登録画面が表示される()
    }
    
    func test_TODO登録画面のフォーム() {
        given_TODO一覧画面にいる状態で()
        when_TODO登録画面に遷移したとき()
        then_TODO名の入力欄が表示される()
        then_登録ボタンが表示される()
        then_TODO一覧ボタン（戻るボタン）が表示される()
    }
    
    func test_TODO登録画面からTODO一覧画面に戻ることができる() {
        given_TODO登録画面に遷移した状態で()
        when_TODO一覧ボタンを押すと()
        then_TODO一覧画面に遷移する()
    }
    
}
