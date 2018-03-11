//
//  R.swift
//  Andios
//
//  Created by typark on 2018. 3. 11..
//  Copyright © 2018년 typark. All rights reserved.
//

import Foundation

public class R {
    
    public struct ResId {
        public var value: String = ""
        public init(_ value: String) {
            self.value = value
        }
    }
    
    public struct Color {
        public var id = R.ResId("")
        public var value: Int = 0
        public init(_ value: Int) {
            self.value = value
        }
        public init(_ id: R.ResId) {
            self.id = id
        }
    }
    
    public class android {
        public class id {
            public static let home = 100000
        }
    }
    
    public class color {
        
    }
}
