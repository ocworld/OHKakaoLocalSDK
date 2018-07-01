//
//  KLInfo.swift
//  OHKakaoLocalSDK
//
//  Created by Keunhyun Oh on 2018. 7. 1..
//

import Foundation

fileprivate let KLBundleIdentifier = "org.cocoapods.OHKakaoLocalSDK"
fileprivate let KLInfoPlistName = "KakaoLocalInfo"

struct KLInfo: Codable {
    var KakaoUrls: [String:String]
}

extension KLInfo {
    
    var KLCoord2AddressUrl: String? {
        return KakaoUrls["KLCoord2AddressUrl"]
    }
    
    var KLCoord2RegionCodeUrl: String? {
        return KakaoUrls["KLCoord2RegionCodeUrl"]
    }
    
    var KLSearchAddressUrl: String? {
        return KakaoUrls["KLSearchAddressUrl"]
    }
    
    var KLGeoTranscoordUrl: String? {
        return KakaoUrls["KLGeoTranscoordUrl"]
    }
    
}

extension KLInfo {
    
    static let `default` : KLInfo = {
        guard let bundle = Bundle(identifier: KLBundleIdentifier) else {
            return KLInfo(KakaoUrls: [:])
        }
        
        guard let infoUrl = bundle.url(forResource: KLInfoPlistName, withExtension: "plist") else {
            return KLInfo(KakaoUrls: [:])
        }
        
        guard let data = try? Data(contentsOf: infoUrl) else {
            return KLInfo(KakaoUrls: [:])
        }
        
        let decoder = PropertyListDecoder()
        guard let klInfo = try? decoder.decode(KLInfo.self, from: data) else {
            return KLInfo(KakaoUrls: [:])
        }
        
        return klInfo
    }()
    
}
