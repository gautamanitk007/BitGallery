//
//  API.swift
//  BitGallery
//
//  Created by Gautam Kumar Singh on 3/8/21.
//

import Foundation

struct Resource<T>{
    let urlEndPoint:String?
    let parse:(Data) -> T?
}

struct ApiError{
    let statusCode:Int
    let message:String?
}


class API{
    let server:String
    init(server:String) {
        self.server = server
    }
}

//MARK: - Common methods
extension API {
    func load<T>(resource:Resource<T>,completion:@escaping(T?,ApiError?)->()){
        var request = URLRequest(url: URL(string: self.server)!)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
   
        URLSession.shared.dataTask(with: request) { data, response, error in
            var sError : ApiError?
            if let resp = response as? HTTPURLResponse{
                sError = ApiError(statusCode: resp.statusCode, message: HTTPURLResponse.localizedString(forStatusCode: resp.statusCode))
            }
            DispatchQueue.main.async {
                if let data = data {
                    let jsonResponse = try? JSONSerialization.jsonObject(with: data, options: [])
                    print(jsonResponse as Any)
                    completion(resource.parse(data),sError)
                }else{
                    if let err = sError {
                        completion(nil,err)
                    }else{
                        completion(nil,ApiError(statusCode: -1009, message: error?.localizedDescription))
                    }
                }
            }
        }.resume()
    }
}
