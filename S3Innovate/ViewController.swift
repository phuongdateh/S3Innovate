//
//  ViewController.swift
//  S3Innovate
//
//  Created by phuong.doan on 7/6/21.
//

import UIKit
import RxSwift

class ViewController: UIViewController {
    
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    func getCards() -> Observable<[Card]> {
        let request = CardRequest()
        let client = APIClient<Card>()
        return Observable<[Card]>.create { observer in
            client.request(apiRequest: request).subscribe(onNext: { cards in
                observer.onNext(cards )
                return
            }, onError: { error in
                observer.onError(error)
                return
            })
        }
    }


}

