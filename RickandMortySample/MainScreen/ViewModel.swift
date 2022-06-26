//
//  ViewModel.swift
//  RickandMortySample
//
//  Created by Onur Şimşek on 13.06.2022.
//

import Foundation

class MainScreenViewModel {
    static let shared = MainScreenViewModel()
    
    private var page: Int = 1
    private var maxCount: Int = 0
    let characterName: Observable<CharacterNames> = Observable(.both)
    let characterData: Observable<[CharacterQuery.Data.Character.Result]> = Observable([])
    let errorState: Observable<Bool> = Observable(false)
    
    init() { }
    
    func getData(isNextPage: Bool) {
        if isNextPage {
            page += 1
        } else {
            page = 0
            deleteValues()
        }
        
        Network.shared.apollo.fetch(query: CharacterQuery(page: page, charaterName: characterName.value)) { [weak self] result in
            guard let self = self
            else { return }
            
            switch result {
            case .success(let graphQLResult):
                if let maxCount = graphQLResult.data?.characters?.info?.count {
                    self.maxCount = maxCount
                }
                if let results = graphQLResult.data?.characters?.results {
                    self.characterData.value.append(contentsOf: results.compactMap { $0 })
                }
            case .failure( _):
                self.errorState.value = true
            }
        }
    }
    
    private func deleteValues(){
        page = 1
        self.characterData.value = []
    }
    
    func setCharacterName(name: CharacterNames) {
        self.characterName.value = name
    }
    
    func getTitle(_ indexPath: Int) -> String {
        return characterData.value[indexPath].name~
    }
    
    func getId(_ indexPath: Int) -> String {
        return characterData.value[indexPath].id~
    }
    
    func getImage(_ indexPath: Int) -> String {
        return characterData.value[indexPath].image~
    }
    
    func getLocation(_ indexPath: Int) -> String {
        return characterData.value[indexPath].location?["name"] ?? ""
    }
    
    func getRowCount() -> Int {
        return characterData.value.count
    }
    
    func getCharacterName() -> CharacterNames {
        return characterName.value
    }
    
    func getMaxCount() -> Int {
        return maxCount
    }
    
}
