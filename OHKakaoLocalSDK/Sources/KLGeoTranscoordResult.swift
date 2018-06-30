//
//  KLGeoTransCoordResult.swift
//  OHKakaoLocalSDK
//
//  Created by Keunhyun Oh on 2018. 6. 24..
//

import Foundation
import Alamofire

public struct KLGeoTransCoordResult {
    
    public let inputCoord: KLGeoCoord
    public let kakaoAuthKey: String
    public let requestUrl: URL
    public let dataResponseRaw: Alamofire.DataResponse<Any>
    public let response: KLGeoTranscoordResponse?
    public let outputCoord: KLGeoCoord?
    
    public init(inputCoord: KLGeoCoord,
                kakaoAuthKey: String,
                requestUrl: URL,
                dataResponseRaw: Alamofire.DataResponse<Any>,
                response: KLGeoTranscoordResponse? = nil,
                outputCoord: KLGeoCoord? = nil) {
        self.inputCoord = inputCoord
        self.kakaoAuthKey = kakaoAuthKey
        self.requestUrl = requestUrl
        self.dataResponseRaw = dataResponseRaw
        self.response = response
        self.outputCoord = outputCoord
    }
}
