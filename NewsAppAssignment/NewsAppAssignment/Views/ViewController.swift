//
//  ViewController.swift
//  NewsAppAssignment


import UIKit
import SwiftUI


class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UISearchBarDelegate, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var newsCollection: UICollectionView!
    
    var filterData : [Article?] = []
    let newsVM: ViewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        title = "News Headlines"
        self.searchBar.delegate = self
        newsVM.getNews { (response, error) in
            guard let _ = error else {
                DispatchQueue.main.async {
                    self.filterData = response ?? []
                    self.newsCollection.reloadData();
                }
                return
            }
        }
    }
    
    //MARK: CollectionView
    
    //Defining number of sections in CollectionView
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        filterData.count
    }
    
    //Presenting the data in the cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as? CustomCell
        let article = filterData[indexPath.row]
        let title = article?.title
        let author = article?.author
        let imageUrl = article?.urlToImage
        cell?.setData(title: title!, author: author!, image: imageUrl!)
        return cell!
    }
    
    //Handling Tap on CollectionView cells
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let article : [Article?] = [filterData[indexPath.row]]
        let newsDetailsView = NewsDetailsView(data: article, indexPath : indexPath.row)
        let host = UIHostingController(rootView: newsDetailsView)
        navigationController?.pushViewController(host, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = collectionView.frame.size.height
        let width = collectionView.frame.size.width
        return CGSize (width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    //MARK: Search Bar
    //SearchBar implementation
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let enteredText = searchText.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
        if !enteredText.isEmpty {
            filterData = newsVM.data.filter({ (article) -> Bool in
                article?.title.lowercased().contains(enteredText) ?? false || article?.description.lowercased().contains(enteredText) ?? false || article?.content.lowercased().contains(enteredText) ?? false
            })
        } else {
            filterData = newsVM.data
        }
        self.newsCollection.reloadData()
    }
    
    
}

