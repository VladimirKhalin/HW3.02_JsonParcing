//
//  ParceJsonViewController.swift
//  HW3.02_JsonParcing
//
//  Created by Vladimir Khalin on 15.12.2022.
//
import UIKit

final class ParceJsonViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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

