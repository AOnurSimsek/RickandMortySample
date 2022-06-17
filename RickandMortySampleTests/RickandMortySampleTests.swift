//
//  RickandMortySampleTests.swift
//  RickandMortySampleTests
//
//  Created by Onur Şimşek on 13.06.2022.
//

import XCTest
@testable import RickandMortySample


class RickandMortySampleTests: XCTestCase {
    
    func testRick() throws {
        let expectation = self.expectation(description: "Fetching query for rick")
        
        let value = CharacterQuery.Data.Character.Result(id: "1",
                                                         name: "Rick Sanchez",
                                                         location: CharacterQuery.Data.Character.Result.Location(name: "Citadel of Ricks"),
                                                         image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg")
        
        Network.shared.apollo.fetch(query: CharacterQuery(page: 1, charaterName: .rick)) { result in
            switch result {
                
            case .success(let graphQLResult):
                if let results = graphQLResult.data?.characters?.results {
                    XCTAssertEqual(value, results.first)
                    expectation.fulfill()
                }

            case .failure( _):
                expectation.fulfill()
                XCTFail("Fetch rick page 1 error")
            }
        }
        
        self.waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testMorty() throws {
        let expectation = self.expectation(description: "Fetching query for morty")
        
        let value = CharacterQuery.Data.Character.Result(id: "2",
                                                         name: "Morty Smith",
                                                         location: CharacterQuery.Data.Character.Result.Location(name: "Citadel of Ricks"),
                                                         image: "https://rickandmortyapi.com/api/character/avatar/2.jpeg")
        
        Network.shared.apollo.fetch(query: CharacterQuery(page: 1, charaterName: .morty)) { result in
            switch result {
                
            case .success(let graphQLResult):
                if let results = graphQLResult.data?.characters?.results {
                    XCTAssertEqual(value, results.first)
                    expectation.fulfill()
                }

            case .failure( _):
                expectation.fulfill()
                XCTFail("Fetch rick page 1 error")
            }
        }
        
        self.waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testBoth() throws {
        let expectation = self.expectation(description: "Fetching query for morty")
        
        let value = CharacterQuery.Data.Character.Result(id: "1",
                                                         name: "Rick Sanchez",
                                                         location: CharacterQuery.Data.Character.Result.Location(name: "Citadel of Ricks"),
                                                         image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg")
        
        Network.shared.apollo.fetch(query: CharacterQuery(page: 1, charaterName: .both)) { result in
            switch result {
                
            case .success(let graphQLResult):
                if let results = graphQLResult.data?.characters?.results {
                    XCTAssertEqual(value, results.first)
                    expectation.fulfill()
                }

            case .failure( _):
                expectation.fulfill()
                XCTFail("Fetch rick page 1 error")
            }
        }
        
        self.waitForExpectations(timeout: 5, handler: nil)
    }
}
