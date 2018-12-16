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
    
}
