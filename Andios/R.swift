//
//  R.swift
//  Andios
//
//  Created by typark on 2018. 3. 11..
//  Copyright © 2018년 typark. All rights reserved.
//

import Foundation

class R {
    
    struct ResId {
        var value: String = ""
        init(_ value: String) {
            self.value = value
        }
    }
    
    struct Color {
        var id = R.ResId("")
        var value: Int = 0
        init(_ value: Int) {
            self.value = value
        }
        init(_ id: R.ResId) {
            self.id = id
        }
    }
    
    class andriod {
        class id {
            static let home = 100000
        }
    }
    
    
}
