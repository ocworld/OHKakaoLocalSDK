//
//  KLUtils.swift
//  OHKakaoLocalSDK
//
//  Created by Keunhyun Oh on 2018. 6. 24..
//

import Foundation
import CoreLocation
import Alamofire

fileprivate let KLBundleIdentifier = "org.cocoapods.OHKakaoLocalSDK"
fileprivate let KLInfoPlistName = "KakaoLocalInfo"

/// urlFormatString - KakaoLocal에서 사용하는 url format key를 plist에서 읽어서 반환함
///
/// - Parameter keyName: plist에 적혀있는 url의 키. url은 info.plist의 AKService의 AKUrls 하위에 있다.
/// - Returns: 성공하면 urlFormat이 반환된다. 실패하면 nil이 반환된다.
func urlFormatString(keyName: String) -> String? {
    
    guard let bundle = Bundle(identifier: KLBundleIdentifier) else {
        return nil
    }
    
    guard let infoPath = bundle.path(forResource: KLInfoPlistName, ofType: "plist") else {
        return nil
    }
    
    guard let info = NSDictionary(contentsOfFile: infoPath) as? Dictionary<String, Any> else {
        return nil
    }
    
    guard let urls = info["KakaoUrls"] as? Dictionary<String, String> else {
        return nil
    }
    
    guard let url = urls[keyName] else {
        return nil
    }
    
    return url
    
}

func headerForKL(kakaoAuthKey: String) -> HTTPHeaders {
    return ["Authorization": "KakaoAK " + kakaoAuthKey]
}
