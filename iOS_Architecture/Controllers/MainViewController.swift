//
//  MainViewController.swift
//  iOS_Architecture
//
//  Created by 高橋蓮 on 2023/03/02.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.register(MovieCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    private let activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        indicator.style = .large
        indicator.color = .systemGray2
        return indicator
    }()
    
    private var viewModel = MainViewModel()
    private var cellDataSource: [MovieCellViewModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        view.addSubview(tableView)
        view.addSubview(activityIndicator)
        setupViews()
        bindViewModel()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.getData()
    }
    
    func bindViewModel() {
        viewModel.isLoading.bind { [weak self] isLoading in
            guard let self = self,
                  let isLoading = isLoading else { return }
            
            DispatchQueue.main.async {
                if isLoading {
                    self.activityIndicator.startAnimating()
                } else {
                    self.activityIndicator.stopAnimating()
                }
            }
        }
        viewModel.cellDataSource.bind { [weak self] movies in
            guard let self = self,
                  let movies = movies else { return }
            self.cellDataSource = movies
            self.reloadTableView()
        }
    }
    
    func setupViews() {
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.center.equalToSuperview()
        }
        
        activityIndicator.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
    func openDetail(movieId: Int) {
        guard let movie = viewModel.retriveMovie(with: movieId) else { return }
        let detailViewModel = DetailViewModel(movie: movie)
        let detailVC = DetailViewController(viewModel: detailViewModel)
        DispatchQueue.main.async {
            self.navigationController?.pushViewController(detailVC, animated: true)
        }
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func reloadTableView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRows(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? MovieCell else { return UITableViewCell() }
        let cellViewModel = cellDataSource[indexPath.row]
        cell.setupCell(cellViewModel)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movieId = cellDataSource[indexPath.row].id
        self.openDetail(movieId: movieId)
    }
    
    
}
