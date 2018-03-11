//
//  Menu.swift
//  iosdemo
//
//  Created by typark on 2018. 2. 6..
//  Copyright © 2018년 typark. All rights reserved.
//

import Foundation

open class MenuItem {
    
    var subMenus: [Menu] = []
    var actionId: Int = 0
    var drawable: R.ResId = R.ResId("")
    var titleId: R.ResId = R.ResId("")
    var title: String = ""
    
    init(_ actionId: Int, _ title: R.ResId) {
        self.actionId = actionId
        self.titleId = title
    }
    
    init(_ actionId: Int, _ title: String) {
        self.actionId = actionId
        self.title = title
    }
    
    init(_ actionId: Int, _ drawable: R.ResId, _ title: R.ResId) {
        self.actionId = actionId
        self.drawable = drawable
        self.titleId = title
    }
    
    init(_ actionId: Int, _ drawable: R.ResId, _ title: String) {
        self.actionId = actionId
        self.drawable = drawable
        self.title = title
    }
    
    func addMenu(_ menu: Menu) {
        self.subMenus.append(menu)
    }
}


open class Menu {
    
    var menuItems: [MenuItem] = []

    func addMenuItem(_ menuItem: MenuItem) {
        self.menuItems.append(menuItem)
    }
}
