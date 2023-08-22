//
//  UIImage+Ex.swift
//  ThisStationIs-iOS
//
//  Created by 심효주 on 2023/08/15.
//

import UIKit

extension UIImage {
    func resized(to size: CGSize) -> UIImage? {
         UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
         self.draw(in: CGRect(origin: .zero, size: size))
         let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
         UIGraphicsEndImageContext()
         return resizedImage
     }
}
