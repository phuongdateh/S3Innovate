//
//  CreateCardViewController.swift
//  S3Innovate
//
//  Created by phuong.doan on 7/10/21.
//

import Foundation
import RxSwift
import RxCocoa

class CreateCardViewController: ViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameTf: UITextField!
    @IBOutlet weak var addressTf: UITextField!
    @IBOutlet weak var positionTf: UITextField!
    @IBOutlet weak var aboutTf: UITextField!
    @IBOutlet weak var genderTf: UITextField!
    @IBOutlet weak var dobTf: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    private var cancelButton: UIButton!
    
    // MARK: - Properties
    var viewModel: CreateCardViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configUI()
        binds()
    }
    
    private func binds() {
        if viewModel == nil {
            return 
        }
        
        let output = viewModel.transform(input: .init(name: nameTf.rx.text.orEmpty.asDriver(),
                                                      position: positionTf.rx.text.orEmpty.asDriver(),
                                                      address: addressTf.rx.text.orEmpty.asDriver(),
                                                      gender: genderTf.rx.text.orEmpty.asDriver(),
                                                      dob: dobTf.rx.text.orEmpty.asDriver(),
                                                      about: aboutTf.rx.text.orEmpty.asDriver(),
                                                      saveAction: saveButton.rx.tap.asDriver(),
                                                      cancelAction: cancelButton.rx.tap.asDriver()))
        output.dismiss
            .drive()
            .disposed(by: disposeBag)
        output.saveEnable
            .drive(saveButton.rx.isEnabled)
            .disposed(by: disposeBag)
    }
    
    private func configUI() {
        title = "NEW CARD VISIT"
        imageView.layer.cornerRadius = imageView.frame.width / 2
        saveButton.layer.cornerRadius = 5
        
        let textfields = [nameTf, positionTf, addressTf, genderTf, dobTf, aboutTf]
        textfields.forEach({ $0?.autocorrectionType = .no})
        addLeftBarButton()
    }
    
    private func addLeftBarButton() {
        cancelButton = UIButton()
        cancelButton.setImage(.init(named: "close"), for: .normal)
        let leftBarButton = UIBarButtonItem.init(customView: cancelButton)
        navigationItem.setLeftBarButton(leftBarButton, animated: true)
    }
    
    
}
