//
//  HomeCell.swift
//  幼师
//
//  Created by jxw on 2018/6/14.
//  Copyright © 2018年 shining. All rights reserved.
//

import UIKit
import Kingfisher

protocol HomeCellDelegate:NSObjectProtocol {
    func homeCellDidSelectAButton()
    func homeCellDidSelectBButton()
}

class HomeCell: UITableViewCell {
    @IBOutlet weak var homeImageV: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    weak var delegate: HomeCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        descriptionLabel.numberOfLines = 2
        self.selectionStyle = .none
        // Initialization code
    }
    @IBAction func AAction(_ sender: Any) {
       self.delegate?.homeCellDidSelectAButton()
    }
    @IBAction func BAction(_ sender: Any) {
        self.delegate?.homeCellDidSelectBButton()
    }
    
    func loadModel(model:HomeModel){
        if let imageUrl = model.image{
        homeImageV.kf.setImage(with: URL(string:imageUrl)!, placeholder: nil, options: nil, progressBlock: nil, completionHandler: nil)
        }
        descriptionLabel.text = model.text
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
