//
//  DetailViewController.swift
//  iOS_Architecture
//
//  Created by 高橋蓮 on 2023/03/05.
//

import UIKit
import SnapKit

class DetailViewController: UIViewController {
    private let movieImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let titleLabel: UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 30, weight: .medium)
        return label
    }()
    
    private let discriptionLabel: UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 25, weight: .regular)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var entireStackView: UIStackView = {
       let stack = UIStackView(arrangedSubviews: [titleLabel, discriptionLabel])
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fillEqually
        return stack
    }()
    
    var viewModel: DetailViewModel
    
    init(viewModel: DetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        configView()
    }
    
    func configView() {
        title = "Movie Details"
        titleLabel.text = viewModel.movieTitle
        discriptionLabel.text = viewModel.movieDiscription
        movieImageView.sd_setImage(with: viewModel.movieImage)
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(movieImageView)
        view.addSubview(entireStackView)
        
        movieImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(100)
            make.left.equalToSuperview().offset(8)
            make.right.equalToSuperview().offset(-8)
            make.height.equalTo(200)
        }
        
        entireStackView.snp.makeConstraints { make in
            make.top.equalTo(movieImageView.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(8)
            make.right.equalToSuperview().offset(-8)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-30)
        }
    }
}
