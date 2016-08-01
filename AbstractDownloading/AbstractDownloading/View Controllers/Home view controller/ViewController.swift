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
        arrayImages.addObject("https://s3.amazonaws.com/fast-image-cache/demo-images/FICDDemoImage001.jpg")
        arrayImages.addObject("https://s3.amazonaws.com/fast-image-cache/demo-images/FICDDemoImage002.jpg")
        arrayImages.addObject("https://s3.amazonaws.com/fast-image-cache/demo-images/FICDDemoImage003.jpg")
        arrayImages.addObject("https://s3.amazonaws.com/fast-image-cache/demo-images/FICDDemoImage004.jpg")
        arrayImages.addObject("https://s3.amazonaws.com/fast-image-cache/demo-images/FICDDemoImage005.jpg")
        arrayImages.addObject("https://s3.amazonaws.com/fast-image-cache/demo-images/FICDDemoImage006.jpg")
        arrayImages.addObject("https://s3.amazonaws.com/fast-image-cache/demo-images/FICDDemoImage007.jpg")
        arrayImages.addObject("https://s3.amazonaws.com/fast-image-cache/demo-images/FICDDemoImage008.jpg")
        arrayImages.addObject("https://s3.amazonaws.com/fast-image-cache/demo-images/FICDDemoImage009.jpg")
        arrayImages.addObject("https://s3.amazonaws.com/fast-image-cache/demo-images/FICDDemoImage010.jpg")
        arrayImages.addObject("https://s3.amazonaws.com/fast-image-cache/demo-images/FICDDemoImage011.jpg")
        arrayImages.addObject("https://s3.amazonaws.com/fast-image-cache/demo-images/FICDDemoImage012.jpg")
        arrayImages.addObject("https://s3.amazonaws.com/fast-image-cache/demo-images/FICDDemoImage013.jpg")
        arrayImages.addObject("https://s3.amazonaws.com/fast-image-cache/demo-images/FICDDemoImage014.jpg")
        arrayImages.addObject("https://s3.amazonaws.com/fast-image-cache/demo-images/FICDDemoImage015.jpg")
        arrayImages.addObject("https://s3.amazonaws.com/fast-image-cache/demo-images/FICDDemoImage016.jpg")
        arrayImages.addObject("https://s3.amazonaws.com/fast-image-cache/demo-images/FICDDemoImage017.jpg")
        arrayImages.addObject("https://s3.amazonaws.com/fast-image-cache/demo-images/FICDDemoImage018.jpg")
        arrayImages.addObject("https://s3.amazonaws.com/fast-image-cache/demo-images/FICDDemoImage019.jpg")
        arrayImages.addObject("https://s3.amazonaws.com/fast-image-cache/demo-images/FICDDemoImage020.jpg")
        arrayImages.addObject("https://s3.amazonaws.com/fast-image-cache/demo-images/FICDDemoImage021.jpg")
        arrayImages.addObject("https://s3.amazonaws.com/fast-image-cache/demo-images/FICDDemoImage022.jpg")
        arrayImages.addObject("https://s3.amazonaws.com/fast-image-cache/demo-images/FICDDemoImage023.jpg")
        arrayImages.addObject("https://s3.amazonaws.com/fast-image-cache/demo-images/FICDDemoImage024.jpg")
        arrayImages.addObject("https://s3.amazonaws.com/fast-image-cache/demo-images/FICDDemoImage025.jpg")
        arrayImages.addObject("https://s3.amazonaws.com/fast-image-cache/demo-images/FICDDemoImage026.jpg")
        arrayImages.addObject("https://s3.amazonaws.com/fast-image-cache/demo-images/FICDDemoImage027.jpg")
        arrayImages.addObject("https://s3.amazonaws.com/fast-image-cache/demo-images/FICDDemoImage028.jpg")
        arrayImages.addObject("https://s3.amazonaws.com/fast-image-cache/demo-images/FICDDemoImage029.jpg")
        arrayImages.addObject("https://s3.amazonaws.com/fast-image-cache/demo-images/FICDDemoImage030.jpg")
        arrayImages.addObject("https://s3.amazonaws.com/fast-image-cache/demo-images/FICDDemoImage031.jpg")
        arrayImages.addObject("https://s3.amazonaws.com/fast-image-cache/demo-images/FICDDemoImage032.jpg")
        arrayImages.addObject("https://s3.amazonaws.com/fast-image-cache/demo-images/FICDDemoImage033.jpg")
        arrayImages.addObject("https://s3.amazonaws.com/fast-image-cache/demo-images/FICDDemoImage034.jpg")
        arrayImages.addObject("https://s3.amazonaws.com/fast-image-cache/demo-images/FICDDemoImage035.jpg")
        arrayImages.addObject("https://s3.amazonaws.com/fast-image-cache/demo-images/FICDDemoImage036.jpg")
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
        cell.buttonCross.hidden = false
//        cell.customImageView.image = UIImage(named: "Placeholder")
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

