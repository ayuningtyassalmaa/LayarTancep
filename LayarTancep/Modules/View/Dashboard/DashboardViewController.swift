//
//  DashboardViewController.swift
//  LayarTancep
//
//  Created by Salma Ayuningtyas on 11/7/25.
//

import UIKit

class DashboardViewController: UIViewController {
    
    
    @IBOutlet weak var collectionCell: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupCell()
        setupReusableUI()
    }
    
    func setupCell() {
        collectionCell.delegate = self
        collectionCell.dataSource = self
        collectionCell.register(PopularMoviesCollectionViewCell.self, forCellWithReuseIdentifier: PopularMoviesCollectionViewCell.identifier)
    }
    
    func setupReusableUI() {
        let sectionTitleHeader = MovieSectionHeaderView()
        sectionTitleHeader.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(sectionTitleHeader)
        
        NSLayoutConstraint.activate([
            sectionTitleHeader.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            sectionTitleHeader.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 2),
            sectionTitleHeader.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -2),
            sectionTitleHeader.bottomAnchor.constraint(equalTo: collectionCell.topAnchor, constant: -2)
        ])
    }
    

}; extension DashboardViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PopularMoviesCollectionViewCell.identifier, for: indexPath) as? PopularMoviesCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.setupUI()
        return cell
    }
    
    
}
