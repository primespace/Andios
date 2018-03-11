//
//  Context.swift
//  chartschool
//
//  Created by typark on 2018. 3. 10..
//  Copyright © 2018년 typark. All rights reserved.
//

import UIKit

protocol Context {
    
    func getActivity() -> AppCompatActivity
}


public class ContextCompat
{
    public static func getColor(_ resId: R.ResId) -> UIColor {
        return UIColor(named: resId.value)!
    }
    
    public static func getColor(_ resId: R.Color) -> UIColor {
        if(resId.id.value == "") {
            let hex = resId.value
            let red = CGFloat((hex >> 16) & 0xff)/255.0
            let green = CGFloat((hex >> 8) & 0xff)/255.0
            let blue = CGFloat(hex & 0xff)/255.0
            return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
        } else {
            return UIColor(named: resId.id.value)!;
        }
    }

    public static func getString(_ resId: R.ResId) -> String {
        return Bundle.main.localizedString(forKey: resId.value, value: nil, table: nil)
    }
}
