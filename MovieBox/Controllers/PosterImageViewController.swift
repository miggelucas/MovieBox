//
//  PosterImageViewController.swift
//  MovieBox
//
//  Created by Lucas Migge de Barros on 19/07/22.
//

import UIKit

class PosterImageViewController: UIViewController {
    
    var movie : Movie?
    
    @IBOutlet weak var posterImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        guard let movie = movie else {
            return
        }
        
        
        title = movie.title
        Task {
            let imageData = await TmdpAPI.donwloadImageData(withPath: movie.posterPath ?? "")
            let image = UIImage(data: imageData) ?? UIImage()
            posterImageView.image = image
        }
        // Do any additional setup after loading the view.
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
