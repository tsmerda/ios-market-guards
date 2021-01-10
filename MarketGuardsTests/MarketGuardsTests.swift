//
//  MarketGuardsTests.swift
//  MarketGuardsTests
//
//  Created by Tomáš Šmerda on 09.12.2020.
//  Copyright © 2020 Gamifika, s.r.o. All rights reserved.
//

import XCTest
@testable import MarketGuards

class MarketGuardsTests: XCTestCase {
    var missionsServiceMock: MissionsServiceMock!
    var viewModel: MissionListViewModel!
    
    override func setUpWithError() throws {
        super.setUp()
        missionsServiceMock = MissionsServiceMock()
        viewModel = MissionListViewModel(service: missionsServiceMock)
    }
    
    override func tearDownWithError() throws {}
    
    func test_fetchMissionsPreview_success() {
        let data = [MissionsPreviewResponse(id: 1, missionType: MissionType(id: 1, code: "mission1"), title: "mise 1", dateCreated: "", dateFinished: "", finishedQuests: 0, totalQuests: 0, finishedOptionalQuests: 0, totalOptionalQuests: 0, questsSeen: true, firstSeen: true)]
        
        missionsServiceMock.data = data
        viewModel.fetchMissionsPreviewData()
        XCTAssertEqual(data, viewModel.missionsPreview)
    }
    
    func test_fetchMissionsPreview_failure() {
        missionsServiceMock.data = nil
        viewModel.fetchMissionsPreviewData()
        XCTAssertNil(viewModel.missionsPreview)
    }
    
    func testPerformanceExample() throws {
        measure {}
    }
}

class MissionsServiceMock: MissionsService {
    var resultToReturn: Result<[MissionsPreviewResponse], MissionsError>?
    var data: [MissionsPreviewResponse]?
    var error: MissionsError?
    
    override func fetchMissionsPreview(completion: @escaping (Result<[MissionsPreviewResponse], MissionsError>) -> Void) {
        if let data = self.data {
            completion(.success(data))
        } else {
            completion(.failure(error ?? .generic))
        }

    }
}
