//
//  HomeModel.swift
//  幼师
//
//  Created by jxw on 2018/6/14.
//  Copyright © 2018年 shining. All rights reserved.
//

import UIKit
import ObjectMapper

class HomeModel: Mappable {
    var image:String?
    var text:String?
    private let margin:CGFloat = 10
    private let btnH:CGFloat = 44

    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        image <- map["image"]
        text <- map["text"]
    }
    
    var contentHeight:CGFloat{
        let screenW = UIScreen.main.bounds.width
        let topH = (screenW - margin * 2) / 2 + 4 * margin + btnH
        let textSize = text?.getTextWidthAndHeight(screenW-margin * 2, mfont: UIFont.systemFont(ofSize: 15), nsStringDrawingOptions: .usesFontLeading)
        let tempTextH = textSize?[1] ?? 0
        let tempTextW = textSize?[0] ?? 0
        let textH = tempTextW < screenW - margin * 2 ? tempTextH : tempTextH * 2
        let bottomH:CGFloat = 10
        return topH + textH + bottomH
    }
}
