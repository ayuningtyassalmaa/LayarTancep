//
//  MovieSectionHeaderView.swift
//  LayarTancep
//
//  Created by Salma Ayuningtyas on 11/7/25.
//

import UIKit

class MovieSectionHeaderView: UIView {

    // 🍃 UI Components
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 5
        stackView.alignment = .center
        return stackView
    }()
    
    private let logoTrendingImgView: UIImageView = {
         let logo = UIImageView()
         logo.image = UIImage(systemName: "chart.line.uptrend.xyaxis")
         logo.contentMode = .scaleAspectFit
         return logo
     }()
     
    private let titleLabel: UILabel = {
         let label = UILabel()
         label.text = "Yang lagi HOT"
         label.font = .systemFont(ofSize: 14, weight: .medium)
         label.textAlignment = .left
        label.textColor = .black
         return label
     }()
    
    private let seeAllButton: UIButton = {
        let button = UIButton()
        button.setTitle("Lihat Semua", for: .normal)
        button.setTitleColor(UIColor.purple, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        return button
    }()
    
    
    // MARK: Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        setupLayout()
    }
    
    
    // 🎨 Set up UI
    func setupLayout() {
        
        let components: [UIView] = [stackView, logoTrendingImgView, titleLabel, seeAllButton]
        let views: [UIView] = [logoTrendingImgView, titleLabel]
        
        addSubview(stackView)
//        addSubview(seeAllButton)

        // --MARK: grouping all UI component that stored inside stack view
        for viewsInsideStackVw in views {
            stackView.addArrangedSubview(viewsInsideStackVw)
        }
       
        
        // --MARK: grouping all UI components
        for componentsViews in components {
            componentsViews.translatesAutoresizingMaskIntoConstraints = false
        }
        
        
        // constraint
            NSLayoutConstraint.activate([
                
                stackView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
                stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
                stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -2),
                
                logoTrendingImgView.widthAnchor.constraint(equalToConstant: 20),
                logoTrendingImgView.heightAnchor.constraint(equalToConstant: 21),
                
//                seeAllButton.topAnchor.constraint(equalTo: topAnchor, constant: 0),
//                seeAllButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 100),
//                seeAllButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
//                seeAllButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -2)
             

            ])
        
        
    }
    


}
