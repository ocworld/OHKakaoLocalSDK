//
//  KLCoord2RegionCodeRequest.swift
//  OHKakaoLocalSDK
//
//  Created by Keunhyun Oh on 2018. 6. 30..
//

import Foundation
import Alamofire
import CoreLocation

fileprivate func requestCoord2RegionCodeUrl(inputGeoCoord: KLGeoCoord,
                                            outputGeoCoordType: KLGeoCoordType,
                                            lang: KLCoord2RegionCodeLangType) -> URL? {
    
    guard let urlFormatString = KLInfo.default.KLCoord2RegionCodeUrl else {
        return nil
    }
    
    let requestUrlString = String(format: urlFormatString,
                                  arguments:[inputGeoCoord.xString,
                                             inputGeoCoord.yString,
                                             inputGeoCoord.typeString,
                                             outputGeoCoordType.rawValue,
                                             lang.rawValue])
    
    let url = URL(string: requestUrlString)
    return url
}

public func requestCoord2RegionCode(inputGeoCoord: KLGeoCoord,
                                    outputGeoCoordType: KLGeoCoordType,
                                    lang: KLCoord2RegionCodeLangType,
                                    kakaoAuthKey: String,
                                    completionHandler: @escaping (KLCoord2RegionCodeResult) -> Void) {
    
    guard let url = requestCoord2RegionCodeUrl(inputGeoCoord: inputGeoCoord, outputGeoCoordType: outputGeoCoordType, lang: lang) else {
        return
    }
    
    let headers = headerForKL(kakaoAuthKey: kakaoAuthKey)
    
    Alamofire.request(url, headers: headers).responseJSON {
        
        guard let data = $0.data else {
            completionHandler(KLCoord2RegionCodeResult(inputGeoCoord: inputGeoCoord, outputGeoCoordType: outputGeoCoordType, lang: lang, kakaoAuthKey: kakaoAuthKey, requestUrl: url, dataResponseRaw: $0))
            return
        }
        
        guard let response = try? JSONDecoder().decode(KLCoord2RegionCodeResponse.self, from: data) else {
            completionHandler(KLCoord2RegionCodeResult(inputGeoCoord: inputGeoCoord, outputGeoCoordType: outputGeoCoordType, lang: lang, kakaoAuthKey: kakaoAuthKey, requestUrl: url, dataResponseRaw: $0))
            return
        }
        
        completionHandler(KLCoord2RegionCodeResult(inputGeoCoord: inputGeoCoord,
                                                   outputGeoCoordType: outputGeoCoordType,
                                                   lang: lang,
                                                   kakaoAuthKey: kakaoAuthKey,
                                                   requestUrl: url,
                                                   dataResponseRaw: $0,
                                                   response: response))
    }
}

public func requestCoord2RegionCode(coordinate2D: CLLocationCoordinate2D,
                                    lang: KLCoord2RegionCodeLangType,
                                    kakaoAuthKey: String,
                                    completionHandler: @escaping (KLCoord2RegionCodeResult) -> Void) {
    
    requestCoord2RegionCode(inputGeoCoord: KLGeoCoord(coordinate2D: coordinate2D), outputGeoCoordType: .WGS84, lang: lang, kakaoAuthKey: kakaoAuthKey, completionHandler: completionHandler)
}

public func requestCoord2RegionCode(coordinate2D: CLLocationCoordinate2D,
                                    kakaoAuthKey: String,
                                    completionHandler: @escaping (KLCoord2RegionCodeResult) -> Void) {
    
    requestCoord2RegionCode(coordinate2D: coordinate2D, lang: .default, kakaoAuthKey: kakaoAuthKey, completionHandler: completionHandler)
}
