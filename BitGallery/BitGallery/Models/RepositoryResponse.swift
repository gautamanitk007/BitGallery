//
//  RepositoryResponse.swift
//  BitGallery
//
//  Created by Gautam Kumar Singh on 3/8/21.
//

import Foundation

struct RepositoryValues: Decodable {
    let scm:String
    let website:String
    let uuid :String
    let full_name :String
    
}
struct RepositoryResponse: Decodable {
    let pagelen: Int
    let values: [RepositoryValues]
}
