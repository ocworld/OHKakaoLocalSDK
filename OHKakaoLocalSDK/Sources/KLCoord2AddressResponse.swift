//
//  KLCoord2AddressResponse.swift
//  OHKakaoLocalSDK
//
//  Created by Keunhyun Oh on 2018. 7. 1.
//

import Foundation

//https://developers.kakao.com/docs/restapi/local

public struct KLCoord2AddressResponse : Codable {
    public var meta: KLCoord2AddressResponseMeta
    public var documents: [KLCoord2AddressResponseDocument]
}

public struct KLCoord2AddressResponseMeta : Codable {
    public var total_count: Int
}

public struct KLCoord2AddressResponseDocument : Codable {
    public var road_address: KLCoord2AddressResponseDocumentRoadAddress
    public var address: KLCoord2AddressResponseDocumentAddress
}

public struct KLCoord2AddressResponseDocumentRoadAddress : Codable {
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
}

public struct KLCoord2AddressResponseDocumentAddress : Codable {
    public var address_name: String
    public var region_1depth_name: String
    public var region_2depth_name: String
    public var region_3depth_name: String
    public var mountain_yn: String
    public var main_address_no: String
    public var sub_address_no: String
    public var zip_code: String
}
