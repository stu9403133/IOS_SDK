//
//  SearchViewController.swift
//  IOS_SDK
//
//  Created by stu on 2023/12/19.
//

import UIKit



class SearchViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    @IBOutlet weak var picture: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func choicePic(_ sender: Any) {
        let controller = UIImagePickerController()
        controller.sourceType = .photoLibrary
        controller.delegate = self
        present(controller, animated: true)
    }
    
    func switchAlert(image: UIImage) -> UIAlertController{
        let alertController = UIAlertController(title: "確定要換照片嗎？", message: "這將立即更換片", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { UIAlertAction in
            
            self.picture.image = image
            self.dismiss(animated: true)
        }
        alertController.addAction(okAction)
        
        let cancelAction = UIAlertAction(title: "取消", style: .cancel)
        alertController.addAction(cancelAction)
        show(alertController, sender: true)
        return alertController

    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        print("選到一張圖片")
        if let image = info[.originalImage] as? UIImage {
            show(switchAlert(image: image), sender: nil)
        }
        
    }
    
    
    
    
//    @IBAction func sendText(_ sender: Any) {
//        let controller = AVPlayerViewController()
//        let url = URL(string: "https://video-ssl.itunes.apple.com/apple-assets-us-std-000001/Video128/v4/ac/7c/62/ac7c6274-60ea-5b7c-4c99-f08d78bfe574/mzvf_484000410198456586.640x352.h264lc.U.p.m4v")!
//        let player = AVPlayer(url: url)
//        controller.player = player
//
//        present(controller, animated: true){
//            player.play()
//        }
//    }
    
    
}



/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destination.
 // Pass the selected object to the new view controller.
 }
 */


