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
    
    public static let FLAG_ACTIVITY_CLEAR_TASK: Int = 0x0000001
    public static let FLAG_ACTIVITY_NEW_TASK: Int   = 0x0000002
    
    
    public var context: AppCompatActivity
    
    public var klass: AppCompatActivity
    
    private var flags: Int = 0
    
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
    
    public func addFlags(_ flag: Int) {
        self.flags = self.flags | flag
    }
}
