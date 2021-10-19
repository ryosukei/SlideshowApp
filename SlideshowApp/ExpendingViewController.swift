//
//  ExpendingViewController.swift
//  SlideshowApp
//
//  Created by 青野　凌介 on 2021/10/19.
//

import UIKit

class ExpendingViewController: UIViewController {
    let images = ["cat1","cat2","cat3"]
    var index:Int = 0
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage(named: images[index])
        imageView.transform = CGAffineTransform(scaleX: 2.5, y: 2.5)
        // Do any additional setup after loading the view.
    }
    // 遷移先に値を渡す
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let viewController:ViewController = segue.destination as! ViewController
        viewController.index = index
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
