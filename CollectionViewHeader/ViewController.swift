//
//  ViewController.swift
//  CollectionViewHeader
//
//  Created by perk on 04/06/18.
//  Copyright © 2018 Perk. All rights reserved.
//

import UIKit
import Kingfisher
import PinterestLayout

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, PinterestLayoutDelegate, AACarouselDelegate {
    
    @IBOutlet var collectionViewItems: UICollectionView!
    @IBOutlet var viewForCarousel: AACarousel!
    var titleArray = [String]()
    
    var showCarousel = Bool()
    
    let arrayItems:[String] = ["Hello this is a big label One", "Hello this is a big label two", "Hello this is a big label One", "Hello this is a big label two", "Hello this is a big label One", "Hello this is a big label two", "Hello this is a big label One", "Hello this is a big label two", "Hello this is a big label One", "Hello this is a big label two", "Hello this is a big label One", "Hello this is a big label two", "Hello this is a big label One", "Hello this is a big label two", "Hello this is a big label One", "Hello this is a big label two"]
    
    let arrayImgaes:[String] = ["https://i.ytimg.com/vi/awBlwr4B1Do/maxresdefault.jpg", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR7KKBUma283pTszt-kty7cTqomFqTRNmvMSwoN53pNfbgknKIj", "https://sites.google.com/site/cocoaexposed/_/rsrc/1374766887608/cocoa-confectionery/product-survey/cadbury--perk-glucose/glucoseperk.jpg", "https://lh3.googleusercontent.com/LMyHau5ffWr7UXIHdTFA19BFGni-OnDEcb6F-jdSKao4Qfcn-5EZaJxeADUnsBieRUM=w720-h310", "https://incomefromthereddot.com/wp-content/uploads/2014/08/Perk-main-screen.jpg", "https://lh3.googleusercontent.com/URoboGSK86DLIVp9nYRnUvDAtoUUq0mPPYyCgScEAKNUeseNYJBMt_9oiGwL6vWEGtOn=s180", "http://i.imgur.com/AXKdeYU.png", "https://i.pinimg.com/564x/90/24/8c/90248ca9b048540e6384eb706d9f020b.jpg", "https://i.pinimg.com/564x/bc/4a/6a/bc4a6a5851a791f6e3df617a9f2dc29b.jpg", "https://i.pinimg.com/564x/46/b1/71/46b1712b7b971152fcea7a61b7486bcb.jpg", "https://i.pinimg.com/originals/c8/b7/a8/c8b7a873dd633e639838b67d4b5347cf.png", "https://i.pinimg.com/564x/d0/d3/ea/d0d3ea0f334b32c8cbe0d2a2c13af332.jpg", "https://i.pinimg.com/564x/d8/f1/50/d8f1501aa1b281394e54e061e8ee70e4.jpg", "https://i.pinimg.com/564x/9f/cd/91/9fcd914b7b5bfa009111a0a6fdfba16b.jpg"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = .red
        
        //Seting up layout
        let layout = PinterestLayout()
        layout.delegate = self
        layout.cellPadding = 5
        layout.numberOfColumns = 2
        collectionViewItems.collectionViewLayout = layout
        
        
        let pathArray = ["https://i.ytimg.com/vi/awBlwr4B1Do/maxresdefault.jpg", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR7KKBUma283pTszt-kty7cTqomFqTRNmvMSwoN53pNfbgknKIj", "https://sites.google.com/site/cocoaexposed/_/rsrc/1374766887608/cocoa-confectionery/product-survey/cadbury--perk-glucose/glucoseperk.jpg", "https://lh3.googleusercontent.com/LMyHau5ffWr7UXIHdTFA19BFGni-OnDEcb6F-jdSKao4Qfcn-5EZaJxeADUnsBieRUM=w720-h310", "https://incomefromthereddot.com/wp-content/uploads/2014/08/Perk-main-screen.jpg", "https://lh3.googleusercontent.com/URoboGSK86DLIVp9nYRnUvDAtoUUq0mPPYyCgScEAKNUeseNYJBMt_9oiGwL6vWEGtOn=s180", "https://i.pinimg.com/564x/90/24/8c/90248ca9b048540e6384eb706d9f020b.jpg", "https://i.pinimg.com/564x/bc/4a/6a/bc4a6a5851a791f6e3df617a9f2dc29b.jpg", "https://i.pinimg.com/564x/46/b1/71/46b1712b7b971152fcea7a61b7486bcb.jpg", "https://i.pinimg.com/originals/c8/b7/a8/c8b7a873dd633e639838b67d4b5347cf.png", "https://i.pinimg.com/564x/d0/d3/ea/d0d3ea0f334b32c8cbe0d2a2c13af332.jpg", "https://i.pinimg.com/564x/d8/f1/50/d8f1501aa1b281394e54e061e8ee70e4.jpg", "https://i.pinimg.com/564x/9f/cd/91/9fcd914b7b5bfa009111a0a6fdfba16b.jpg"]
        titleArray = ["picture 1","picture 2","picture 3","picture 4","picture 5","picture 1","picture 2","picture 3","picture 4","picture 5","picture 2","picture 3","picture 4"]
        viewForCarousel.delegate = self
        viewForCarousel.setCarouselData(paths: pathArray,  describedTitle: titleArray, isAutoScroll: true, timer: 5.0, defaultImage: "defaultImage")
        //optional method
        viewForCarousel.setCarouselOpaque(layer: false, describedTitle: false, pageIndicator: false)
        viewForCarousel.setCarouselLayout(displayStyle: 0, pageIndicatorPositon: 2, pageIndicatorColor: nil, describedTitleColor: nil, layerColor: nil)
        
        showCarousel = true
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView.tag == 0 {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCellIdentifier_pop", for: indexPath) as! PopularCollectionViewCell
            
            let url = URL(string: arrayImgaes[indexPath.row])!
            
//            let url = URL(string: "https://raw.githubusercontent.com/onevcat/Kingfisher/master/images/kingfisher-\(indexPath.row + 1).jpg")!
            
            cell.imagePopular.kf.setImage(with: url,
                                          placeholder: nil,
                                          options: [.transition(.fade(1))],
                                          progressBlock: nil,
                                          completionHandler: {
                                            (image, error, cacheType, imageUrl) in
                                            
                                            print("Error message: \(String(describing: error?.description))")
                                            
                                            if cacheType == .none && error == nil{
                                                DispatchQueue.main.async {
                                                    self.collectionViewItems.reloadData()
                                                    
//                                                    self.collectionViewItems.performBatchUpdates({
//                                                        let indexSet = IndexSet(integersIn: 0...0)
//                                                        self.collectionViewItems.reloadSections(indexSet)
//                                                    }, completion: nil)
                                                    
                                                }
                                            }
            })
            
            return cell;
            
        }
        else{
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "popularContentIdentifier", for: indexPath) as! PopularContentCell
            cell.backgroundColor = UIColor.groupTableViewBackground
            
            cell.labelDescription.text = "This is a very big description to check the length of the view"
            cell.labelTitle.text = "Some Random Title"
            
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionView.tag == 0 ? arrayImgaes.count : arrayItems.count
    }
    
    func collectionView(collectionView: UICollectionView, heightForImageAtIndexPath indexPath: IndexPath, withWidth: CGFloat) -> CGFloat {
        
        if collectionView.tag == 0{
            if let imageCa = ImageCache.default.retrieveImageInDiskCache(forKey: arrayImgaes[indexPath.row]){
                
                print("Height of view: \(imageCa.height(forWidth: withWidth))")
                
                return imageCa.height(forWidth: withWidth) != 0 ? imageCa.height(forWidth: withWidth) : 100
            }
        }
        else{
            return 176
        }
        
        return 176
    }
    
    func collectionView(collectionView: UICollectionView, heightForAnnotationAtIndexPath indexPath: IndexPath, withWidth: CGFloat) -> CGFloat {
        return 0
    }
    
    func collectionView(collectionView: UICollectionView, sizeForSectionHeaderViewForSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: showCarousel ? 414 : 274)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch kind {
        case UICollectionElementKindSectionHeader:

            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "CollectionHeaderIdentifier", for: indexPath) as! PopularHeaderReusableView
            headerView.labelTitle.text = "Hello this is a big big title"
            
//            headerView.collectionViewFeatured.delegate = self
//            headerView.collectionViewFeatured.dataSource = self
            
            if showCarousel{
                viewForCarousel.frame = CGRect(x: 0, y: headerView.collectionViewFeatured.frame.height+headerView.collectionViewFeatured.frame.origin.y+5, width: headerView.frame.width, height: 130)
                headerView.addSubview(viewForCarousel)
            }
            
            return headerView
            
        default:  fatalError("Unexpected element kind")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        showCarousel = !showCarousel
        collectionViewItems.reloadData()
    }
    
    //MARK: - Carousel Delegates
    
    //require method
    func downloadImages(_ url: String, _ index:Int) {
        
        let imageView = UIImageView()
        imageView.kf.setImage(with: URL(string: url)!, placeholder: UIImage.init(named: "defaultImage"), options: [.transition(.fade(1))], progressBlock: nil, completionHandler: { (downloadImage, error, cacheType, url) in
            self.viewForCarousel.images[index] = downloadImage!
        })
        
    }
    
    //optional method (interaction for touch image)
    func didSelectCarouselView(_ view:AACarousel ,_ index:Int) {
        
        let alert = UIAlertView.init(title:"Alert" , message: titleArray[index], delegate: self, cancelButtonTitle: "OK")
        alert.show()
        
        //startAutoScroll()
        //stopAutoScroll()
    }
    
    //optional method (show first image faster during downloading of all images)
    func callBackFirstDisplayView(_ imageView: UIImageView, _ url: [String], _ index: Int) {
        
        imageView.kf.setImage(with: URL(string: url[index]), placeholder: UIImage.init(named: "defaultImage"), options: [.transition(.fade(1))], progressBlock: nil, completionHandler: nil)
        
    }
    
    func startAutoScroll() {
        //optional method
        viewForCarousel.startScrollImageView()
        
    }
    
    func stopAutoScroll() {
        //optional method
        viewForCarousel.stopScrollImageView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}



