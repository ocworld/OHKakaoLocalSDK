//
//  KLCoord2RegionCodeResponse.swift
//  OHKakaoLocalSDK
//
//  Created by Keunhyun Oh on 2018. 6. 30.
//

import Foundation

//https://developers.kakao.com/docs/restapi/local

public struct KLCoord2RegionCodeResponse : Codable {
    public var meta: KLCoord2RegionCodeResponseMeta
    public var documents: [KLCoord2RegionCodeResponseDocument]
}

public struct KLCoord2RegionCodeResponseMeta : Codable {
    public var total_count: Int
}

public struct KLCoord2RegionCodeResponseDocument : Codable {
    public var region_type: String
    public var address_name: String
    public var region_1depth_name: String
    public var region_2depth_name: String
    public var region_3depth_name: String
    public var region_4depth_name: String
    public var code: String
    public var x: Double
    public var y: Double
}

extension KLCoord2RegionCodeResponseDocument {
    
    public var xString: String {
        return String(x)
    }
    
    public var yString: String {
        return String(y)
    }
    
    public var xDouble: Double {
        return x
    }
    
    public var yDouble: Double {
        return y
    }
    
}
