//
//  LauncVC.swift
//  Hostes
//
//  Created by Zeynep Müslim on 19.12.2020.
//

import UIKit

class LauncVC: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    var images:[String] = []
    var timer = Timer()
    var photoCount:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let wi = view.frame.size.width
        let he = view.frame.size.height
        
        imageView.frame = CGRect(x: wi * 0.5 - wi * 0.4 / 2, y: he * 0.3, width: wi * 0.4, height: wi * 0.4)
        
        images = ["frame-1","frame-2","frame-3","frame-4"]
        imageView.image = UIImage.init(named: "frame-1")
        timer = Timer.scheduledTimer(timeInterval: 0.15, target: self, selector: #selector(onTransition), userInfo: nil, repeats: true)
        // Do any additional setup after loading the view.
    }
    
    @objc func onTransition() {
        if (photoCount < images.count - 1){
            photoCount = photoCount  + 1;
        }else{
            photoCount = 0;
        }

        UIView.transition(with: self.imageView, duration: 0.0, options: .transitionCrossDissolve, animations: {
            self.imageView.image = UIImage.init(named: self.images[self.photoCount])
        }, completion: nil)
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
