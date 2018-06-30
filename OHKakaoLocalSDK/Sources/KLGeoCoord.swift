//
//  KLGeoCoord.swift
//  OHKakaoLocalSDK
//
//  Created by Keunhyun Oh on 2018. 6. 24..
//

import Foundation
import CoreLocation

public struct KLGeoCoord {
    
    public var type : KLGeoCoordType
    public var x : Double
    public var y : Double
    
    public init(type: KLGeoCoordType, x: Double, y: Double) {
        self.type = type
        self.x = x
        self.y = y
    }
    
    public init(coordinate2D: CLLocationCoordinate2D) {
        self.type = .WGS84
        self.x = coordinate2D.longitude
        self.y = coordinate2D.latitude
    }
    
    public var typeString: String {
        return type.rawValue
    }
    
    public var xString: String {
        return String(x)
    }
    
    public var yString: String {
        return String(y)
    }
    
}
