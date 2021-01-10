//
//  LibraryViewModel.swift
//  MarketGuards
//
//  Created by Tomáš Šmerda on 29.11.2020.
//  Copyright © 2020 Gamifika, s.r.o. All rights reserved.
//

import Foundation

class LibraryViewModel: ObservableObject {
    @Published var storiesList: [StoryItem] = []
    @Published var dictionaryList: [DictionaryLetter] = []
    @Published var bestPracticeList: [BestPracticeTag] = []
    @Published var selectedTags: [Tag] = []
    
    init() {
        self.storiesList = [
            StoryItem(image: "marcus", title: "Statečným přeje štěstí", text: "Nejdřív jsme začali chodit krmit na Náplavku, protože jsme tam nedaleko bydleli. Po dvou týdnech si na nás ta zvířata zvykla. Stačilo dát ruku před sebe a hned tam seděli. Samozřejmě lidi chodili kolem...", author: "Karel Zkušený", date: "2.června 2019", place: "Brno", read: 10, tags: [
                        Tag(title: "analýza")]),
            StoryItem(image: "marcus", title: "Nechte zelenou konat dobro a bojovat proti chaosu", text: "Dělala jsem všechno možné, ale když se nabízela možnost mít nějakou větší, prestižnější zakázku, tak to vždy skončilo tím, že mi různí lidé – tentokrát ti, kteří se dostali po revoluci, že stará struktura...", author: "Karel Zkušený", date: "12.dubna 2020", place: "Brno", read: 10, tags: [
                        Tag(title: "komunikace")]),
            StoryItem(image: "marcus", title: "Cesta k naslouchání", text: "Nejdřív jsme začali chodit krmit na Náplavku, protože jsme tam nedaleko bydleli. Po dvou týdnech si na nás ta zvířata zvykla. Stačilo dát ruku před sebe a hned tam seděli. Samozřejmě lidi chodili kolem...", author: "Karel Zkušený", date: "1.června 2018", place: "Brno", read: 10, tags: [
                        Tag(title: "klient")])
        ]
        self.bestPracticeList = [
            BestPracticeTag(title: "Kontaktování", bestPracticeItem: [
                                BestPracticeItem(image: "marcus", title: "Pozorování klientů z povzdálí", text: "Nejdřív jsme začali chodit krmit na Náplavku, protože jsme tam nedaleko bydleli. Po dvou týdnech si na nás ta zvířata zvykla. Stačilo dát ruku před sebe a hned tam seděli. Samozřejmě lidi chodili kolem...", difficulty: "Nováček"),
                                BestPracticeItem(image: "marcus", title: "Jak se neztratit a zaujmout", text: "Nejdřív jsme začali chodit krmit na Náplavku, protože jsme tam nedaleko bydleli. Po dvou týdnech si na nás ta zvířata zvykla. Stačilo dát ruku před sebe a hned tam seděli. Samozřejmě lidi chodili kolem...", difficulty: "Pokročilý")]),
            BestPracticeTag(title: "Analýza", bestPracticeItem: [
                                BestPracticeItem(image: "marcus", title: "Lov ptáků v lese", text: "Nejdřív jsme začali chodit krmit na Náplavku, protože jsme tam nedaleko bydleli. Po dvou týdnech si na nás ta zvířata zvykla. Stačilo dát ruku před sebe a hned tam seděli. Samozřejmě lidi chodili kolem...", difficulty: "Expert"),
                                BestPracticeItem(image: "marcus", title: "Nejtrikovatější triky pro poradce", text: "Nejdřív jsme začali chodit krmit na Náplavku, protože jsme tam nedaleko bydleli. Po dvou týdnech si na nás ta zvířata zvykla. Stačilo dát ruku před sebe a hned tam seděli. Samozřejmě lidi chodili kolem...", difficulty: "Pokročilý")]),
            BestPracticeTag(title: "Pohovor", bestPracticeItem: [
                                BestPracticeItem(image: "marcus", title: "Komunikace z očí do očí", text: "Nejdřív jsme začali chodit krmit na Náplavku, protože jsme tam nedaleko bydleli. Po dvou týdnech si na nás ta zvířata zvykla. Stačilo dát ruku před sebe a hned tam seděli. Samozřejmě lidi chodili kolem...", difficulty: "Nováček"),
                                BestPracticeItem(image: "marcus", title: "Jak vytvořit nejlepší první dojem", text: "Nejdřív jsme začali chodit krmit na Náplavku, protože jsme tam nedaleko bydleli. Po dvou týdnech si na nás ta zvířata zvykla. Stačilo dát ruku před sebe a hned tam seděli. Samozřejmě lidi chodili kolem...", difficulty: "Nováček")])
        ]
        self.dictionaryList = [
            DictionaryLetter(letter: "A", dictionaryItem: [
                                DictionaryItem(title: "Atribut", description: "Rozlišovací rys, podstatná vlastnost nějakého objektu."),
                                DictionaryItem(title: "Akce", description: "Integrální charakteristika mechanického systému, určující jeho časový vývoj.")]),
            DictionaryLetter(letter: "B", dictionaryItem: [
                                DictionaryItem(title: "Boj se zlem", description: "Boje mezi dobrem a zlem jsou staré jako lidstvo samo."),
                                DictionaryItem(title: "Bojkot", description: "Nátlakový prostředek skupiny lidí sloužící k prosazení společného zájmu.")]),
            DictionaryLetter(letter: "D", dictionaryItem: [
                                DictionaryItem(title: "Dovolená", description: "Smyslem dovolené je poskytnout zaměstnanci čas, aby se zregeneroval a nabral síly k řádnému výkonu zaměstnání.")])
        ]
    }
    
    func removeFromSelectedTags(_ tag: Tag) {
        if let index = selectedTags.firstIndex(where: { $0.title == tag.title }){
            selectedTags.remove(at: index)
        }
    }
}
