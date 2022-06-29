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
        
        
        Network.shared.apollo.fetch(query: CharacterQuery(page: 1, name: CharacterNames.rick.description)) { result in
            switch result {
                
            case .success(let graphQLResult):
                
                XCTAssertNotNil(graphQLResult.data?.characters?.results)
                XCTAssertGreaterThanOrEqual(graphQLResult.data?.characters?.results?.count ?? 0, 1)
                
                if let results = graphQLResult.data?.characters?.results {
                    let randomInt = Int.random(in: 0...results.count)
                    let selectedRandomValue = results[randomInt]
                    let randomValueName = selectedRandomValue?.name?.lowercased()
                    XCTAssertTrue(randomValueName?.contains("rick") ?? false)
                    
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
        
        Network.shared.apollo.fetch(query: CharacterQuery(page: 1, name: CharacterNames.morty.description)) { result in
            switch result {
                
            case .success(let graphQLResult):
                XCTAssertNotNil(graphQLResult.data?.characters?.results)
                XCTAssertGreaterThanOrEqual(graphQLResult.data?.characters?.results?.count ?? 0, 1)
                
                if let results = graphQLResult.data?.characters?.results {
                    let randomInt = Int.random(in: 0...results.count)
                    let selectedRandomValue = results[randomInt]
                    let randomValueName = selectedRandomValue?.name?.lowercased()
                    XCTAssertTrue(randomValueName?.contains("morty") ?? false)
                    
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
        let expectation = self.expectation(description: "Fetching query for both")
        
        Network.shared.apollo.fetch(query: CharacterQuery(page: 1, name: CharacterNames.both.description)) { result in
            switch result {
                
            case .success(let graphQLResult):
                XCTAssertNotNil(graphQLResult.data?.characters?.results)
                XCTAssertGreaterThanOrEqual(graphQLResult.data?.characters?.results?.count ?? 0, 1)
                
                if let results = graphQLResult.data?.characters?.results {
                    
                    expectation.fulfill()
                }

            case .failure( _):
                expectation.fulfill()
                XCTFail("Fetch both page 1 error")
            }
        }
        
        self.waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testSummer() throws {
        let expectation = self.expectation(description: "Fetching query for summer")
        
        Network.shared.apollo.fetch(query: CharacterQuery(page: 1, name: CharacterNames.summer.description)) { result in
            switch result {
                
            case .success(let graphQLResult):
                XCTAssertNotNil(graphQLResult.data?.characters?.results)
                XCTAssertGreaterThanOrEqual(graphQLResult.data?.characters?.results?.count ?? 0, 1)
                
                if let results = graphQLResult.data?.characters?.results {
                    let randomInt = Int.random(in: 0...results.count)
                    let selectedRandomValue = results[randomInt]
                    let randomValueName = selectedRandomValue?.name?.lowercased()
                    XCTAssertTrue(randomValueName?.contains("summer") ?? false)
                    
                    expectation.fulfill()
                }

            case .failure( _):
                expectation.fulfill()
                XCTFail("Fetch summer page 1 error")
            }
        }
        
        self.waitForExpectations(timeout: 5, handler: nil)
    }
    
    
}
