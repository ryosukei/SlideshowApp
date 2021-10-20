//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 青野　凌介 on 2021/10/19.
//

import UIKit

class ViewController: UIViewController {
    let images = ["cat1","cat2","cat3"]
    var index:Int = 0
    var timer:Timer!
    @IBOutlet weak var timerText: UIButton!
    @IBOutlet weak var backLabel: UIButton!
    @IBOutlet weak var goLabel: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imageView.image = UIImage(named: "cat1")
    }
    //　画像を戻す
    @IBAction func back(_ sender: Any) {
        if(index != 0){
            index = index - 1
            imageView.image = UIImage(named: images[index])
        }else{
            index = images.count - 1
            imageView.image = UIImage(named: images[index])
        }
    }
    //　スライドショー
    @IBAction func slide(_ sender: Any) {
        if(timer == nil){
            self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(slideImage(_:)), userInfo: nil, repeats: true)
            timerText.setTitle("停止", for: .normal)
            backLabel.isEnabled = false
            goLabel.isEnabled = false
        }else{
            timer.invalidate()
            timer = nil
            backLabel.isEnabled = true
            goLabel.isEnabled = true
            timerText.setTitle("再生", for: .normal)
        }
    }
    @objc func slideImage(_ timer: Timer){
        if(index < images.count - 1){
            index = index + 1
            imageView.image = UIImage(named: images[index])
        }else{
            index = 0
            imageView.image = UIImage(named: images[index])
        }
    }
    //　画像をすすめる
    @IBAction func go(_ sender: Any) {
        if(index < images.count - 1){
            index = index + 1
            imageView.image = UIImage(named: images[index])
        }else{
            index = 0
            imageView.image = UIImage(named: images[index])
        }
    }
    // 遷移先から戻るメソッド
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
       }
    // 遷移先に値を渡す
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let expendingViewController:ExpendingViewController = segue.destination as! ExpendingViewController
        expendingViewController.index = index
    }
    
    // 画面遷移を行う
    @IBAction func onTapImage(_ sender: Any) {
        // タイマーが走っていた時は止める
        if(timer != nil){
            timer.invalidate()
            timer = nil
            backLabel.isEnabled = true
            goLabel.isEnabled = true
            timerText.setTitle("再生", for: .normal)
        }
        performSegue(withIdentifier:"toExpending", sender: nil)
    }
}

