//
//  ParceJsonViewController.swift
//  HW3.02_JsonParcing
//
//  Created by Vladimir Khalin on 15.12.2022.
//
import UIKit

final class ParceJsonViewController: UIViewController {
    @IBOutlet var criptoCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        criptoCollectionView.delegate = self
        criptoCollectionView.dataSource = self
        
        
        fetchParceJsonFromApi()
    }
    
    private func fetchParceJsonFromApi() {
        
        guard let url = URL(string: UrlLink().urlApi) else { return }
        URLSession.shared.dataTask(with: url) {data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error")
                return
            }
            do {
                let exchangeRate = try JSONDecoder().decode(currencyAbb.self, from: data)
                print(exchangeRate)
            } catch let error {
                print(error)
            }
        }.resume()
    }
}

extension ParceJsonViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let Cell = collectionView.dequeueReusableCell(withReuseIdentifier: "criptoCell", for: indexPath) as! CriptoCollectionViewCell
        
        
        return Cell
    }
}

extension ParceJsonViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 300, height: 50)
    }
    
}
