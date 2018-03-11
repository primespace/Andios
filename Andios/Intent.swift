//
//  Intent.swift
//  iosdemo
//
//  Created by typark on 2018. 3. 2..
//  Copyright © 2018년 typark. All rights reserved.
//

import Foundation
import UIKit

public class Intent {
    
    var context: AppCompatActivity
    var klass: AppCompatActivity
    
    public init(_ context: AppCompatActivity, _ klass: AppCompatActivity) {
        self.context = context
        self.klass = klass
    }
    
    public func getParcelableExtra(_ key: String) -> Any? {
        return nil
    }
    
    public func getParcelableArrayListExtra(_ key: String) -> [Any]? {
        return nil
    }
    
    public func getIntExtra(_ key: String, _ num: Int) -> Int {
        return 0
    }
}
