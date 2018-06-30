//
//  CLLocationCoordinate2D+KLGeoCoord.swift
//  OHKakaoLocalSDK
//
//  Created by Keunhyun Oh on 2018. 6. 24..
//

import Foundation
import CoreLocation

extension CLLocationCoordinate2D {
    public init?(klGeoCoord: KLGeoCoord) {
        guard klGeoCoord.type == .WGS84 else {
            return nil
        }
        
        self.init(latitude: klGeoCoord.y, longitude: klGeoCoord.x)
    }
    
    public var klGeoCoord: KLGeoCoord {
        return KLGeoCoord(coordinate2D: self)
    }
}
