//
//  ViewController.swift
//  AbstractDownloading
//
//  Created by Pardeep on 31/07/16.
//  Copyright © 2016 www.programmingcrew.in. All rights reserved.
//

import UIKit
import FastImageCache


class ViewController: UIViewController {

    @IBOutlet weak var tableviewImages: UITableView!
    var arrayImages = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.addUrlStringToArray()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func addUrlStringToArray(){
        arrayImages.addObject("https://raw.githubusercontent.com/wangjwchn/TestImage/master/Image004.jpg")
        arrayImages.addObject("http://dummyimage.com/600x400/000/fff&text=ww")        
    }
    
    //MARK:- Table view delegate
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayImages.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let identifier = "CellId"
        let cell : ViewControllerTableCell = tableView.dequeueReusableCellWithIdentifier(identifier) as! ViewControllerTableCell
        
        let url = NSURL(string: arrayImages.objectAtIndex(indexPath.row) as! String)
        cell.imageUrl = url
        cell.customImageView.image = nil;
        let photo = FICDPhoto()
        photo.sourceImageURL = url
        
        FICImageCache.sharedImageCache().asynchronouslyRetrieveImageForEntity(photo, withFormatName: "32BitBGR") { [weak cell] (entity, formatName, image) in

            if((cell?.imageUrl.isEqual(url)) != nil){
                cell?.customImageView.image = image
                print("image retrived for entity %i",entity)
                
                cell?.buttonCross.hidden = true
            }
        }
        
        cell.handler_CrossButtonAction = { (button: UIButton) -> Void in
            cell.buttonCross.hidden = true
            FICImageCache.sharedImageCache().cancelImageRetrievalForEntity(photo, withFormatName: "32BitBGR")
            
            print("image cancel for photo %i",photo)

        }
        
        return cell
    }

}

