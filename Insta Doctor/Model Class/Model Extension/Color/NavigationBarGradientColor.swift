//
//  NavigationBarGradientColor.swift
//
//  Created by Soft Gates on 14/12/19.
//  Copyright © 2019 Soft Gates. All rights reserved.
//

import Foundation

extension UINavigationBar
{
    func setGradientBackground(colors: [Any])
    {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.locations = [0.5 , 0.1] //[0.0 , 0.5, 1.0]
        gradient.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
        
        var updatedFrame = self.bounds
        updatedFrame.size.height += self.frame.origin.y
        gradient.frame = updatedFrame
        gradient.colors = colors;
        self.setBackgroundImage(self.image(fromLayer: gradient), for: .default)
    }
    
    func image(fromLayer layer: CALayer) -> UIImage
    {
        UIGraphicsBeginImageContext(layer.frame.size)
        layer.render(in: UIGraphicsGetCurrentContext()!)
        let outputImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return outputImage!
    }
}

extension CAGradientLayer {
    
    class func primaryGradient(on view: UIView) -> UIImage? {
        let gradient = CAGradientLayer()
        let flareRed = UIColor(displayP3Red: 115.0/255.0, green: 0.0/255.0, blue: 23.0/255.0, alpha: 1.0)
        let flareOrange = UIColor(displayP3Red: 13.0/255.0, green: 23.0/255.0, blue: 48.0/255.0, alpha: 1.0)
        var bounds = view.bounds
        bounds.size.height += UIApplication.shared.statusBarFrame.size.height
        gradient.frame = bounds
        gradient.colors = [flareRed.cgColor, flareOrange.cgColor]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 0)
        return gradient.createGradientImage(on: view)
    }
    
    private func createGradientImage(on view: UIView) -> UIImage? {
        var gradientImage: UIImage?
        UIGraphicsBeginImageContext(view.frame.size)
        if let context = UIGraphicsGetCurrentContext() {
            render(in: context)
            gradientImage = UIGraphicsGetImageFromCurrentImageContext()?.resizableImage(withCapInsets: UIEdgeInsets.zero, resizingMode: .stretch)
        }
        UIGraphicsEndImageContext()
        return gradientImage
    }
}
