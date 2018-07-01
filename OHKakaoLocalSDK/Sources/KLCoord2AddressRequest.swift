//
//  KLCoord2AddressRequest.swift
//  OHKakaoLocalSDK
//
//  Created by Keunhyun Oh on 2018. 7. 1..
//

import Foundation
import Alamofire
import CoreLocation

fileprivate func requestCoord2AddressUrl(inputGeoCoord: KLGeoCoord) -> URL? {
    
    guard let urlFormatString = KLInfo.default.KLCoord2AddressUrl else {
        return nil
    }
    
    let requestUrlString = String(format: urlFormatString,
                                  arguments:[inputGeoCoord.xString,
                                             inputGeoCoord.yString,
                                             inputGeoCoord.typeString])
    
    let url = URL(string: requestUrlString)
    return url
}

public func requestCoord2Address(inputGeoCoord: KLGeoCoord,
                                 kakaoAuthKey: String,
                                 completionHandler: @escaping (KLCoord2AddressResult) -> Void) {
    
    guard let url = requestCoord2AddressUrl(inputGeoCoord: inputGeoCoord) else {
        return
    }
    
    let headers = headerForKL(kakaoAuthKey: kakaoAuthKey)
    
    Alamofire.request(url, headers: headers).responseJSON {
        
        guard let data = $0.data else {
            completionHandler(KLCoord2AddressResult(inputGeoCoord: inputGeoCoord, kakaoAuthKey: kakaoAuthKey, requestUrl: url, dataResponseRaw: $0))
            return
        }

        guard let response = try? JSONDecoder().decode(KLCoord2AddressResponse.self, from: data) else {
            completionHandler(KLCoord2AddressResult(inputGeoCoord: inputGeoCoord, kakaoAuthKey: kakaoAuthKey, requestUrl: url, dataResponseRaw: $0))
            return
        }
        
        completionHandler(KLCoord2AddressResult(inputGeoCoord: inputGeoCoord,
                                                   kakaoAuthKey: kakaoAuthKey,
                                                   requestUrl: url,
                                                   dataResponseRaw: $0,
                                                   response: response))
    }
}

public func requestCoord2Address(coordinate2D: CLLocationCoordinate2D,
                                 kakaoAuthKey: String,
                                 completionHandler: @escaping (KLCoord2AddressResult) -> Void) {
    
    requestCoord2Address(inputGeoCoord: KLGeoCoord(coordinate2D: coordinate2D), kakaoAuthKey: kakaoAuthKey, completionHandler: completionHandler)
}

