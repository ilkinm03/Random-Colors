//
//  ColorsDetailsVC.swift
//  RandomColors
//
//  Created by Ilkin Mammadli on 27.04.24.
//

import UIKit

class ColorsDetailVC: UIViewController {
    
    @IBOutlet weak var colorLabel: UILabel!
    var color: UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGesture = UITapGestureRecognizer(
            target: self, action: #selector(labelTapped(_:))
        )
        colorLabel.isUserInteractionEnabled = true
        colorLabel.addGestureRecognizer(tapGesture)
        view.backgroundColor = color ?? UIColor.systemBackground
        colorLabel.textColor = color?.inverted()
        navigationController?.navigationBar.tintColor = colorLabel.textColor
        colorLabel.text = color?.toHex()
        colorLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
    }
    
    @objc func labelTapped(_ sender: UITapGestureRecognizer) {
            UIPasteboard.general.string = colorLabel.text
            let alert = UIAlertController(title: "Copied!", message: "Text copied to clipboard", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
    }
}
