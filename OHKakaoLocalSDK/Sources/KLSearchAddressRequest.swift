//
//  KLSearchAddressRequest.swift
//  OHKakaoLocalSDK
//
//  Created by Keunhyun Oh on 2018. 6. 30..
//

import Foundation
import Alamofire

fileprivate func requestSearchAddressUrl(query: String, page: Int, size: Int) -> URL? {
    
    guard let urlFormatString = urlFormatString(keyName: "KLSearchAddressUrl") else {
        return nil
    }
    
    let requestUrlString = String(format: urlFormatString,
                                  arguments:[query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!, String(page), String(size)])
    
    let url = URL(string: requestUrlString)
    return url
}

public func requestSearchAddress(query: String,
                                 page: Int,
                                 size: Int,
                                 kakaoAuthKey: String,
                                 completionHandler: @escaping (KLSearchAddressResult) -> Void) {
    
    guard let url = requestSearchAddressUrl(query: query, page: page, size: size) else {
        return
    }
    
    let headers = headerForKL(kakaoAuthKey: kakaoAuthKey)
    
    Alamofire.request(url, headers: headers).responseJSON {
        
        guard let data = $0.data else {
            completionHandler(KLSearchAddressResult(query: query, page: page, size: size, kakaoAuthKey: kakaoAuthKey, requestUrl: url, dataResponseRaw: $0))
            return
        }
        
        guard let response = try? JSONDecoder().decode(KLSearchAddressResponse.self, from: data) else {
            completionHandler(KLSearchAddressResult(query: query, page: page, size: size, kakaoAuthKey: kakaoAuthKey, requestUrl: url, dataResponseRaw: $0))
            return
        }
        
        completionHandler(KLSearchAddressResult(query: query,
                                                page: page,
                                                size: size,
                                                kakaoAuthKey: kakaoAuthKey,
                                                requestUrl: url,
                                                dataResponseRaw: $0,
                                                response: response))
    }
}
