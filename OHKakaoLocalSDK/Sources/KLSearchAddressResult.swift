//
//  KLSearchAddressResult.swift
//  OHKakaoLocalSDK
//
//  Created by Keunhyun Oh on 2018. 6. 24..
//

import Foundation
import Alamofire

public struct KLSearchAddressResult {
    
    public let query: String
    public let page: Int
    public let size: Int
    public var kakaoAuthKey: String
    public var requestUrl: URL
    public var dataResponseRaw: Alamofire.DataResponse<Any>
    public var response: KLSearchAddressResponse?
    
    public init(query: String,
                page: Int,
                size: Int,
                kakaoAuthKey: String,
                requestUrl: URL,
                dataResponseRaw: Alamofire.DataResponse<Any>,
                response: KLSearchAddressResponse? = nil) {
        self.query = query
        self.page = page
        self.size = size
        self.kakaoAuthKey = kakaoAuthKey
        self.requestUrl = requestUrl
        self.dataResponseRaw = dataResponseRaw
        self.response = response
    }
}
