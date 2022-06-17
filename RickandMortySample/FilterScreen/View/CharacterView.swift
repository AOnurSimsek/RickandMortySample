//
//  CharacterView.swift
//  RickandMortySample
//
//  Created by Onur Şimşek on 14.06.2022.
//

import UIKit
import SnapKit

class CharacterView: UIView {

    private lazy var titleLabel: UILabel = UILabel()
    private lazy var selectedImageView: UIImageView = UIImageView()
    private lazy var button: UIButton = UIButton()
    private var character: CharacterNames?
    private var delegate: CharacterViewDelegate?
    
    
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
        
        self.backgroundColor = .white
    }
    
    func setLayout() {
        //ImageView
        self.addSubview(selectedImageView)
        selectedImageView.snp.makeConstraints { make in
            make.trailing.equalTo(self.snp.trailing).offset(-16)
            make.centerY.equalTo(self.snp.centerY)
            make.width.equalTo(24)
            make.height.equalTo(24)
        }
        
        //TitleLabel
        self.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(self.snp.leading).offset(16)
            make.trailing.equalTo(self.snp.trailing).offset(-16)
            make.height.equalTo(24)
            make.centerY.equalTo(self.snp.centerY)
        }
        
        //Button
        self.addSubview(button)
        button.snp.makeConstraints { make in
            make.leading.equalTo(self.snp.leading)
            make.trailing.equalTo(self.snp.trailing)
            make.top.equalTo(self.snp.top)
            make.bottom.equalTo(self.snp.bottom)
        }
    }
    
    func setView(character: CharacterNames, _delegate: CharacterViewDelegate) {
        self.character = character
        titleLabel.text = character.description.capitalized
        delegate = _delegate
    }
    
    func isSelected(_ value: Bool) {
        selectedImageView.image = value ? UIImage(named: "selectedIcon") : UIImage(named: "unSelectedIcon")
    }
    
    @objc func buttonPressed() {
        delegate?.viewSelected(selectedChar: character ?? .both)
    }
    
}
