//
//  HomeViewModelTests.swift
//  GoldmanSachsTaskTests
//
//  Created by ggajulapati on 08/08/22.
//

import XCTest
@testable import GoldmanSachsTask

class HomeViewModelTests: XCTestCase {
    
    let viewModel = HomeViewModel()

    override func setUp() {
        viewModel.networkInterface = MockNetworkInterface()
    }
    
    func testAstronomyImagesListData() {
        let weatherDetailsEexpectation = expectation(description: "Get Weather Details expectation")
        viewModel.AstronomyImagesListData(serviceUrl: "AstronomyImagesListData") { [weak self] (success, error) in
            if success {
                print("data",self?.viewModel.astronomyImagesArray)
                weatherDetailsEexpectation.fulfill()
            } else {
                XCTFail()
            }
        }
        waitForExpectations(timeout: 10, handler: nil)
    }
    
    func setAstronomyImagesData()   {
        XCTAssertNotNil(viewModel.astronomyImagesArray)
       // return 10
    }
    
    func testgetNmberOfAstronomyImagesCount()   {
        XCTAssertNotNil(viewModel.astronomyImagesArray)
    }
    
    func testScreenTitle() {
        XCTAssertEqual(Constants.Titles.home_screen_title, "HOME")
    }
    
    override func tearDown() {
        
    }
}
