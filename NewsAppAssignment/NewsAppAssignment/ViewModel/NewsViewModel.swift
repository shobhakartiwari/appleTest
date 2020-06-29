//
//  NewsViewModel.swift
//  NewsAppAssignment


import Foundation

protocol NewsArticleProtocol {
    func getNews(completion: @escaping ([Article?]?,Error?) -> ())
}

class ViewModel: NewsArticleProtocol {
    var data: [Article?] = []

    var articleURL2Id : [String: Int] = [:]

    let endPoint = Constants.endpointURL
    
    //Fetching the data and storing it for the given end point
    func getNews(completion: @escaping ([Article?]?,Error?) -> ()) {
            ApiHandler.sharedInstance.getData(urlString: self.endPoint) { (response, error) in
                if let newsResponse = response {
                    self.data = newsResponse.articles
                    completion(self.data, nil)
                } else {
                    completion(nil, error)
                }
            }
    }
}


