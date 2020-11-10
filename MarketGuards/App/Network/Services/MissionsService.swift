//
//  MissionsService.swift
//  MarketGuards
//
//  Created by Tomáš Šmerda on 28/09/2020.
//  Copyright © 2020 Gamifika, s.r.o. All rights reserved.
//

import Foundation
import Moya

class MissionsService {
    let provider = AuthenticatedProvider<MissionsTarget>.buildProvider()
    
    func fetchMissionsPreview(completion: @escaping (Result<[MissionsPreviewResponse], MissionsError>) -> Void) {
        provider.request(.mission) { result in
            switch result {
            case .success(let response):
                do {
                    let preview = try response
                        .filterSuccessfulStatusCodes()
                        .map([MissionsPreviewResponse].self)
                    completion(.success(preview))
                } catch {
                    print("Failed decoding with: \(error.localizedDescription)")
                    completion(.failure(.generic))
                }
            case .failure(let error):
                completion(.failure(.underlying(error)))
            }
        }
    }
    
    func fetchMissionDetail(missionId: Int, completion: @escaping (Result<MissionDetailResponse, MissionsError>) -> Void) {
        provider.request(.missionDetail(MissionRequest(missionId: missionId))) { result in
            switch result {
            case .success(let response):
                do {
                    let preview = try response
                        .filterSuccessfulStatusCodes()
                        .map(MissionDetailResponse.self)
                    completion(.success(preview))
                } catch {
                    print("Failed decoding with: \(error.localizedDescription)")
                    completion(.failure(.generic))
                }
            case .failure(let error):
                completion(.failure(.underlying(error)))
            }
        }
    }
}
