//
//  ViewController.swift
//  Sopt_1Week
//
//  Created by Jaehyun Ahn on 10/10/24.
//
import UIKit


// 커스텀 뷰를 위한 UITextViewDelegate 추가
class ViewController: UIViewController, UITextViewDelegate {

  
    
    
    private let titleLabel_1: UILabel = {
      let label = UILabel()
      label.text = "이름이 뭐에요? what your name?~"
     
        // SwiftUI의 Title처럼 설정
      label.font = UIFont.preferredFont(forTextStyle: .title1)
        
        //줄의 갯수, 0이면 줄 수에 제한 없음
      label.numberOfLines = 0
        
        //정렬
      label.textAlignment = .center
      label.textColor = .white
      return label
    }()


      
      /*
        -----------------------
        UITextField 특징
        -----------------------
        - 용도: 한 줄의 텍스트 입력에 적합 (예: 사용자 이름, 비밀번호)
        - 기본적으로 한 줄 입력만 가능
          * 텍스트가 입력 필드를 넘어가면 자동으로 줄바꿈 없이 스크롤됨
        - 입력에 따른 실시간 유효성 검사나 제한을 쉽게 구현 가능
        - Return 키로 입력을 완료하고 키보드 숨기기 가능
        - placeholder 속성을 통해 힌트 텍스트 제공
        -----------------------
      */

    
    private let idTextField: UITextField = {
      let textField = UITextField()
      textField.placeholder = "존함을 적어주세요."
     
        // 텍스트 필드 편집 시 입력 내용 지우기 버튼 표시 , 텍스트 필드의 오른쪽에 작은 X 버튼이 나타남
        textField.clearButtonMode = .whileEditing

        // 이메일 키보드 -> .numbersAndPunctuation 는 일반 키보드
        textField.keyboardType = .emailAddress
       
        // 텍스트 필드의 테두리 색상을 회색으로 설정
        textField.layer.borderColor = UIColor.gray.cgColor

        // 텍스트 필드의 테두리 두께를 1로 설정
        textField.layer.borderWidth = 1

        
        textField.backgroundColor = .white
        textField.textColor = .black
      return textField
    }()


    

      
      private let titleLabel_2: UILabel = {
        let label = UILabel()
        label.text = "다짐을 적어주세요!"
          // SwiftUI의 Title처럼 설정
          label.font = UIFont.preferredFont(forTextStyle: .title1)
          label.textColor = .white
        //줄의 갯수, 0이면 줄 수에 제한 없음
          label.numberOfLines = 0
          //정렬
        label.textAlignment = .center
        return label
      }()
      
    
    
    
    //커스텀 UITextView를 위한 변수 초기화
    private let placeholderText = "다짐을 적어주세요!"

      
      /*
        -----------------------
        UITextView 특징
        -----------------------
        - 용도: 메모, 설명, 긴 글 입력 등 다중 라인 입력에 적합
        - 기본적으로 스크롤을 지원함:
          * 텍스트가 크기를 넘어가면 자동으로 스크롤
        - 여러 줄 텍스트 입력에 적합
       
       근데,, placeholder 지원을 안 하기에 placeholder를 쓰고 싶으면 커스텀 뷰를 사용해야함.

        -----------------------
      */
      
    private let contentTextView: UITextView = {
      let textView = UITextView()

      textView.font = .systemFont(ofSize: 14)
      textView.layer.borderColor = UIColor.gray.cgColor
      textView.layer.borderWidth = 1
      textView.layer.cornerRadius = 5
      textView.backgroundColor = .white
      textView.textColor = .lightGray // 기본 placeholder 색상
      textView.text = "다짐을 적어주세요!" // 초기 placeholder 텍스트

        return textView
    }()

    // UITextViewDelegate 메서드: 텍스트뷰가 편집을 시작할 때 호출됨
       func textViewDidBeginEditing(_ textView: UITextView) {
           if textView.text == placeholderText {
               textView.text = "" // placeholder를 지우고
               textView.textColor = .black // 실제 입력 색상으로 변경
           }
       }

       // UITextViewDelegate 메서드: 텍스트뷰 편집이 끝날 때 호출됨
       func textViewDidEndEditing(_ textView: UITextView) {
           if textView.text.isEmpty { // 아무 내용이 없으면 placeholder 다시 설정
               textView.text = placeholderText
               textView.textColor = .lightGray
           }
       }
      
      
      
      
      // 타이틀, 이름, 다짐, 3가지 데이터를 가지고 sheet, navi, popover
      
    private lazy var nextButton: UIButton = {
      let button = UIButton()
      button.setTitle("let it go", for: .normal)
      button.backgroundColor = .tintColor
      button.setTitleColor(.white, for: .normal)
      button.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
      button.layer.cornerRadius = 10
        
      return button
    }()
    
    
    
      //타이틀 바꾸는 메뉴 버튼
      
      private lazy var changeButton: UIButton = {
          let button = UIButton()
          button.setTitle("전환모드변경", for: .normal)
          button.backgroundColor = .tintColor
          button.setTitleColor(.white, for: .normal)
          button.layer.cornerRadius = 10
          button.menu = createMenu() // 버튼에 UIMenu
          button.showsMenuAsPrimaryAction = true // 버튼 누르면 바로 메뉴 뜨도록 설정
          return button
      }()

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    // 선택된 모드를 저장할 변수 (1: sheet, 2: navigation, 3: fullscreen)
    private var selectedMode: Int = 0

      
    // 메뉴 생성 함수
    private func createMenu() -> UIMenu {
        let item1 = UIAction(title: "모달", image: nil) { _ in
            self.updateTitleLabel(with: "모달")
            self.selectedMode = 1
        }
        let item2 = UIAction(title: "네비게이션", image: nil) { _ in
            self.updateTitleLabel(with: "네비게이션")
            self.selectedMode = 2
        }
        let item3 = UIAction(title: "풀스크린", image: nil) { _ in
            self.updateTitleLabel(with: "풀스크린")
            self.selectedMode = 3
        }

        return UIMenu(title: "고르면 마법이 일어나요!!!", children: [item1, item2, item3])
    }

    // createMenu의 타이틀 업데이트 함수
    private func updateTitleLabel(with title: String) {
        titleLabel_1.text = title
    }
    
    
    
    // nextButton을 눌렀을 때 동작하는 함수
    @objc private func nextButtonTapped() {
        
        //titleLabel_1.text 의 초기화를 진행하였으니 따론 오류 처리를 하지 않았음.
        
        guard let name = idTextField.text,
              let message = contentTextView.text
        else {
              // 텍스트의 값들이 없으면 함수가 return
            return print("error")
          }
        
        switch selectedMode {
            
        case 0: // sheet
            let detailVC = DetailViewController()
            
            // 'detailVC'가 화면에 표시될 때의 모달 스타일을 설정함.
            detailVC.modalPresentationStyle = .automatic
            
            
            // 'detailVC'에 데이터를 전달하기 위해 'setupData' 메서드를 호출함.
            // titleLabel_1, idTextField, contentTextView에서 텍스트 데이터를 가져와 전달함.
            // 각 텍스트 필드에 값이 없으면 빈 문자열("")을 전달함.
            detailVC.setupData(title: titleLabel_1.text ?? "", name : name, message: message)
            
            // 'detailVC'를 현재 화면에 모달로 띄움.
            // 'animated: true'는 애니메이션을 사용하여 전환할지 여부를 나타냄.
            // 'completion: nil'은 뷰 컨트롤러가 표시된 후 실행할 추가 작업이 없음을 나타냄.
            present(detailVC, animated: true, completion: nil)
            
            
        case 1: // sheet
            let detailVC = DetailViewController()
            
            
            detailVC.modalPresentationStyle = .automatic
            
            detailVC.setupData(title: titleLabel_1.text ?? "", name : name, message: message)
            
            present(detailVC, animated: true, completion: nil)
            
        case 2: // navigation
            let detailVC = DetailViewController()
            
            detailVC.setupData(title: titleLabel_1.text ?? "", name : name, message: message)

            
            // 현재 네비게이션 스택에 'detailVC'를 push하여 새로운 화면으로 이동함.
            // 네비게이션 컨트롤러는 히스토리 관리를 하며, 'back' 버튼을 통해 이전 화면으로 돌아갈 수 있게 됨.
            // 'animated: true'는 애니메이션 효과를 사용하여 화면 전환을 할지 여부를 설정함.
            self.navigationController?.pushViewController(detailVC, animated: true)
            
            
            
            
            
            
        case 3: // 모달의 fullScreen
            let detailVC = DetailViewController()
            
            detailVC.setupData(title: titleLabel_1.text ?? "", name : name, message: message)

            detailVC.modalPresentationStyle = .fullScreen

            present(detailVC, animated: true, completion: nil)


        default:
            print("메뉴 선택 부탁드립니다.")
        }
    }
    
    
    
    
    
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
        setUI()
        setLayout()
        
        // 델리게이트 설정
        contentTextView.delegate = self
    }

    
    
    
    
    // UI 설정
    private func setUI() {
        [titleLabel_1, idTextField, titleLabel_2, contentTextView, nextButton, changeButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview($0)
        }
    }

    // Layout 설정
    private func setLayout() {
        NSLayoutConstraint.activate([
            
            
            titleLabel_1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel_1.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            
            idTextField.topAnchor.constraint(equalTo: titleLabel_1.bottomAnchor, constant: 20),
            idTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            idTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            idTextField.heightAnchor.constraint(equalToConstant: 40),

    
           titleLabel_2.topAnchor.constraint(equalTo: idTextField.bottomAnchor, constant: 20),
           titleLabel_2.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            contentTextView.topAnchor.constraint(equalTo: titleLabel_2.bottomAnchor, constant: 20),
            contentTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            contentTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            contentTextView.heightAnchor.constraint(equalToConstant: 200),

            nextButton.topAnchor.constraint(equalTo: contentTextView.bottomAnchor, constant: 40),
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextButton.heightAnchor.constraint(equalToConstant: 50),
            nextButton.widthAnchor.constraint(equalToConstant: 100),

            changeButton.topAnchor.constraint(equalTo: nextButton.bottomAnchor, constant: 20),
            changeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            changeButton.heightAnchor.constraint(equalToConstant: 50),
            changeButton.widthAnchor.constraint(equalToConstant: 100)
        ])
    }

   
}
