//
//  StringExtension.swift
//  幼师
//
//  Created by jxw on 2018/6/14.
//  Copyright © 2018年 shining. All rights reserved.
//

import Foundation
import  UIKit
extension String{
    func getTextWidthAndHeight(_ textWidth:CGFloat,mfont:UIFont,nsStringDrawingOptions:NSStringDrawingOptions)->[CGFloat]{
        let font=mfont;
        let atts=[NSAttributedStringKey.font:font];
        let rectSize = CGSize(width: textWidth,height: 1000);
        let size = self.boundingRect(with: rectSize, options:nsStringDrawingOptions, attributes: atts, context: nil);
        return [size.width,size.height];
    }
}
