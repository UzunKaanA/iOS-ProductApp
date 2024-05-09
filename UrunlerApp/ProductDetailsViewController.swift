//
//  ProductDetailsViewController.swift
//  UrunlerApp
//
//  Created by Kaan Uzun on 9.05.2024.
//

import UIKit

class ProductDetailsViewController: UIViewController {

  @IBOutlet weak var lblPrice: UILabel!
  @IBOutlet weak var ivFilm: UIImageView!

  var product:Products?

  override func viewDidLoad() {
        super.viewDidLoad()

    if let u = product {
      self.navigationItem.title = u.ad
      ivFilm.image = UIImage(named: u.resim!)
      lblPrice.text = "\(u.fiyat!) ₺"
    }

    }
    
  @IBAction func btnAddToCart(_ sender: Any) {
    if let u = product {
      print("Product Details: Added To Cart \(u.ad!)")
    }
  }

}
