//
//  ViewController.swift
//  UpDownGame
//
//  Created by GREEN on 2020/10/27.
//

import UIKit

class ViewController: UIViewController {

    
//랜덤숫자와 도전횟수 변수 생성
    var randomValue: Int = 0
    var tryCount: Int = 0
    
//스토리보드 내 구성된 요소들의 IBOutlet 지정
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var tryCountLabel: UILabel!
    @IBOutlet weak var sliderValueLabel: UILabel!
    @IBOutlet weak var minimumValueLabel: UILabel!
    @IBOutlet weak var maximumValueLabel: UILabel!

//초기 실행 함수
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

//슬라이더 이미지를 에셋에 업로드된 나만의 이미지로 선언
        slider.setThumbImage(#imageLiteral(resourceName: "slider_thumb"), for: .normal)
        reset()
    }

//슬라이더 조정을 통해 슬라이더로 전달되는 값을 정수형으로 받아 문자열로 수를 표시하는 함수
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        print(sender.value)
        let integerValue: Int = Int(sender.value)
        sliderValueLabel.text = String(integerValue)
    }

//성공과 실패 알림 함수
    func showAlert(message: String) {
        
        let alert = UIAlertController(title: nil,
                                      message: message,
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK",
                                     style: .default) { (action) in
                                        self.reset()
        }
            
            alert.addAction(okAction)
            present(alert,
                    animated: true,
                    completion: nil)
        
    }

//생성된 랜덤숫자와 도전숫자를 비교하여 진행하는 메인함수
    @IBAction func touchUpHitButton(_ sender: UIButton) {
        print(slider.value)
        let hitValue: Int = Int(slider.value)
        slider.value = Float(hitValue)
        
        tryCount = tryCount + 1
        tryCountLabel.text = "\(tryCount) / 5"
        
        if randomValue == hitValue {
            //print("YOU HIT!!")
            showAlert(message: "YOU HIT!!")
            reset()
        } else if tryCount >= 5 {
            //print("YOU LOSE...")
            showAlert(message: "YOU LOSE...")
            reset()
        } else if randomValue > hitValue {
            slider.minimumValue = Float(hitValue)
            minimumValueLabel.text = String(hitValue)
        } else {
            slider.maximumValue = Float(hitValue)
            maximumValueLabel.text = String(hitValue)
        }
        
    }

//리셋버튼을 누를때 동작하는 함수
    @IBAction func touchUpResetButton(_ sender: UIButton) {
        print("touch up reset button")
        reset()
    }

//리셋버튼을 눌러 불러와 게임을 초기값으로 변경하는 함수
    func reset() {
        print("reset!")
        randomValue = Int.random(in: 0...30)
        print(randomValue)
        tryCount = 0
        tryCountLabel.text = "0 / 5"
        slider.minimumValue = 0
        slider.maximumValue = 30
        slider.value = 15
        minimumValueLabel.text = "0"
        maximumValueLabel.text = "30"
        sliderValueLabel.text = "15"
    }
}

