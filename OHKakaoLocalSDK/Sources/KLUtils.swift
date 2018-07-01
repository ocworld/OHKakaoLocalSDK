//
//  KLUtils.swift
//  OHKakaoLocalSDK
//
//  Created by Keunhyun Oh on 2018. 6. 24..
//

import Foundation
import Alamofire

func headerForKL(kakaoAuthKey: String) -> HTTPHeaders {
    return ["Authorization": "KakaoAK " + kakaoAuthKey]
}
