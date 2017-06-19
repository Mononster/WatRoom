//
//  Extensions.swift
//  WatRoom
//
//  Created by Ali Ajmine on 6/6/17.
//  Copyright © 2017 Monster. All rights reserved.
//

import Foundation
import UIKit
import MapKit

extension String {
    
    func localized() -> String {
        return NSLocalizedString(self, comment: "")
    }
    
    func localizedWithArgs(_ arguments: CVarArg...) -> String {
        return String(format: localized(), arguments)
    }
    
    var coordinates: CLLocationCoordinate2D {
        
        func locationDegree(fromString location: String) -> CLLocationDegrees? {
            
            guard let locationDouble = Double(location) else {
                var temp = location
                temp.remove(at: location.startIndex)
                
                return Double(temp) ?? 0 * -1
            }
            
            return locationDouble
        }
        
        let locationComponents = self.components(separatedBy: ",")
        
        guard let latString = locationComponents.first, let longString = locationComponents.last, let lat = locationDegree(fromString: latString), let long = locationDegree(fromString: longString) else {
            return CLLocationCoordinate2D()
        }
        
        return CLLocationCoordinate2D(latitude: lat, longitude: long)
    }
}

extension UIStoryboard {
    
    class var main: UIStoryboard {
        return UIStoryboard.init(name: "Main", bundle: nil)
    }
}


extension UIColor {
    
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(netHex:Int) {
        self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff)
    }
}

extension Int {
    
    var bool: Bool {
        return self >= 1
    }
}

extension MKMapView {
    
    func removeAllAnnotations() {
        self.removeAnnotations(self.annotations)
    }
}


