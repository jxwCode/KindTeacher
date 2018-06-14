
//
//  ObjectExtension.swift
//  幼师
//
//  Created by jxw on 2018/6/14.
//  Copyright © 2018年 shining. All rights reserved.
//

import Foundation
import UIKit

extension UITableViewCell{
    
    class func initNib() ->UINib{
        let classStr = String(describing:self)
        return UINib(nibName: classStr, bundle: nil)
    }
    
    class var reuseId:String{
        return String(describing:self)
    }
    
}
