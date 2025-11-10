//
//  DashboardViewController.swift
//  LayarTancep
//
//  Created by Salma Ayuningtyas on 11/7/25.
//

import UIKit
import RxSwift

class DashboardViewController: UIViewController {
    
    
    @IBOutlet weak var collectionCell: UICollectionView!
    
    let viewModel = DashboardViewModel()
    let popularDataList: [PopularMovies] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupCell()
        setupReusableUI()
        bindVM()
        viewModel.showPopularMovies()
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
    
    func bindVM() {
        viewModel.updatedDataPopularMovies
            .asObservable()
            .subscribe(onNext: { [weak self] successShowData
                in
                self?.collectionCell.reloadData()
            })
    }
    

}; extension DashboardViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.updatedDataPopularMovies.value.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let data = viewModel.updatedDataPopularMovies.value[indexPath.row]
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PopularMoviesCollectionViewCell.identifier, for: indexPath) as? PopularMoviesCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.setupUI(movieImage: data.backdrop_path ?? "", movieTitle: data.original_title ?? "", movieRatingLbl: data.vote_average ?? 0.0 )
        return cell
    }
    
    
}
