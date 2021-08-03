//
//  RepositoryListViewModelTests.swift
//  BitGalleryTests
//
//  Created by Gautam Kumar Singh on 3/8/21.
//

import XCTest
@testable import BitGallery
class RepositoryListViewModelTests: XCTestCase {

    override func setUp() {
        super.setUp()
        
    }

    override func tearDown()  {

        super.tearDown()
    }
    
    func initiliseRepository(for serverURL:String) -> RepositoryListViewModel{
        return RepositoryListViewModel(api: API.init(server: serverURL))
    }
    
    
    func test_invalid_server(){
        //Given
        let badServerURL = "https://api.bitbucket.org/2.0/repositorie"
        let sut = self.initiliseRepository(for: badServerURL)
        //When
        let exp = expectation(for: NSPredicate(block:{( _, _) -> Bool in
            return sut.repositoryList!.count == 0
        }), evaluatedWith: sut, handler: nil)
        
        sut.loadRepository { statusCode, error in
            //Then
            XCTAssertEqual(statusCode,ResponseCodes.wrongURL)
            XCTAssertEqual(error!.message,"not found")
        }
        wait(for: [exp], timeout: 10)
    }
    
    func test_valid_server(){
        //Given
        let validServerURL = "https://api.bitbucket.org/2.0/repositories"
        let sut = self.initiliseRepository(for: validServerURL)
        //When
        sut.loadRepository { statusCode, error in
            //Then
            XCTAssertEqual(statusCode,ResponseCodes.success)
            XCTAssertEqual(error!.message,"no error")
        }
        let exp = expectation(for: NSPredicate(block:{( _, _) -> Bool in
            return sut.repositoryList!.count > 0
        }), evaluatedWith: sut, handler: nil)
        
        
        wait(for: [exp], timeout: 10)
    }
}
