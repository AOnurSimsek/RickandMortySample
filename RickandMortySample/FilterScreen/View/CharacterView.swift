//
//  CharacterView.swift
//  RickandMortySample
//
//  Created by Onur Şimşek on 14.06.2022.
//

import UIKit
import SnapKit

class CharacterView: UIView {
    
    private lazy var mainView: UIView = UIView()
    private lazy var titleLabel: UILabel = UILabel()
    private lazy var selectedImageView: UIImageView = UIImageView()
    private lazy var button: UIButton = UIButton()
    private var character: CharacterNames?
    private weak var delegate: CharacterViewDelegate?
    
    
    init(width: CGFloat = UIScreen.main.bounds.width - 52, height: CGFloat = 56) {
        super.init(frame: CGRect(x: 0, y: 0, width: width, height: height))
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        setUI()
        setLayout()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setUI() {
        titleLabel.textColor = .black
        titleLabel.font = .RobotoRegular_24
        titleLabel.textAlignment = .left
        
        mainView.backgroundColor = .clear
    }
    
    func setLayout() {
        self.addSubview(mainView)
        mainView.snp.makeConstraints { make in
            make.trailing.equalTo(self.snp.trailing)
            make.leading.equalTo(self.snp.leading)
            make.top.equalTo(self.snp.top)
            make.bottom.equalTo(self.snp.bottom)
            make.height.equalTo(56)
        }
        //ImageView
        mainView.addSubview(selectedImageView)
        selectedImageView.snp.makeConstraints { make in
            make.trailing.equalTo(mainView.snp.trailing).offset(-16)
            make.centerY.equalTo(mainView.snp.centerY)
            make.width.equalTo(24)
            make.height.equalTo(24)
        }
        
        //TitleLabel
        mainView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(mainView.snp.leading).offset(16)
            make.trailing.equalTo(mainView.snp.trailing).offset(-16)
            make.height.equalTo(24)
            make.centerY.equalTo(mainView.snp.centerY)
        }
        
        //Button
        mainView.addSubview(button)
        button.snp.makeConstraints { make in
            make.leading.equalTo(mainView.snp.leading)
            make.trailing.equalTo(mainView.snp.trailing)
            make.top.equalTo(mainView.snp.top)
            make.bottom.equalTo(mainView.snp.bottom)
        }
    }
    
    func setView(character: CharacterNames, _delegate: CharacterViewDelegate) {
        self.character = character
        titleLabel.text = character.description.capitalized
        delegate = _delegate
        selectedImageView.image = MainScreenViewModel.shared.characterName.value == self.character ? UIImage(named: "selectedIcon") : UIImage(named: "unSelectedIcon")
    }
    
    func isSelected(_ value: Bool) {
    }
    
    @objc func buttonPressed() {
        delegate?.viewSelected(selectedChar: character ?? .both)
    }
    
}
