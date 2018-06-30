//
//  KLGeoTranscoordResponse.swift
//  OHKakaoLocalSDK
//
//  Created by Keunhyun Oh on 2018. 6. 24..
//

import Foundation
import CoreLocation

public struct KLGeoTranscoordResponse : Codable {
    public var meta: KLGeoTranscoordResponseMeta
    public var documents: [KLGeoTranscoordResponseDocuments]
}

public struct KLGeoTranscoordResponseMeta : Codable {
    public var total_count: Int
}

public struct KLGeoTranscoordResponseDocuments : Codable {
    public var x: Double
    public var y: Double
}

/*
{
    "meta": {
        "total_count": 1
    },
    "documents": [
    {
    "x": 126.57740680000002,
    "y": 33.453357700000005
    }
    ]
}
*/
