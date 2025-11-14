//
//  PopularMoviesCollectionViewCell.swift
//  LayarTancep
//
//  Created by Salma Ayuningtyas on 11/7/25.
//

import UIKit
import SDWebImage

class PopularMoviesCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "PopularMoviesCollectionViewCell"
    
    // 🍃 UI Components
    private let moviewImageView: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(systemName: "square.and.arrow.up.badge.checkmark.fill")
        img.contentMode = .scaleToFill
        return img
    }()
    
    private let movieTitleLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Movie Title"
        lbl.font = .systemFont(ofSize: 12, weight: .light)
        lbl.textAlignment = .left
        lbl.textColor = .black
        return lbl
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 3
        stackView.alignment = .leading
        return stackView
    }()
    
    private let movieRatingImage: UIImageView = {
       let img = UIImageView()
        img.image = UIImage(systemName: "star.fill")
        img.contentMode = .scaleAspectFit
       return img
    }()
    
    private let movieRatingLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "8.5"
        lbl.font = .systemFont(ofSize: 11, weight: .regular)
        lbl.textColor = .black
        return lbl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI(movieImage: "", movieTitle: "", movieRatingLbl: 0.0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI(movieImage: String, movieTitle: String, movieRatingLbl: Double) {
        let UIComponents: [UIView] = [movieTitleLabel, moviewImageView, movieRatingImage, movieRatingLabel, stackView]
        let insideStackView: [UIView] = [movieRatingImage, movieRatingLabel]
        
        
        contentView.addSubview(stackView)
        contentView.addSubview(moviewImageView)
        contentView.addSubview(movieTitleLabel)
        
        // --MARK: grouping all UI component that stored inside stack view
        for insideStackVw in insideStackView {
            stackView.addArrangedSubview(insideStackVw)
        }
        
        // --MARK: grouping all UI components for inactive auto resizing
        for views in UIComponents {
            views.translatesAutoresizingMaskIntoConstraints = false
        }
        
        
        NSLayoutConstraint.activate([
            moviewImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 2),
            moviewImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 2),
            moviewImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -2),
            
            moviewImageView.widthAnchor.constraint(equalToConstant: 250),
            moviewImageView.heightAnchor.constraint(equalToConstant: 300),
            
            movieTitleLabel.topAnchor.constraint(equalTo: moviewImageView.bottomAnchor, constant: 15),
            movieTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 4),
            movieTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -4),
            
            stackView.topAnchor.constraint(equalTo: movieTitleLabel.bottomAnchor, constant: 2),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 4),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4),
            
            movieRatingImage.widthAnchor.constraint(equalToConstant: 12),
            movieRatingImage.heightAnchor.constraint(equalToConstant: 12)
            
        ])
        
        
        // --MARK: setup images with SDWebImage
        guard let movieIMG = URL(string: movieImage) else { return }
        moviewImageView.sd_setImage(with: movieIMG)
     
        
        // --MARK: setup labels
        movieTitleLabel.text = movieTitle
        
        
    }
}
