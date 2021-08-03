//
//  RepositoryListViewModel.swift
//  BitGallery
//
//  Created by Gautam Kumar Singh on 3/8/21.
//

import Foundation

class RepositoryListViewModel{
    let api:API!
    var repositoryList:[RepositoryViewModel]?
    init( api:API) {
        self.api = api
        self.repositoryList = []
    }
    func loadRepository(on completion:@escaping(Int,ApiError?)->()){
        
        let resource = Resource<RepositoryResponse>(urlEndPoint:nil) { data in
            return  try? JSONDecoder().decode(RepositoryResponse.self, from: data)
        }
        
        self.api.load(resource: resource) { [weak self](result, error) in
            guard let self = self else{ return }
            if let response = result{
                self.initialiseRepository(for: response.values)
                completion(ResponseCodes.success,error)
            }else{
                completion(error!.statusCode,error)
            }
        }
    }
    
    func resetRepositoryList(){
        self.repositoryList?.removeAll()
    }
}

extension RepositoryListViewModel{
    fileprivate func initialiseRepository(for values:[RepositoryValues]){
        for value in values {
            let repDetailViewModel = RepositoryViewModel(repoDetail: value)
            self.repositoryList?.append(repDetailViewModel)
        }
    }
}
