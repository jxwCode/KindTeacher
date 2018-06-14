//
//  NetWorkingTool.swift
//  LinkedDesignerBuyer
//
//  Created by jxw on 2018/6/14.
//  Copyright © 2018年 shining. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import ObjectMapper

class NetWorkTool: NSObject {
    //get,返回object
    class func getHomeData(withUrl:String,resultClouse:((_ result:[HomeModel]) -> Void)?){
        Alamofire.request(withUrl,headers: nil).validate().responseData { (reponse) in
        switch reponse.result {
        case .success:
            var resultArr = [HomeModel]()
            if let data = reponse.data{
                if let arr = JSON(data).array{
                    for dic in arr{
                        resultArr.append(HomeModel(JSON: dic.dictionaryObject!)!)
                    }
                }
            }
            resultClouse?(resultArr)
        case .failure(_):
            print("请求有错误")
        }
        }

    }
}
