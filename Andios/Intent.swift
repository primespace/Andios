//
//  Intent.swift
//  iosdemo
//
//  Created by typark on 2018. 3. 2..
//  Copyright © 2018년 typark. All rights reserved.
//

import Foundation
import UIKit

open class Intent {
    
    var context: AppCompatActivity
    var klass: AppCompatActivity
    
    init(_ context: AppCompatActivity, _ klass: AppCompatActivity) {
        self.context = context
        self.klass = klass
    }
    
    func getParcelableExtra(_ key: String) -> Any? {
        return nil
    }
    
    func getParcelableArrayListExtra(_ key: String) -> [Any]? {
        return nil
    }
    
    func getIntExtra(_ key: String, _ num: Int) -> Int {
        return 0
    }
}
