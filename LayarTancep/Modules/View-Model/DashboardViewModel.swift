//
//  DashboardViewModel.swift
//  LayarTancep
//
//  Created by Salma Ayuningtyas on 11/9/25.
//

import Foundation
import RxSwift
import RxRelay

enum DashboardConditionsType {
    case sucess
    case failure
}

protocol DashboardViewModelInputStream {
    func showPopularMovies()
    func onViewDidLoad()
}

protocol DashboardViewModelOuputStream {
    var isUpdateDataPopularMovies: Observable<[PopularMoviesDataResults]> {get}
}


class DashboardViewModel {
    var updatedDataPopularMovies = BehaviorRelay<[PopularMoviesDataResults]>(value: [])
    let apiService = APIServices()
};

extension DashboardViewModel {
    var inputs: DashboardViewModelInputStream { return self}
    var ouputs: DashboardViewModelOuputStream {return self}
};

extension DashboardViewModel: DashboardViewModelInputStream {
    func onViewDidLoad() {
        showPopularMovies()
    }
    
    func showPopularMovies() {
        apiService.popularMovieslist { [weak self] data in
            guard let self = self else {return}
            
            DispatchQueue.main.async {
                if let successData = data {
                    self.updatedDataPopularMovies.accept(successData)
                }

            }
        }
    }
};

extension DashboardViewModel: DashboardViewModelOuputStream {
    var isUpdateDataPopularMovies: RxSwift.Observable<[PopularMoviesDataResults]> {
        return updatedDataPopularMovies.asObservable()
    }
    
    
}
