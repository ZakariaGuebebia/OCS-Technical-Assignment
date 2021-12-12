//
//  UIImageViewExtension.swift
//  OCS
//
//  Created by Zakaria on 12/12/2021.
//

import UIKit
import SDWebImage
extension UIImageView {

//    public func setTintedImage(image: UIImage) {
//        let tintedImage = image.withRenderingMode(.alwaysTemplate)
//        self.image = tintedImage
//    }
//
//    public func setTintedImage(image: UIImage, color: UIColor) {
//        let tintedImage = image.withRenderingMode(.alwaysTemplate)
//        self.image = tintedImage
//        self.tintColor = color
//    }
//
//    /// Returns a rect that can be applied to the image view to clip to the image, assuming a scale aspect fit content mode.
//    var contentClippingRect: CGRect {
//        guard let image = image, contentMode == .scaleAspectFill else { return bounds }
//
//        let imageWidth = image.size.width
//        let imageHeight = image.size.height
//        guard imageWidth > 0 && imageHeight > 0 else { return bounds }
//
//        let scale: CGFloat
//        if imageWidth > imageHeight {
//            scale = bounds.size.width / imageWidth
//        } else {
//            scale = bounds.size.height / imageHeight
//        }
//
//        let clippingSize = CGSize(width: (imageWidth * scale ), height: (imageHeight * scale))
//        let x = (bounds.size.width - clippingSize.width) / 2.0
//        let y = (bounds.size.height - clippingSize.height) / 2.0
//        return CGRect(origin: CGPoint(x: x, y: y), size: clippingSize)
//    }
//
//    func loadGif(resourceName: String) {
//        guard let path = Bundle.main.path(forResource: resourceName, ofType: "gif") else {
//            print("Gif does not exist at that path")
//            return
//        }
//        let url = URL(fileURLWithPath: path)
//        guard let gifData = try? Data(contentsOf: url),
//            let source =  CGImageSourceCreateWithData(gifData as CFData, nil) else { return  }
//        var images = [UIImage]()
//        let imageCount = CGImageSourceGetCount(source)
//        for index in 0 ..< imageCount {
//            if let image = CGImageSourceCreateImageAtIndex(source, index, nil) {
//                images.append(UIImage(cgImage: image))
//            }
//        }
//        self.animationImages = images
//
//        self.animationDuration = 1
//
//        self.startAnimating()
//    }
    func setImage(withString: String, placeholderImage: UIImage?) {
        let url = URL(string: withString)
        self.sd_setImage(with: url, placeholderImage: placeholderImage)
    }

    // round ImageVIew
//
//    func roundImage(_ imagePicked: UIImage?) {
//
//        self.image = imagePicked
//        self.contentMode = .scaleAspectFill
//        self.layer.masksToBounds = true
//        self.layer.cornerRadius =  self.frame.size.width / 2
//        self.layer.borderWidth = 0.5
//        self.layer.borderColor = UIColor.lightGray.cgColor
//    }
//
//    func roundedImageWithBorder(width: CGFloat = 0.0, color: UIColor = .clear) {
//        self.layoutIfNeeded()
//        self.contentMode = .scaleAspectFill
//        self.layer.cornerRadius = self.frame.width/2
//        self.layer.masksToBounds = true
//        self.layer.borderWidth = width
//        self.layer.borderColor = color.cgColor
//    }

}
