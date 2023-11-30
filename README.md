## Swift-Boilerplate
- 내 스타일대로 만든 프로젝트 템플릿
- Code base, MVVM

## 프로젝트 생성하는 방법
1. Open Terminal
2. Go to the folder where you want to create the project
3. Command - git clone https://github.com/cho1490/Swift-Boilerplate.git ProjectName
4. Command - cd ProjectName
5. Command - ./init
6. Command - pod install
7. Create project

## 프레임워크
 - [RxSwift]
 - [RxCocoa]
 - [Then]
 - [SnapKit]

## 폴더 구조
```bash
├── Info.plist
│
├── 📂 Application
│   ├── AppDelegate
│   ├── SceneDelegate
│   ├── Application
│   └── Navigator
│ 
├── 📂 Base
│   ├── BaseViewController
│   ├── BaseTabBarController
│   ├── BaseView
│   └── BaseViewModel
│
├── 📂 Presentation
│   ├── 📂 Splash
│   │   ├── SplashViewController
│   │   └── SplashViewModel
│   │   
│   └── 📂 Main
│       ├── MainTabBarController
│       ├── 📂 A
│       │   ├── AViewController
│       │   └── AViewModel
│       │
│       ├── 📂 B
│       │   ├── BViewController
│       │   └── BViewModel
│       │
│       └── 📂 C
│           ├── CViewController
│           └── CViewModel
│
├── 📂 Repository
│   ├── 📂 Error
│   │   ├── NetworkError
│   │   └── KeyChainError
│   │
│   ├── 📂 Remote
│   │   ├── 📂 Type
│   │   │   ├── HeaderType
│   │   │   └── UrlType
│   │   │
│   │   ├── NetworkProtocol
│   │   ├── NetworkService
│   │   └── TestNetworkService 
│   │   
│   └── 📂 Local
│       ├── 📂 UserDefaults 
│       │   └── UserDefaultsHelper
│       │
│       └── 📂 KeyChain
│           └── KeychainHelper
│
├── 📂 Common
│
├── 📂 Util
│
├── 📂 Extension
│
└── 📂 CustomView
``` 
