//
//  ViewController.swift
//  NativeAvatar
//
//  Created by Alexander Ischenko on 24.07.2023.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    //MARK: - Variables
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "person.crop.circle.fill"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.delegate = self
        scrollView.backgroundColor = .white
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.contentSize = CGSize(width: view.frame.width, height: view.frame.height + 100)
        
        return scrollView
    }()
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view = scrollView
        
        setupImageView()
    }
    
    //MARK: - Private Method
    
    private func setupImageView() {
        
        guard let navigationBar = navigationController?.navigationBar else { return }
        
        for subview in navigationBar.subviews {
            if NSStringFromClass(subview.classForCoder).contains("UINavigationBarLargeTitleView") {
                
                subview.addSubview(imageView)
                
                title = "Avatar"
                
                
                imageView.rightAnchor.constraint(equalTo: subview.rightAnchor, constant: -20).isActive = true
                imageView.topAnchor.constraint(equalTo: subview.bottomAnchor, constant: 20).isActive = true
                imageView.bottomAnchor.constraint(equalTo: imageView.superview?.bottomAnchor ?? navigationBar.bottomAnchor, constant: -10).isActive = true
                imageView.heightAnchor.constraint(equalToConstant: 36).isActive = true
                imageView.widthAnchor.constraint(equalToConstant: 36).isActive = true
                
                
            }
        }
    }
}

