//
//  ViewController.swift
//  RickandMortySample
//
//  Created by Onur Şimşek on 13.06.2022.
//

import UIKit
import SnapKit

class MainScreenViewController: UIViewController {

    private lazy var titleLabel: UILabel = UILabel()
    private lazy var tableView: UITableView = UITableView()
    private lazy var filterButton: UIButton = UIButton()
    
    let viewModel = MainScreenViewModel.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        setUI()
        setViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getData(isNextPage: false)
    }
    
    private func setViewModel() {
        viewModel.setDelegate(delegate: self)
    }
    
    private func getData(isNextPage: Bool) {
        showSpinner(onView: self.view)
        viewModel.getData(isNextPage: isNextPage)
    }
    
    private func setLayout(){
        // TitleLabel
        self.view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalTo(view.snp.centerX)
            make.height.equalTo(28)
            make.width.equalTo(163)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(28)
        }
        
        // FilterButton
        self.view.addSubview(filterButton)
        filterButton.snp.makeConstraints { make in
            make.centerY.equalTo(titleLabel.snp.centerY)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-24)
            make.width.equalTo(23)
            make.height.equalTo(26)
        }
        
        // TableView
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(22)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing)
            make.bottom.equalTo(view.snp.bottom)
        }
        
    }
    
    private func setUI() {
        //View
        self.view.backgroundColor = .white
        self.navigationController?.navigationBar.isHidden = true
        
        //TitleLabel
        titleLabel.backgroundColor = .clear
        titleLabel.textColor = .black
        titleLabel.textAlignment = .center
        titleLabel.font = .RobotoBold_24
        titleLabel.text = "Rick and Morty"
     
        //FilterButton
        filterButton.setImage(UIImage(named: "FilterIcon"), for: .normal)
        filterButton.addTarget(self, action: #selector(filterButtonPressed), for: .touchUpInside)
        
        //TableView
        setTableView()
    }
    
    @objc private func filterButtonPressed() {
        let destination = FilterViewController()
        destination.modalPresentationStyle = .overFullScreen
        destination.delegate = self
        self.present(destination, animated: false)
    }
    
}

//MARK: - TableView
extension MainScreenViewController: UITableViewDelegate, UITableViewDataSource {
    
    func setTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundView = UIView()
        tableView.backgroundColor = .clear
        tableView.register(MainScreenTableViewCell.self,
                           forCellReuseIdentifier: MainScreenTableViewCell.identifier)
        tableView.estimatedRowHeight = 265
        tableView.separatorStyle = .none
        tableView.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 50, right: 0)
        tableView.showsVerticalScrollIndicator = false
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getRowCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MainScreenTableViewCell.identifier,
                                                 for: indexPath) as! MainScreenTableViewCell
        
        cell.setCell(title: viewModel.getTitle(indexPath.row),
                     id: viewModel.getId(indexPath.row),
                     characterImage: viewModel.getImage(indexPath.row),
                     location: viewModel.getLocation(indexPath.row))
        
        if indexPath.row == viewModel.getRowCount() - 1 {
            getData(isNextPage: true)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

//MARK: - ViewModel Delegate
extension MainScreenViewController: MainScreenDelegate {
    func dataReached() {
        removeSpinner()
        self.tableView.reloadData()
    }
    
    func errorOccured() {
        removeSpinner()
        showError()
    }
}

//MARK: - FilterScreenDelegate
extension MainScreenViewController: FilterScreenDelegate {
    func characterChanged() {
        viewModel.getData(isNextPage: false)
    }
}

