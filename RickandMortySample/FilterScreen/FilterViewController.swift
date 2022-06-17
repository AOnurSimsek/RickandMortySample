//
//  FilterViewController.swift
//  RickandMortySample
//
//  Created by Onur Şimşek on 14.06.2022.
//

import Foundation
import UIKit
import SnapKit
import SwiftUI

class FilterViewController: UIViewController {
    
    private lazy var mainView: UIView = UIView()
    private lazy var titleLabel: UILabel = UILabel()
    private lazy var seperatorView: UIView = UIView()
    private lazy var firstCharacterView : CharacterView = CharacterView()
    private lazy var secondCharacterView : CharacterView = CharacterView()
    var delegate: FilterScreenDelegate?
    
    let viewModel = MainScreenViewModel.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        setUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setSelected()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animate()
    }
    
    private func animate() {
        UIView.animate(withDuration: 0.5) {
            self.view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.6)
        }
    }
    
    private func setUI() {
        mainView.backgroundColor = .white
        mainView.layer.cornerRadius = 10
        mainView.layer.masksToBounds = true
        
        titleLabel.textColor = .black
        titleLabel.font = .RobotoBold_24
        titleLabel.textAlignment = .left
        titleLabel.text = "Filter"
        
        seperatorView.backgroundColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1)
        
        firstCharacterView.setView(character: .rick, _delegate: self)
        secondCharacterView.setView(character: .morty, _delegate: self)
    }
    
    private func setLayout() {
        //Main View
        self.view.addSubview(mainView)
        mainView.snp.makeConstraints { make in
            make.center.equalTo(self.view.snp.center)
            make.width.equalTo(UIScreen.main.bounds.width - 52)
            make.height.equalTo(170)
        }
        
        //Title
        self.mainView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(mainView.snp.leading).offset(16)
            make.top.equalTo(mainView.snp.top).offset(16)
            make.width.greaterThanOrEqualTo(56)
            make.height.equalTo(28)
        }
        
        //SeperatorView
        self.mainView.addSubview(seperatorView)
        seperatorView.snp.makeConstraints { make in
            make.leading.equalTo(mainView.snp.leading)
            make.trailing.equalTo(mainView.snp.trailing)
            make.height.equalTo(1)
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
        }
        
        //First CharacterView
        self.mainView.addSubview(firstCharacterView)
        firstCharacterView.snp.makeConstraints { make in
            make.leading.equalTo(mainView.snp.leading)
            make.trailing.equalTo(mainView.snp.trailing)
            make.top.equalTo(seperatorView.snp.bottom)
            make.height.equalTo(56)
        }
        
        //Second CharacterView
        self.mainView.addSubview(secondCharacterView)
        secondCharacterView.snp.makeConstraints { make in
            make.leading.equalTo(mainView.snp.leading)
            make.trailing.equalTo(mainView.snp.trailing)
            make.top.equalTo(firstCharacterView.snp.bottom)
            make.height.equalTo(56)
        }
    }
    
    func setSelected() {
        let selecteOne = viewModel.getCharacterName()
        switch selecteOne {
        case .rick:
            firstCharacterView.isSelected(true)
            secondCharacterView.isSelected(false)
        case .morty:
            firstCharacterView.isSelected(false)
            secondCharacterView.isSelected(true)
        case .both:
            firstCharacterView.isSelected(false)
            secondCharacterView.isSelected(false)
        }
    }
}

//MARK: - CharacterViewDelegate
extension FilterViewController: CharacterViewDelegate {
    func viewSelected(selectedChar: CharacterNames) {
        let vmselectedChar = viewModel.getCharacterName()
        if vmselectedChar != selectedChar {
            viewModel.setCharacterName(name: selectedChar)
            delegate?.characterChanged()
        }
        self.dismiss(animated: false)
    }
}

//MARK: - Tap close func
extension FilterViewController {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        if touch?.view != self.mainView {
            self.dismiss(animated: false, completion: nil)
            
        }
    }
}
