//
//  Menu.swift
//  iosdemo
//
//  Created by typark on 2018. 2. 6..
//  Copyright © 2018년 typark. All rights reserved.
//

import Foundation

public class MenuItem {
    
    public var subMenus: [Menu] = []
    public var actionId: Int = 0
    public var drawable: R.ResId = R.ResId("")
    public var titleId: R.ResId = R.ResId("")
    public var title: String = ""
    
    public init(_ actionId: Int, _ title: R.ResId) {
        self.actionId = actionId
        self.titleId = title
    }
    
    public init(_ actionId: Int, _ title: String) {
        self.actionId = actionId
        self.title = title
    }
    
    public init(_ actionId: Int, _ drawable: R.ResId, _ title: R.ResId) {
        self.actionId = actionId
        self.drawable = drawable
        self.titleId = title
    }
    
    public init(_ actionId: Int, _ drawable: R.ResId, _ title: String) {
        self.actionId = actionId
        self.drawable = drawable
        self.title = title
    }
    
    public func addMenu(_ menu: Menu) {
        self.subMenus.append(menu)
    }
}


public class Menu {
    
    public var menuItems: [MenuItem] = []

    public func addMenuItem(_ menuItem: MenuItem) {
        self.menuItems.append(menuItem)
    }
}
