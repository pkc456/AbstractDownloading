//
//  ViewControllerTableCell.swift
//  AbstractDownloading
//
//  Created by Pardeep Chaudhary on 01/08/16.
//  Copyright © 2016 www.programmingcrew.in. All rights reserved.
//

import Foundation

typealias blockDefination_CrossButtonAction = (button : UIButton) -> Void

class ViewControllerTableCell: UITableViewCell {
    var handler_CrossButtonAction : blockDefination_CrossButtonAction?

    var imageUrl : NSURL!
    @IBOutlet weak var customImageView: UIImageView!
    @IBOutlet weak var buttonCross: UIButton!
    
    //MARK: IBActions
    @IBAction func btnCrossAction(sender: UIButton) {
        if(self.respondsToSelector(Selector("handler_CrossButtonAction")))
        {
            self.handler_CrossButtonAction?(button: sender)
        }
    }
}