//
//  HomeViewModel.swift
//  Ichigo
//
//  Created by Ichigo iOS Team on 15/06/22.
//  

import Foundation

protocol HomeDelegate: AnyObject {
    func didReceive(movie: [Movie])
    func didError()
}

class HomeViewModel {

    var delegate: HomeDelegate?
    var totalPage: Int = 0
    var currentPage: Int = 1
    var movieInfo: [Movie] = []
    
    func fetchByPopular(page: Int, includeAdult: Bool = false) {
        NetworkingManager.shared.request(.discover(page: page, inclueAdult: includeAdult), method: .get) { [weak self] (result: Result<HomeModel.Response, Error>) in
            switch result {
            case .success(let response):
                print(response.results)
                self?.currentPage += 1
                self?.totalPage = response.total_pages
                self?.movieInfo.append(contentsOf: response.results)
                self?.delegate?.didReceive(movie: self?.movieInfo ?? [])
            case .failure(let failure):
                print(failure)
                self?.delegate?.didError()
            }
        }
    }
}
