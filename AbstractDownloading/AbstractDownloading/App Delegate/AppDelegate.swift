//
//  AppDelegate.swift
//  AbstractDownloading
//
//  Created by Pardeep on 31/07/16.
//  Copyright © 2016 www.programmingcrew.in. All rights reserved.
//

import UIKit
import FastImageCache


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, FICImageCacheDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        self.setUpFastImageCache()
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    func setUpFastImageCache(){
//        var mutableImageFormats = NSMutableArray()
        
        // Square image formats...
//        let squareImageFormatMaximumCount = 400
//        let squareImageFormatDevices = FICImageFormatDevicePhone

        
        let mediumUserThumbnailImageFormat = FICImageFormat()
        mediumUserThumbnailImageFormat.name = "32BitBGR"
        mediumUserThumbnailImageFormat.family = "Family"
        mediumUserThumbnailImageFormat.style = FICImageFormatStyle.Style32BitBGR
        mediumUserThumbnailImageFormat.imageSize = CGSizeMake(200, 200)
        mediumUserThumbnailImageFormat.maximumCount = 500
        mediumUserThumbnailImageFormat.devices = FICImageFormatDevices.Phone
        
        let sharedImageCache = FICImageCache.sharedImageCache()
        sharedImageCache.delegate = self
        sharedImageCache.setFormats([mediumUserThumbnailImageFormat])
    }

    // MARK: FICImageCacheDelegate
    func imageCache(imageCache: FICImageCache!, wantsSourceImageForEntity entity: FICEntity!, withFormatName formatName: String!, completionBlock: FICImageRequestCompletionBlock!) {
    
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) { 
            
            let requestURL = entity.sourceImageURLWithFormatName(formatName)
            if let dataFromUrl = NSData(contentsOfURL: requestURL) {
                let sourceImage = UIImage(data: dataFromUrl)
                
                dispatch_async(dispatch_get_main_queue(), {
                    completionBlock(sourceImage)
                })
            }else{
//                completionBlock(nil)
                print("pkc456, data NAHI hai")
            }
            
            
            
        }
    }
    
}