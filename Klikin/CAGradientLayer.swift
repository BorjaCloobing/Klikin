
import UIKit

extension CAGradientLayer {
    func blackColor() -> CAGradientLayer{
        //let topColor = UIColor( red: (255/255.0), green: (255/255.0), blue: (255/255.0), alpha: 1)
        let topColor = UIColor.clear
        let bottomColor = UIColor( red: (0/255.0), green: (0/255.0), blue: (0/255.0), alpha: 1)
        
        let gradientColors: [CGColor] = [topColor.cgColor, bottomColor.cgColor]
        let gradientLocations: [Float] = [0.0, 1.0]
        
        let gradientLayer: CAGradientLayer = CAGradientLayer()
        gradientLayer.colors = gradientColors
        gradientLayer.locations = gradientLocations as [NSNumber]?
        
        return gradientLayer
    }
    func blackColorINV() -> CAGradientLayer{
        //let topColor = UIColor( red: (255/255.0), green: (255/255.0), blue: (255/255.0), alpha: 1)
        //let topColor = UIColor( red: (0/255.0), green: (0/255.0), blue: (0/255.0), alpha: 1)
        let topColor = UIColor.darkGray
        let bottomColor = UIColor.clear
        let gradientColors: [CGColor] = [topColor.cgColor, bottomColor.cgColor]
        let gradientLocations: [Float] = [0.0, 1.0]
        
        let gradientLayer: CAGradientLayer = CAGradientLayer()
        gradientLayer.colors = gradientColors
        gradientLayer.locations = gradientLocations as [NSNumber]?
        
        return gradientLayer
    }

}
