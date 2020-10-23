//
//  QuestsService.swift
//  MarketGuards
//
//  Created by Tomáš Šmerda on 10/10/2020.
//  Copyright © 2020 Gamifika, s.r.o. All rights reserved.
//

import Foundation
import Moya

class QuestsService {
    let provider = AuthenticatedProvider<QuestsTarget>.buildProvider()
    
    func patchQuestDetail(questId: Int, action: String, completion: @escaping (Result<Void, MissionsError>) -> Void) {
        provider.request(.questPatch(QuestRequest(questId: questId, action: action))) { result in
            switch result {
            case .success:
                break
            case .failure(let error):
                completion(.failure(.underlying(error)))
            }
        }
    }
    
    func fetchQuestDetail(questId: Int, completion: @escaping (Result<QuestDetailResponse, MissionsError>) -> Void) {
        provider.request(.questDetail(questId)) { result in
            switch result {
            case .success(let response):
                do {
                    let preview = try response
                        .filterSuccessfulStatusCodes()
                        .map(QuestDetailResponse.self)
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
