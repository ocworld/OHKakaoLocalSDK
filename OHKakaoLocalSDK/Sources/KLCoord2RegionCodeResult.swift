//
//  KLCoord2RegionCodeResult.swift
//  OHKakaoLocalSDK
//
//  Created by Keunhyun Oh on 2018. 6. 30.
//

import Foundation
import Alamofire

public struct KLCoord2RegionCodeResult {
    public let inputGeoCoord: KLGeoCoord
    public let outputGeoCoordType: KLGeoCoordType
    public let lang: KLCoord2RegionCodeLangType
    public var kakaoAuthKey: String
    public var requestUrl: URL
    public var dataResponseRaw: Alamofire.DataResponse<Any>
    public var response: KLCoord2RegionCodeResponse?
    
    public init(inputGeoCoord: KLGeoCoord,
                outputGeoCoordType: KLGeoCoordType,
                lang: KLCoord2RegionCodeLangType,
                kakaoAuthKey: String,
                requestUrl: URL,
                dataResponseRaw: Alamofire.DataResponse<Any>,
                response: KLCoord2RegionCodeResponse? = nil) {
        self.inputGeoCoord = inputGeoCoord
        self.outputGeoCoordType = outputGeoCoordType
        self.lang = lang
        self.kakaoAuthKey = kakaoAuthKey
        self.requestUrl = requestUrl
        self.dataResponseRaw = dataResponseRaw
        self.response = response
    }
}
