//
//  DashboardViewController.swift
//  LayarTancep
//
//  Created by Salma Ayuningtyas on 11/7/25.
//

import UIKit
import RxSwift

enum CollectionCellDashboardView: CaseIterable {
    case popularMovies
    case nowPlayingMovies
    case topRatedMovies
}

class DashboardViewController: UIViewController {
    
    @IBOutlet weak var collectionCell: UICollectionView!
    
    let viewModel = DashboardViewModel()
    let popularDataList: [PopularMovies] = []
    let nowPlaying: [PopularMovies] = []
    
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
        collectionCell.register(NowPlayingCollectionViewCell.self, forCellWithReuseIdentifier: NowPlayingCollectionViewCell.identifier)
        
        if let cell = collectionCell.collectionViewLayout as? UICollectionViewFlowLayout {
            cell.scrollDirection = .horizontal
            cell.minimumLineSpacing = 2
            let widthCell = (collectionCell.bounds.width - 50) / 2
            cell.estimatedItemSize = CGSize(width: widthCell, height: 500)
        }
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
            .subscribe(onNext: { [weak self] showPopularData
                in
                DispatchQueue.main.async{
                    self?.collectionCell.reloadData()
                }
            })
        
        viewModel.updatedDataNowPlayingMovies
            .asObservable()
            .subscribe(onNext: { [weak self] showNowPlayingData
                in
                DispatchQueue.main.async {
                    self?.collectionCell.reloadData()
                }
            })
    }
    
    
}; extension DashboardViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let dataSources = CollectionCellDashboardView.allCases[section]
        
        switch dataSources {
        case .popularMovies:
            return viewModel.updatedDataPopularMovies.value.count
        case .nowPlayingMovies:
            return viewModel.updatedDataNowPlayingMovies.value.count
        case .topRatedMovies:
            print("masih belum ada..")
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let dashboardCells = CollectionCellDashboardView.allCases[indexPath.row]
        
        switch dashboardCells {
        
        // --MARK: Popular Movie collection cells
        case .popularMovies:
            let data = viewModel.updatedDataPopularMovies.value[indexPath.row]
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PopularMoviesCollectionViewCell.identifier, for: indexPath) as? PopularMoviesCollectionViewCell else {
                return UICollectionViewCell()
            }
            
            cell.setupUI(movieImage:"https://image.tmdb.org/t/p/w780\(data.poster_path ?? "")", movieTitle: data.original_title ?? "", movieRatingLbl: data.vote_average ?? 0.0 )
            return cell
            
         // --MARK: Now Playing Movie collection cells
        case .nowPlayingMovies:
            let data = viewModel.updatedDataNowPlayingMovies.value[indexPath.row]
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NowPlayingCollectionViewCell.identifier, for: indexPath) as? NowPlayingCollectionViewCell else {
                return UICollectionViewCell()
            }
            
            cell.setupUI(movieTitle: data.original_title ?? "", movieImage: "https://image.tmdb.org/t/p/w78\(data.poster_path ?? "")" , genre: data.genre_ids?[1] ?? 0, rating: data.vote_average ?? 0.0 )
            return cell
            
        default:
            return UICollectionViewCell()
        }
        
    }
}
