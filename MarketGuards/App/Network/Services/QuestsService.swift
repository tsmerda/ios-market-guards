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
            case .success(let response):
                do {
                    print(response)
                    completion(.success(()))
                } catch {
                    print("Failed decoding with: \(error.localizedDescription)")
                    //failed decoding or 500 response code.., user wouldn't understand the error message so just show them something  generic
                    completion(.failure(.generic))
                }
                
            case .failure(let error):
                completion(.failure(.underlying(error))) //most likely a network error, user should understand this error
            }
        }
    }
    
    func fetchQuestDetail(questId: Int, completion: @escaping (Result<QuestDetailResponse, MissionsError>) -> Void) {
        provider.request(.questDetail(QuestRequest(questId: questId, action: ""))) { result in
            switch result {
            case .success(let response):
                do {
                    let preview = try response
                        .filterSuccessfulStatusCodes()
                        .map(QuestDetailResponse.self)
                    completion(.success(preview))
                } catch {
                    print("Failed decoding with: \(error.localizedDescription)")
                    //failed decoding or 500 response code.., user wouldn't understand the error message so just show them something  generic
                    completion(.failure(.generic))
                }
                
            case .failure(let error):
                completion(.failure(.underlying(error))) //most likely a network error, user should understand this error
            }
        }
    }
}
