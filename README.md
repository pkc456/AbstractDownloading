# AbstractDownloading
The purpose of the library is to abstract the downloading (images, pdf, zip, etc) and caching of remote resources (images, JSON, XML, etc). Resources which are reused often should not be continually re-downloaded and should be cached

Abstract Downloading is very useful project for downloading and caching remote images to the iOS application. I take care of following points while working on this project:

1) Readability : Classes' names are well defined. ViewController is the first viewController. Utility class named as FICDPhoto works with FastImageCache library who take cares of different image formats, UDID of images.
2) Maintainability: The code standard and folder structure is well maintained. It is based on MVC(Model-view-controller) aproach.
3) Scalability: The code is scalable enough to accomodate more updations.

This project's minimum deployment target is 8.0.
