//
//  MainScreenTableViewCell.swift
//  RickandMortySample
//
//  Created by Onur Şimşek on 13.06.2022.
//

import UIKit
import SnapKit
import Kingfisher

class MainScreenTableViewCell: UITableViewCell {
    
    static let identifier: String = "MainScreenTableViewCellIdentifier"
    
    private lazy var mainView: UIView = UIView()
    private lazy var titleLabel: UILabel = UILabel()
    private lazy var idLabel: UILabel = UILabel()
    private lazy var characterImageView: UIImageView = UIImageView()
    private lazy var locationLabel: UILabel = UILabel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setLayout()
        setUI()
    }
        
    func setCell(title: String, id: String, characterImage: String, location: String) {
        titleLabel.attributedText = title.getAttributedString(type: .name)
        idLabel.attributedText = id.getAttributedString(type: .id)
        characterImageView.kf.setImage(with: URL(string: characterImage),
                                       placeholder: UIImage(named: "PlaceHolder"),
                                       options: nil,
                                       completionHandler: nil)
        locationLabel.attributedText = location.getAttributedString(type: .location)
    }
    
    private func setUI(){
        self.clipsToBounds = false
        self.selectionStyle = .none
        
        //MainView
        mainView.backgroundColor = .white
        mainView.layer.cornerRadius = 10
        mainView.layer.masksToBounds = true
        mainView.layer.shadowColor = UIColor(red: 0,
                                             green: 0,
                                             blue: 0,
                                             alpha: 0.1).cgColor
        mainView.layer.shadowOpacity = 1
        mainView.layer.shadowRadius = 8
        mainView.layer.shadowOffset = CGSize(width: 0,
                                             height: 6)
        mainView.clipsToBounds = false
        
        //TitleLabel
        titleLabel.textAlignment = .left
        titleLabel.numberOfLines = 0
        
        //LocationLabel
        locationLabel.textAlignment = .left
        titleLabel.numberOfLines = 0
        
        //IdLabel
        idLabel.textAlignment = .right
        
        //CharacterImage
        characterImageView.layer.cornerRadius = 10
        characterImageView.layer.maskedCorners = [.layerMinXMinYCorner,
                                                  .layerMaxXMinYCorner]
        characterImageView.layer.masksToBounds = true
        characterImageView.contentMode = .scaleAspectFill
        
    }
    
    private func setLayout(){
        //ImageView
        self.mainView.addSubview(characterImageView)
        characterImageView.snp.makeConstraints { make in
            make.top.equalTo(mainView.snp.top)
            make.trailing.equalTo(mainView.snp.trailing)
            make.leading.equalTo(mainView.snp.leading)
            make.height.equalTo((UIScreen.main.bounds.width - 48 ) / 1.9464)
            //to adjust height according to desired ratio (327/168)
        }

        //IdLabel
        self.mainView.addSubview(idLabel)
        idLabel.snp.makeConstraints { make in
            make.trailing.equalTo(mainView.snp.trailing).offset(-17)
            make.top.equalTo(characterImageView.snp.bottom).offset(8)
            make.height.equalTo(19)
            make.width.greaterThanOrEqualTo(40)
        }
        
        //TitleLabel
        self.mainView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(mainView.snp.leading).offset(14)
            make.trailing.equalTo(mainView.snp.trailing).offset(-14)
            make.top.equalTo(characterImageView.snp.bottom).offset(35)
            make.height.greaterThanOrEqualTo(19)
        }
        
        //LocationLabel
        self.mainView.addSubview(locationLabel)
        locationLabel.snp.makeConstraints { make in
            make.leading.equalTo(titleLabel.snp.leading)
            make.trailing.equalTo(titleLabel.snp.trailing)
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.bottom.equalTo(mainView.snp.bottom).offset(-16)
        }

        //MainView
        self.addSubview(mainView)
        mainView.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).offset(8)
            make.leading.equalTo(self.snp.leading).offset(24)
            make.bottom.equalTo(self.snp.bottom).offset(-8)
            make.trailing.equalTo(self.snp.trailing).offset(-24)
        }
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = nil
        idLabel.text = nil
        characterImageView.image = nil
        locationLabel.text = nil
    }

}
