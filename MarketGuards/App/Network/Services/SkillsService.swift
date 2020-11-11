//
//  SkillsService.swift
//  MarketGuards
//
//  Created by Tomáš Šmerda on 23/10/2020.
//  Copyright © 2020 Gamifika, s.r.o. All rights reserved.
//

import Foundation
import Moya

class SkillsService {
    let provider = AuthenticatedProvider<SkillsTarget>.buildProvider()
    
    func fetchSkills(completion: @escaping (Result<[SkillsResponse], SkillsError>) -> Void) {
        provider.request(.skills) { result in
            switch result {
            case .success(let response):
                do {
                    let preview = try response
                        .filterSuccessfulStatusCodes()
                        .map([SkillsResponse].self)
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
    
    func fetchSkillDetail(skillId: Int, completion: @escaping (Result<SkillDetail, SkillsError>) -> Void) {
        provider.request(.skillDetail(skillId)) { result in
            switch result {
            case .success(let response):
                do {
                    let preview = try response
                        .filterSuccessfulStatusCodes()
                        .map(SkillDetail.self)
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
    
    func fetchSubSkillDetail(skillId: Int, subSkillId: Int, completion: @escaping (Result<SubSkillDetail, SkillsError>) -> Void) {
        provider.request(.subSkillDetail(SubSkillRequest(skillId: skillId, subSkillId: subSkillId))) { result in
            switch result {
            case .success(let response):
                do {
                    let preview = try response
                        .filterSuccessfulStatusCodes()
                        .map(SubSkillDetail.self)
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
