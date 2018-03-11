//
//  ActionBar.swift
//  chartschool
//
//  Created by typark on 2018. 3. 10..
//  Copyright © 2018년 typark. All rights reserved.
//

import UIKit

class ActionBar {
    
    var context: Context
    
    init(_ context: Context) {
        self.context = context
    }
    
    
    func setHomeAsUpIndicator(_ drawable: R.ResId)
    {
        let activity = self.context.getActivity()
        activity.setHomeAsUpIndicator(drawable)
    }
    
    func setTitle(_ title: String, _ color: UIColor = UIColor.white)
    {
        let activity = self.context.getActivity()
        activity.setTitle(title, color)
    }

}
