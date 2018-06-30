//
//  KLSearchAddressResponse.swift
//  OHKakaoLocalSDK
//
//  Created by Keunhyun Oh on 2018. 6. 24..
//

import Foundation
import CoreLocation

//https://developers.kakao.com/docs/restapi/local

public struct KLSearchAddressResponse : Codable {
    public var meta: KLGeoTranscoordResponseMeta
    public var documents: [KLSearchAddressResponseDocument]
}

public struct KLSearchAddressResponseMeta : Codable {
    public var total_count: Int
    public var pageable_count: Int
    public var is_end: Bool
}

public struct KLSearchAddressResponseDocument : Codable {
    public var address_name: String
    public var y: Double
    public var x: Double
    public var address_type: String
    public var address: KLSearchAddressResponseDocumentAddress
    public var road_address: KLSearchAddressResponseDocumentRoadAddress
}

public struct KLSearchAddressResponseDocumentAddress : Codable {
    public var address_name: String
    public var region_1depth_name: String
    public var region_2depth_name: String
    public var region_3depth_name: String
    public var region_3depth_h_name: String
    public var h_code: String
    public var b_code: String
    public var mountain_yn: String
    public var main_address_no: String
    public var sub_address_no: String
    public var zip_code: String
    public var x: String
    public var y: String
}

public struct KLSearchAddressResponseDocumentRoadAddress : Codable {
    public var address_name: String
    public var region_1depth_name: String
    public var region_2depth_name: String
    public var region_3depth_name: String
    public var road_name: String
    public var underground_yn: String
    public var main_building_no: String
    public var sub_building_no: String
    public var building_name: String
    public var zone_no: String
    public var x: String
    public var y: String
}
