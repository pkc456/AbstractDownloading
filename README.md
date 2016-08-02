# AbstractDownloading

The purpose of the library is to abstract the downloading (images, pdf, zip, etc) and caching of remote resources (images, JSON, XML, etc). Resources which are reused often is not continually re-downloaded and cached. The project is also useful for all other parts of the app where asynchronous remote image loading is required.

I take care of following points while working on this project:

  - Readability : Classes' names are well defined. ViewController is the first viewController. Utility class named as FICDPhoto works with FastImageCache library who take cares of different image formats, UDID of images.
  - Maintainability: The code standard and folder structure is well maintained. It is based on MVC(Model-view-controller) aproach.
  - Scalability: The code is scalable enough to accomodate more updations.

You can also:
  - cancel the image load
  - Images and JSON are cached efficiently on in-memory only not on disk

# How to use
----------
- Install [FastImageCache](https://github.com/path/FastImageCache) using pods. 	`pod "FastImageCache"`
- At `AppDelegate.swift`, set up the fast image cache
   
     ```
        func setUpFastImageCache(){
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
- At `AppDelegate.swift`, Implements the `FICImageCacheDelegate` and method     
    `func imageCache(imageCache: FICImageCache!, wantsSourceImageForEntity entity: FICEntity!, withFormatName formatName: String!, completionBlock: FICImageRequestCompletionBlock!)`
- You can cancel the image load by using             `FICImageCache.sharedImageCache().cancelImageRetrievalForEntity(photo, withFormatName: "32BitBGR")`

# Future enhancement
----------

- Accompany the code with test classes.




> Loading images or any file from the disk is expensive (disk access is usually from 10.000 to 1.000.000 times slower than memory access. See comparison [here](http://www.storagereview.com/introduction_ram_disks). If we refer to SSD disks, those can come closer to RAM speeds (like 10 times slower), but at this point no smartphone or tablet is equipped with an SSD unit).


### Tech

Abstract downloading uses below open source projects to work properly:

* [FastImageCache](https://github.com/path/FastImageCache) - iOS library for quickly displaying images while scrolling

And of course Abstract downloading itself is open source with a [public repository](https://github.com/pkc456/AbstractDownloading)
 on GitHub.


Readmes, how to use them in your own application can be found here:

* [/FastImageCache/README.md](https://github.com/path/FastImageCache/blob/master/README.md)

License
----

MIT



[//]: # (These are reference links used in the body of this note and get stripped out when the markdown processor does its job. There is no need to format nicely because it shouldn't be seen. Thanks SO - http://stackoverflow.com/questions/4823468/store-comments-in-markdown-syntax)


   [dill]: <https://github.com/joemccann/dillinger>
   [git-repo-url]: <https://github.com/joemccann/dillinger.git>
   [john gruber]: <http://daringfireball.net>
   [@thomasfuchs]: <http://twitter.com/thomasfuchs>
   [df1]: <http://daringfireball.net/projects/markdown/>
   [markdown-it]: <https://github.com/markdown-it/markdown-it>
   [Ace Editor]: <http://ace.ajax.org>
   [node.js]: <http://nodejs.org>
   [Twitter Bootstrap]: <http://twitter.github.com/bootstrap/>
   [keymaster.js]: <https://github.com/madrobby/keymaster>
   [jQuery]: <http://jquery.com>
   [@tjholowaychuk]: <http://twitter.com/tjholowaychuk>
   [express]: <http://expressjs.com>
   [AngularJS]: <http://angularjs.org>
   [Gulp]: <http://gulpjs.com>

   [PlDb]: <https://github.com/joemccann/dillinger/tree/master/plugins/dropbox/README.md>
   [PlGh]:  <https://github.com/joemccann/dillinger/tree/master/plugins/github/README.md>
   [PlGd]: <https://github.com/joemccann/dillinger/tree/master/plugins/googledrive/README.md>
   [PlOd]: <https://github.com/joemccann/dillinger/tree/master/plugins/onedrive/README.md>
