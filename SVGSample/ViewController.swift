//
//  ViewController.swift
//  SVGSample
//
//  Created by Hikaru Kuroda on 2022/04/26.
//

import UIKit
import SVGKit

class ViewController: UIViewController {

    let imageView = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()

        let url = URL(string: "http://simpleicon.com/wp-content/uploads/android.svg")!
        let task = URLSession.shared.dataTask(with: url) { data, response, err in
            if let err = err {
                print(err)
                return
            }

            guard let data = data else { return }

            let svg = SVGKImage(data: data)

            DispatchQueue.main.async {
                self.imageView.image = svg?.uiImage
            }
        }

        task.resume()

        view.backgroundColor = .white
        view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 400).isActive = true

    }


}

