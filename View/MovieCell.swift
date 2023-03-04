//
//  MovieCell.swift
//  iOS_Architecture
//
//  Created by 高橋蓮 on 2023/03/04.
//

import UIKit
import SnapKit
import SDWebImage

class MovieCell: UITableViewCell {
        
    private lazy var entireView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [movieImageView, rhsStackView])
        stackView.axis = .horizontal
        stackView.layer.borderColor = UIColor.label.cgColor
        stackView.layer.borderWidth = 1
        stackView.layer.cornerRadius = 10
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        return stackView
    }()
    
    private lazy var rhsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, dateLabel, rateLabel])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.setCustomSpacing(10, after: titleLabel)
        return stackView
    }()
    
    private let movieImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .clear
        imageView.layer.cornerRadius = 5
        return imageView
    }()
    
    private let titleLabel: UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 20)
        return label
    }()
    
    private let dateLabel: UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 15)
        return label
    }()
    
    private let rateLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15)
         return label
     }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(entireView)
        
        entireView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
        movieImageView.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 130, height: 100))
        }
    }
    
    func setupCell(_ viewModel: MovieCellViewModel) {
        self.titleLabel.text = viewModel.title
        self.dateLabel.text = viewModel.date
        self.rateLabel.text = viewModel.rating
        self.movieImageView.sd_setImage(with: viewModel.imageUrl)
    }
}
