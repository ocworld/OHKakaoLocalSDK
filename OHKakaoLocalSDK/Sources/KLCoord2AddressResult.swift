//
//  KLCoord2AddressResult.swift
//  OHKakaoLocalSDK
//
//  Created by Keunhyun Oh on 2018. 7. 1.
//

import Foundation
import Alamofire

public struct KLCoord2AddressResult {
    public let inputGeoCoord: KLGeoCoord
    public var kakaoAuthKey: String
    public var requestUrl: URL
    public var dataResponseRaw: Alamofire.DataResponse<Any>
    public var response: KLCoord2AddressResponse?
    
    public init(inputGeoCoord: KLGeoCoord,
                kakaoAuthKey: String,
                requestUrl: URL,
                dataResponseRaw: Alamofire.DataResponse<Any>,
                response: KLCoord2AddressResponse? = nil) {
        self.inputGeoCoord = inputGeoCoord
        self.kakaoAuthKey = kakaoAuthKey
        self.requestUrl = requestUrl
        self.dataResponseRaw = dataResponseRaw
        self.response = response
    }
}
