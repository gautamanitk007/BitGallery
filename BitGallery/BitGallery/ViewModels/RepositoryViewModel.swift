//
//  RepositoryViewModel.swift
//  BitGallery
//
//  Created by Gautam Kumar Singh on 3/8/21.
//

import Foundation


class RepositoryViewModel{
    
    let fullName:String
    let uuId:String
    init( repoDetail:RepositoryValues) {
        self.fullName = repoDetail.full_name
        self.uuId = repoDetail.full_name
    }
    
}
