//
//  HomepageViewController.swift
//  UrunlerApp
//
//  Created by Kaan Uzun on 7.05.2024.
//

import UIKit

class HomepageViewController: UIViewController {
  @IBOutlet weak var productsTableView: UITableView!
  var productsList = [Products]()

  override func viewDidLoad() {
    super.viewDidLoad()

    let u1 = Products(id: 1 , ad: "Macbook Pro 14", resim : "bilgisayar",fiyat: 43000)
    let u2 = Products(id: 2 , ad: "Rayban Club Master", resim : "gozluk",fiyat: 2500)
    let u3 = Products(id: 3 , ad: "Sony ZX Series", resim : "kulaklik",fiyat: 40000)
    let u4 = Products(id: 4 , ad: "Gio Armani", resim : "parfum",fiyat: 2000)
    let u5 = Products(id: 5 , ad: "Casio X Series", resim : "saat",fiyat: 8000)
    let u6 = Products(id: 6 , ad: "Dyson V8", resim : "supurge",fiyat: 18000)
    let u7 = Products(id: 7 , ad: "IPhone 13", resim : "telefon",fiyat: 32000)
    productsList.append(u1)
    productsList.append(u2)
    productsList.append(u3)
    productsList.append(u4)
    productsList.append(u5)
    productsList.append(u6)
    productsList.append(u7)

    productsTableView.delegate = self
    productsTableView.dataSource = self

    productsTableView.separatorColor = UIColor(named: "arkaplanRenk")
  }
}


extension HomepageViewController : UITableViewDelegate,UITableViewDataSource, CellProtocol {

  func addToCartClicked(indexPath: IndexPath) {
    let product = productsList[indexPath.row]
    print("Homepage : \(product.ad!) added to cart")
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return productsList.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "urunlerHucre") as! ProductsCell

    let product = productsList[indexPath.row]

    cell.imageViewProduct.image = UIImage(named: product.resim!)
    cell.labelProductName.text = product.ad
    cell.labelProductPrice.text = "\(product.fiyat!) ₺"

    cell.backgroundColor = UIColor(named: "arkaplanRenk")

    cell.cellBackground.layer.cornerRadius = 10.0

    cell.selectionStyle = .none

    cell.cellProtocol = self
    cell.indexPath = indexPath

    return cell
  }


  func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
    let product = productsList[indexPath.row]

    let deleteAction = UIContextualAction(style: .destructive, title: "Delete"){ _,_,_ in
      print("\(product.ad!) Deleted.")
    }
    let editAction = UIContextualAction(style: .normal, title: "Edit"){ _,_,_ in
      print("\(product.ad!) Edited.")
    }
    return UISwipeActionsConfiguration(actions: [deleteAction,editAction])
  }

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let product = productsList[indexPath.row]
    performSegue(withIdentifier: "toDetails", sender: product)
  }

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "toDetails" {
      if let product = sender as? Products {
        let vc = segue.destination as! ProductDetailsViewController
        vc.product = product
      }
    }
  }

}

