//
//  ProductsCell.swift
//  UrunlerApp
//
//  Created by Kaan Uzun on 7.05.2024.
//

import UIKit

protocol CellProtocol {
  func addToCartClicked(indexPath:IndexPath)
}

class ProductsCell: UITableViewCell {
  @IBOutlet weak var cellBackground: UIView!
  @IBOutlet weak var labelProductPrice: UILabel!
  @IBOutlet weak var labelProductName: UILabel!
  @IBOutlet weak var imageViewProduct: UIImageView!

  var cellProtocol:CellProtocol?
  var indexPath:IndexPath?

  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }

  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }

  @IBAction func buttonAddToCart(_ sender: Any) {
    cellProtocol?.addToCartClicked(indexPath: indexPath!)
  }

}

