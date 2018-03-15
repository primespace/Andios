//
//  Assert.swift
//  chartschool
//
//  Created by typark on 2018. 3. 9..
//  Copyright © 2018년 typark. All rights reserved.
//

import Foundation


public class Assert {
    
    
    public static func assertNotNull(_ obj: Any?) {
        assert(obj != nil)
    }
    
    public static func assertTrue(_ value: Bool) {
        assert(value)
    }
}
