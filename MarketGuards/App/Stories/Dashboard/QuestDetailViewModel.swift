//
//  QuestDetailViewModel.swift
//  MarketGuards
//
//  Created by Tomáš Šmerda on 10/10/2020.
//  Copyright © 2020 Gamifika, s.r.o. All rights reserved.
//

import Foundation

class QuestDetailViewModel: ObservableObject {
    @Published var questDetail: QuestDetailResponse?
    @Published var questType: QuestType? // TODO -- Resolve globaly fetching QuestType to modifi text & color
    @Published var diff: Int = 0
    
    private var service = QuestsService()
    
    func fetchQuestDetailData(questId: Int) {
        service.fetchQuestDetail(questId: questId) { [weak self] result in
            switch result {
            case .success(let response):
                self?.questDetail = response
                self?.onTypeChanged()
                self?.diff = QuestType.active.getRemainingTime(activated: self?.questDetail?.activated ?? "", finished: self?.questDetail?.timeToFinish ?? 0)
            case .failure(let error):
                print("Failed fetch response with: \(error.localizedDescription)")
            }
        }
    }
    
    func patchQuestDetail(id: Int, note: String) {
        service.patchQuestDetail(id: id, note: note) { result in
            switch result {
            case .success:
                break
            case .failure(let error):
                print("Failed fetch response with: \(error.localizedDescription)")
            }
        }
    }
    
    func patchActivateQuest(questId: Int) {
        service.patchActivateQuest(questId: questId) { result in
            switch result {
            case .success:
                break
            case .failure(let error):
                print("Failed fetch response with: \(error.localizedDescription)")
            }
        }
    }
    
    func patchFinishQuest(questId: Int) {
        service.patchFinishQuest(questId: questId) { result in
            switch result {
            case .success:
                break
            case .failure(let error):
                print("Failed fetch response with: \(error.localizedDescription)")
            }
        }
    }
    
    func onTypeChanged() {
        if questDetail?.activated != nil && questDetail?.finished == nil {
            // TODO -- Fix diff time
            if (QuestType.active.getRemainingTime(activated: questDetail?.activated ?? "", finished: questDetail?.timeToFinish ?? 0) > 0) {
                questType = QuestType.active
            } else {
                questType = QuestType.unfinished
            }
        } else {
            questType = QuestType.finished
        }
    }
    
    convenience init() {
        self.init(service: QuestsService())
    }
    
    init(service: QuestsService) {
        self.service = service
    }
}
