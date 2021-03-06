//
//  KLGeoTranscoordRequest.swift
//  OHKakaoLocalSDK
//
//  Created by Keunhyun Oh on 2018. 6. 24..
//

import Foundation
import Alamofire
import CoreLocation

fileprivate func requestTransCoordUrl(inputCoord: KLGeoCoord, outputCoordType: KLGeoCoordType) -> URL? {
    
    guard let urlFormatString = KLInfo.default.KLGeoTranscoordUrl else {
        return nil
    }
    
    let requestUrlString = String(format: urlFormatString,
                                          arguments:[inputCoord.xString, inputCoord.yString, inputCoord.typeString, outputCoordType.rawValue])
    
    let url = URL(string: requestUrlString)
    return url
}

public func requestTransCoord(inputCoord: KLGeoCoord,
                              outputCoordType: KLGeoCoordType,
                              kakaoAuthKey: String,
                              completionHandler: @escaping (KLGeoTransCoordResult) -> Void) {
    
    guard let url = requestTransCoordUrl(inputCoord: inputCoord, outputCoordType: outputCoordType) else {
        return
    }
    
    let headers = headerForKL(kakaoAuthKey: kakaoAuthKey)
    
    Alamofire.request(url, headers: headers).responseJSON {
        
        guard let data = $0.data else {
            completionHandler(KLGeoTransCoordResult(inputCoord: inputCoord, kakaoAuthKey: kakaoAuthKey, requestUrl: url, dataResponseRaw: $0))
            return
        }
        
        guard let response = try? JSONDecoder().decode(KLGeoTranscoordResponse.self, from: data) else {
            completionHandler(KLGeoTransCoordResult(inputCoord: inputCoord, kakaoAuthKey: kakaoAuthKey, requestUrl: url, dataResponseRaw: $0))
            return
        }
        
        let outputCoord = KLGeoCoord(type: outputCoordType,
                                     x: response.documents[0].x,
                                     y: response.documents[0].y)
        
        completionHandler(KLGeoTransCoordResult(inputCoord: inputCoord,
                                                kakaoAuthKey: kakaoAuthKey,
                                                requestUrl: url,
                                                dataResponseRaw: $0,
                                                response: response,
                                                outputCoord: outputCoord))
    }
}

public func requestTransCoordWGS84ToWTM(coordinate2D: CLLocationCoordinate2D,
                                       kakaoAuthKey: String,
                                       completionHandler: @escaping (KLGeoTransCoordResult) -> Void) {
    
    requestTransCoord(inputCoord: coordinate2D.klGeoCoord, outputCoordType: .WTM, kakaoAuthKey: kakaoAuthKey, completionHandler: completionHandler)
    
}

public func requestTransCoordWGS84ToTM(coordinate2D: CLLocationCoordinate2D,
                                       kakaoAuthKey: String,
                                       completionHandler: @escaping (KLGeoTransCoordResult) -> Void) {
    
    requestTransCoord(inputCoord: KLGeoCoord(coordinate2D: coordinate2D), outputCoordType: .TM, kakaoAuthKey: kakaoAuthKey, completionHandler: completionHandler)
    
}
