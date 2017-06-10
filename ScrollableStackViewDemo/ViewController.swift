//
//  ViewController.swift
//  ScrollableStackViewDemo
//
//  Created by Gaurav Keshre on 10/06/17.
//  Copyright © 2017 Gaurav Keshre. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var stackView: UIStackView!
    
    /** for random colors*/
    static var currentColorIndex = 1
    let colors: [UIColor] = [#colorLiteral(red: 0.8622617126, green: 0.3052324057, blue: 0.2546724081, alpha: 1), #colorLiteral(red: 0.3098039329, green: 0.2039215714, blue: 0.03921568766, alpha: 1), #colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1), #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1), #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)]
    var nextColor: UIColor {
        let next =  ViewController.currentColorIndex % colors.count
        ViewController.currentColorIndex += 1
        return colors[next]
    }
    /** End Randomness */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateStackView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    //MARK:- UI Methods
    //--------------------------
    
    private func populateStackView(){
        for i in 1 ... 30{
            let title = "\(i)"
            let btn = createButton(title: title)
            stackView.addArrangedSubview(btn)
        }
    }

    //MARK:- Actions
    //--------------------------
    @IBAction func handleAddbutton(_ sender: UIButton){
        let btn = createButton()
        stackView.addArrangedSubview(btn)
    }
    
    func handleTapOn(_ sender: UIButton){
        UIView.animate(withDuration: 0.3, animations: { 
            sender.isHidden = true
        }) { (complete) in
            if complete{
                self.stackView.removeArrangedSubview(sender)
                sender.removeFromSuperview()
            }
        }
    }

    //MARK:- UIFactory Methods
    //--------------------------
    
    private func createButton(title: String? = nil) -> UIButton{
        var fr = stackView.bounds
        fr.size.height = 40
       let button = UIButton(frame: fr)
        button.backgroundColor = nextColor
        button.titleLabel?.text = title ?? "Hi"
        button.addTarget( self, action: #selector(handleTapOn(_:)), for: .touchDown)
        return button
    }


}
