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
    private var characterName: CharacterNames?
    private var characterData = [CharacterQuery.Data.Character.Result]()
    private var delegate: MainScreenDelegate?
    
    init() { }
    
    func getData(isNextPage: Bool) {
        if isNextPage {
            page += 1
        } else {
            page = 0
            deleteValues()
        }
        
        Network.shared.apollo.fetch(query: CharacterQuery(page: page, charaterName: characterName ?? .both)) { [weak self] result in
            guard let self = self
            else { return }
            
            switch result {
            case .success(let graphQLResult):
                if let results = graphQLResult.data?.characters?.results {
                    self.characterData.append(contentsOf: results.compactMap { $0 })
                    self.delegate?.dataReached()
                }
            case .failure( _):
                self.delegate?.errorOccured()
            }
        }
    }
    
    private func deleteValues(){
        page = 1
        self.characterData = []
    }
    
    func setCharacterName(name: CharacterNames) {
        self.characterName = name
    }
    
    func getTitle(_ indexPath: Int) -> String {
        return characterData[indexPath].name~
    }
    
    func getId(_ indexPath: Int) -> String {
        return characterData[indexPath].id~
    }
    
    func getImage(_ indexPath: Int) -> String {
        return characterData[indexPath].image~
    }
    
    func getLocation(_ indexPath: Int) -> String {
        return characterData[indexPath].location?["name"] ?? ""
    }
    
    func getRowCount() -> Int {
        return characterData.count
    }
    
    func setDelegate(delegate: MainScreenDelegate) {
        self.delegate = delegate
    }
    
    func getCharacterName() -> CharacterNames {
        if let _name = characterName {
            return _name
        } else {
            return .both
        }
    }
    
}
