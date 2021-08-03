//
//  RepositoryResponse.swift
//  BitGallery
//
//  Created by Gautam Kumar Singh on 3/8/21.
//

import Foundation

struct Workspace:Decodable{
    let links:Links
    let name:String
    let type:String
    let uuid:String
    let slug:String
}

struct Project:Decodable{
    let key:String
    let links:Links
    let name:String
    let type:String
    let uuid:String
}

struct Owner:Decodable{
    let display_name:String
    let links:Links
    let type:String
    let uuid:String
}

struct Links:Decodable{
    let avatar:Avatar
    let html:HTML
}

struct Avatar:Decodable{
    let href:String
}
struct HTML:Decodable{
    let href:String
}

struct RepositoryValues: Decodable {
    let scm:String
    let name:String
    let fork_policy:String
    let uuid :String
    let full_name :String
    let created_on:String
    let updated_on:String
    let workspace:Workspace
    let project:Project
    let owner:Owner
    let links:Links
}
struct RepositoryResponse: Decodable {
    let pagelen: Int
    let values: [RepositoryValues]
}
