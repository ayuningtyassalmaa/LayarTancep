//
//  NowPlayingCollectionViewCell.swift
//  LayarTancep
//
//  Created by Salma Ayuningtyas on 11/16/25.
//

import UIKit
import SDWebImage

class NowPlayingCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "NowPlayingCollectionViewCell"
    
    // 🍃 UI Components
    private let movieImageView: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(systemName: "pencil.line")
        img.contentMode = .scaleToFill
        return img
    }()
    
    private let SecondaryStackView: UIStackView = {
        let stckView = UIStackView()
        stckView.axis = .horizontal
        stckView.spacing = 10
        stckView.alignment = .center
        return stckView
    }()
    
    private let movieTitleLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Movie Title"
        lbl.font = .systemFont(ofSize: 12, weight: .semibold)
        lbl.textAlignment = .left
        lbl.textColor = .black
        return lbl
    }()
    
    private let playMovieButton: UIButton = {
        let button = UIButton()
        button.setTitle("", for: .normal)
        button.setImage(UIImage(systemName: "play.circle.fill"), for: .normal)
        return button
    }()
    
    private let PrimaryStackview: UIStackView = {
        let stckView = UIStackView()
        stckView.axis = .horizontal
        stckView.spacing = 10
        stckView.alignment = .center
        return stckView
    }()
    
    private let genreMovieslbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "Sci-Fi.Drama"
        lbl.font = .systemFont(ofSize: 12, weight: .regular)
        return lbl
    }()
    
    private let ratingMovieslbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "8.8"
        lbl.font = .systemFont(ofSize: 12, weight: .regular)
        return lbl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI(movieTitle: "", movieImage: "", genre: 0, rating: 0.0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        setupUI(movieTitle: "", movieImage: "", genre: 0, rating: 0.0)
    }
    
    
    func setupUI(movieTitle: String, movieImage: String, genre: Int, rating: Double) {
        let UIComponents: [UIView] = [movieImageView, SecondaryStackView, movieTitleLabel, playMovieButton, PrimaryStackview, genreMovieslbl, ratingMovieslbl]
        let insideSecondaryStackView: [UIView] = [movieTitleLabel,playMovieButton ]
        let insidePrimaryStackView: [UIView] = [genreMovieslbl,ratingMovieslbl ]
        
        contentView.addSubview(movieImageView)
        movieImageView.addSubview(PrimaryStackview)
        movieImageView.addSubview(SecondaryStackView)
        
        // --MARK: grouping all UI components that stored inside main stack view
        
        for mainStackview in insidePrimaryStackView {
            PrimaryStackview.addArrangedSubview(mainStackview)
        }
        
        for secondaryStackView in insideSecondaryStackView {
            SecondaryStackView.addArrangedSubview(secondaryStackView)
        }
        
        // --MARK: grouping all UI components for inactive auto resizing
        for components in UIComponents {
            components.translatesAutoresizingMaskIntoConstraints = false
        }
        
        // --MARK: constraints
        NSLayoutConstraint.activate([
            
            movieImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            movieImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            movieImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            movieImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            
            movieImageView.widthAnchor.constraint(equalToConstant: 350),
            movieImageView.heightAnchor.constraint(equalToConstant: 150),
            
            PrimaryStackview.topAnchor.constraint(equalTo: movieImageView.topAnchor, constant: 1),
            PrimaryStackview.leadingAnchor.constraint(equalTo: movieImageView.leadingAnchor, constant: 2),
            PrimaryStackview.trailingAnchor.constraint(equalTo: movieImageView.trailingAnchor, constant: -2),
            
            SecondaryStackView.topAnchor.constraint(equalTo: PrimaryStackview.bottomAnchor, constant: 3),
            SecondaryStackView.leadingAnchor.constraint(equalTo: movieImageView.leadingAnchor, constant: 2),
            SecondaryStackView.trailingAnchor.constraint(equalTo: movieImageView.trailingAnchor, constant: -2),
            SecondaryStackView.bottomAnchor.constraint(equalTo: movieImageView.bottomAnchor, constant: -2),
            
        ])
        
        // --MARK: setup images with SDWebimage
        guard let movieIMG = URL(string: movieImage) else {return}
        movieImageView.sd_setImage(with: movieIMG)
        
        // --MARK: setup title
        movieTitleLabel.text = movieTitle
        
    }
    
}
