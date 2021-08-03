//
//  Constants.swift
//  BitGallery
//
//  Created by Gautam Kumar Singh on 3/8/21.
//

import Foundation

struct ResponseCodes {
    static let success = 200
    static let badrequest = 400
    static let wrongURL = 404
    static let network_timeout = -1001
    static let server_notReachable = -1003
    static let server_problem = 500
    static let server_down = 503
    
}
enum SegueIdentifier:String {
    case ShowRepositoryListSegue = "showRepositoryListSegue"

   
}
enum Identifier:String {
    case GeneralCellIdentifier = "GeneralCelli"
}
