//
//  WelcomeViewController.swift
//  Fruit Info
//
//  Created by Prince Alvin Yusuf on 20/04/21.
//

import UIKit

class WelcomeViewController: UIViewController, UIScrollViewDelegate {
    
    // MARK: - UI COMPONENT
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageOneImageView: UIImageView!
    @IBOutlet weak var pageTwoImageView: UIImageView!
    @IBOutlet weak var pageThreeImageView: UIImageView!
    @IBOutlet weak var startButton: UIButton!
    
    // MARK: - GLOBAL VARIABLE
    let filledImage = UIImage(named: "oval")
    let unFilledImage = UIImage(named: "oval_")
    var selectedIndex = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        let slides = createSlides()
        setupScrollView(slides)
    }
    
    func createSlides() -> [SlideView] {
        
        let slideOne = Bundle.main.loadNibNamed("SlideView", owner: self, options: nil)?.first as! SlideView
        slideOne.welcomeImage.image = UIImage(named: "illustrateOne")
        slideOne.underImageLabel.text = "Lorem Ipsum"
        slideOne.descriptionLabel.text = "Lorem Ipsum Dolor Sit Amet"
        
        let slideTwo = Bundle.main.loadNibNamed("SlideView", owner: self, options: nil)?.first as! SlideView
        slideTwo.welcomeImage.image = UIImage(named: "illustrateTwo")
        slideTwo.underImageLabel.text = "Lorem Ipsum"
        slideTwo.descriptionLabel.text = "Lorem Ipsum Dolor Sit Amet"
        
        let slideThree = Bundle.main.loadNibNamed("SlideView", owner: self, options: nil)?.first as! SlideView
        slideThree.welcomeImage.image = UIImage(named: "illustrateTwo")
        slideThree.underImageLabel.text = "Lorem Ipsum"
        slideThree.descriptionLabel.text = "Lorem Ipsum Dolor Sit Amet"
        
        return [slideOne, slideTwo, slideThree]
    }
    
    func setupScrollView(_ slides: [SlideView]) {
        
        scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: scrollView.frame.height)
        scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(slides.count), height: 1.0)
        scrollView.isPagingEnabled = true
        
        for each in 0..<slides.count{
            slides[each].frame = CGRect(x: view.frame.width * CGFloat(each), y: 0, width: view.frame.width, height: scrollView.frame.height)
            scrollView.addSubview(slides[each])
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x/scrollView.frame.width)
        
        
        switch pageIndex {
        case 0:
            selectedIndex = 0
            pageOneImageView.image = filledImage
            pageTwoImageView.image = unFilledImage
            pageThreeImageView.image = unFilledImage
            startButton.isHidden = true
        case 1:
            selectedIndex = 1
            pageTwoImageView.image = filledImage
            pageOneImageView.image = unFilledImage
            pageThreeImageView.image = unFilledImage
            startButton.isHidden = true
        case 2:
            selectedIndex = 2
            pageThreeImageView.image = filledImage
            pageOneImageView.image = unFilledImage
            pageTwoImageView.image = unFilledImage
            startButton.isHidden = false
        default:
            return
        }
    }
    
    
    @IBAction func startPressed(_ sender: UIButton) {
        UserDefaultService.instance.isFirstLaunched = true
        
    }
    
}

class UserDefaultService {
    static let instance = UserDefaultService()
    
    fileprivate let isFirstLaunchedKey = "welcomeShown"
    
    var isFirstLaunched: Bool {
        get {
            return UserDefaults.standard.bool(forKey: isFirstLaunchedKey)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: isFirstLaunchedKey)
        }
    }
}
