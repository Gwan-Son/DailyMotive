# 🖋️ 필담
당신의 마음과 매일 새로운 명언으로 나누는 필담

## 목차
- [🚀 개발 기간](#-개발-기간)
- [💻 개발 환경](#-개발-환경)
- [🌐 Combine을 통한 비동기 처리](#-combine을-통한-비동기-처리)
- [📐 MVVM 아키텍쳐](#-mvvm-아키텍쳐)
- [✏️ 글씨체 변경](#-%EF%B8%8F-글씨체-변경)
- [📁 파일 구조](#-파일-구조)

---

# 🚀 개발 기간
24.04.22 ~ 24.05.21 (약 1개월) -> 앱스토어 심사 리젝. 사유 : Design:Spam

# 💻 개발 환경
- `XCode 15.2`
- `Swift 5.9.2`

<p align="center" width="100%">
  <img src="https://github.com/Gwan-Son/DailyMotive/assets/38202152/8fe9c600-c16e-4720-b096-570bd8bac60b" width="30%">
  <img src="https://github.com/Gwan-Son/DailyMotive/assets/38202152/49df7862-946b-480f-8c92-3a96d188cd22" width="30%">
  <img src="https://github.com/Gwan-Son/DailyMotive/assets/38202152/f2d855b6-9df2-473c-b8f5-687fb6809168" width="30%">
</p>

# 🌐 Combine을 통한 비동기 처리
URLSession을 통해 JSON파일을 불러오는 코드를 Combine을 통해 비동기 처리를 하였습니다. Combine을 사용하지 않았을 때는 JSON을 파일을 불러오려면 콜백함수를 작성하고 수동으로 데이터 변환 코드를 작성해야하지만, Combine을 활용하면 단일 구문으로 데이터 스트림을 설정할 수 있고 'map' 연산자를 사용하여 간단하게 데이터를 변환할 수 있었습니다. 또한, 코드 유지보수를 할 때에도 선언적 프로그래밍을 통해 코드의 가독성을 높여 간편히 할 수 있었습니다.
```
//NetworkService.swift
final class NetworkService {
    let session: URLSession
    
    init(configuration: URLSessionConfiguration) {
        session = URLSession(configuration: configuration)
    }
    
    func load<T>(_ resource: Resource<T>) -> AnyPublisher<T, Error> {
        guard let request = resource.urlRequest else {
            return .fail(NetworkError.invalidRequest)
        }
        
        return session
            .dataTaskPublisher(for: request)
            .tryMap { result -> Data in
                guard let response = result.response as? HTTPURLResponse,
                      (200..<300).contains(response.statusCode)
                else {
                    let response = result.response as? HTTPURLResponse
                    let statusCode = response?.statusCode ?? -1
                    throw NetworkError.responseError(statusCode: statusCode)
                }
                return result.data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
```

```
//homeViewModel.swift
network.load(resource)
            // "quotes" 이름만 가져옴
            .map { $0.quotes }
            // 에러처리는 빈 배열로 리턴
            .replaceError(with: [])
            // 해당 코드가 돌아갈 쓰레드
            .receive(on: DispatchQueue.main)
            // 가져온 결과값을 quotes 배열에 저장
            .sink(receiveValue: { [weak self] fetchQuotes in
                self?.quotes = fetchQuotes
                self?.randomQuoteViewModel.setup(with: fetchQuotes)
                self?.isLoading = false // 데이터 로딩 완료
            })
            .store(in: &subscriptions)
```

# 📐 MVVM 아키텍쳐
MVVM 아키텍쳐를 사용함으로써 View와 Model 간의 명확한 분리로 코드의 모듈화를 하였습니다. ViewModel의 데이터를 바인딩하여 View에 사용하는 방식으로 코드의 재사용성과 유지보수성을 향상하였습니다.

<img width="224" src="https://github.com/Gwan-Son/DailyMotive/assets/38202152/d4093a16-6937-4377-886c-ebbfe0858ba0">

# ✏️ 글씨체 변경
FontManager 클래스를 생성하여 다양한 Font를 사용자가 변경하여 사용할 수 있게끔 하였습니다.
고정된 폰트가 아니라 사용자가 폰트를 선택할 수 있어서 유저 사이드에서 사용하였을 때 자유도를 향상하였습니다.

<img width="224" src="https://github.com/Gwan-Son/DailyMotive/assets/38202152/def01501-9482-4427-91ec-eca5be0b7151">

```
//FontManager.swift
class FontManager {
    static func currentFont() -> Fonts {
        if let storedFont = (UserDefaults.standard.value(forKey: selectedFontKey) as AnyObject).integerValue {
            return Fonts(rawValue: storedFont)!
        } else { // 처음 폰트
            return .gwonAll
        }
    }
    
    static func applyFont(font: Fonts) {
        UserDefaults.standard.setValue(font.rawValue, forKey: selectedFontKey)
        UserDefaults.standard.synchronize()
    }
}
```

# 📁 파일 구조
```
.
├── DailyMotive
│   ├── Assets.xcassets
│   │   ├── AccentColor.colorset
│   │   │   └── Contents.json
│   │   ├── AppIcon.appiconset
│   │   │   ├── 100.png
│   │   │   ├── 1024.png
│   │   │   ├── 114.png
│   │   │   ├── 120.png
│   │   │   ├── 128.png
│   │   │   ├── 144.png
│   │   │   ├── 152.png
│   │   │   ├── 16.png
│   │   │   ├── 167.png
│   │   │   ├── 172.png
│   │   │   ├── 180.png
│   │   │   ├── 196.png
│   │   │   ├── 20.png
│   │   │   ├── 216.png
│   │   │   ├── 256.png
│   │   │   ├── 29.png
│   │   │   ├── 32.png
│   │   │   ├── 40.png
│   │   │   ├── 48.png
│   │   │   ├── 50.png
│   │   │   ├── 512.png
│   │   │   ├── 55.png
│   │   │   ├── 57.png
│   │   │   ├── 58.png
│   │   │   ├── 60.png
│   │   │   ├── 64.png
│   │   │   ├── 66.png
│   │   │   ├── 72.png
│   │   │   ├── 76.png
│   │   │   ├── 80.png
│   │   │   ├── 87.png
│   │   │   ├── 88.png
│   │   │   ├── 92.png
│   │   │   └── Contents.json
│   │   ├── Category
│   │   │   ├── 1.imageset
│   │   │   │   ├── 1_love.jpg
│   │   │   │   └── Contents.json
│   │   │   ├── 10.imageset
│   │   │   │   ├── 10_hope.jpg
│   │   │   │   └── Contents.json
│   │   │   ├── 11.imageset
│   │   │   │   ├── 11_challenge.jpg
│   │   │   │   └── Contents.json
│   │   │   ├── 12.imageset
│   │   │   │   ├── 12_confidence.jpg
│   │   │   │   └── Contents.json
│   │   │   ├── 2.imageset
│   │   │   │   ├── 2_life.jpg
│   │   │   │   └── Contents.json
│   │   │   ├── 3.imageset
│   │   │   │   ├── 3_study.jpg
│   │   │   │   └── Contents.json
│   │   │   ├── 4.imageset
│   │   │   │   ├── 4_success.jpg
│   │   │   │   └── Contents.json
│   │   │   ├── 5.imageset
│   │   │   │   ├── 5_friend.jpg
│   │   │   │   └── Contents.json
│   │   │   ├── 6.imageset
│   │   │   │   ├── 6_readingBooks.jpg
│   │   │   │   └── Contents.json
│   │   │   ├── 7.imageset
│   │   │   │   ├── 7_breakUp.jpg
│   │   │   │   └── Contents.json
│   │   │   ├── 8.imageset
│   │   │   │   ├── 8_time.jpg
│   │   │   │   └── Contents.json
│   │   │   ├── 9.imageset
│   │   │   │   ├── 9_effort.jpg
│   │   │   │   └── Contents.json
│   │   │   └── Contents.json
│   │   ├── Contents.json
│   │   └── logo.imageset
│   │       ├── 256.png
│   │       └── Contents.json
│   ├── CategoryView
│   │   ├── CategoryCell.swift
│   │   └── CategoryView.swift
│   ├── DailyMotiveApp.swift
│   ├── Font
│   │   ├── Diphylleia-Regular.ttf
│   │   ├── EF_Diary.ttf
│   │   ├── OTLaundryGothicR.otf
│   │   ├── YEONGJUSeonbi.otf
│   │   ├── 온글잎 매일옥자체.ttf
│   │   ├── 부크크명조_얇은글씨.ttf
│   │   └── 강원교육모두.otf
│   ├── HomeView
│   │   ├── HomeView.swift
│   │   └── HomeViewModel.swift
│   ├── Info.plist
│   ├── LikesView
│   │   ├── LikesCell.swift
│   │   ├── LikesView.swift
│   │   └── LikesViewModel.swift
│   ├── LoadingView
│   │   ├── LoadingView.swift
│   │   └── SplashView.swift
│   ├── Model
│   │   ├── Category.swift
│   │   ├── QuoteResponse.swift
│   │   ├── Quotes.swift
│   │   └── Tab.swift
│   ├── Network
│   │   ├── NetworkService.swift
│   │   └── Resource.swift
│   ├── Preview Content
│   │   └── Preview Assets.xcassets
│   │       └── Contents.json
│   ├── QuoteDetailView
│   │   └── QuoteDetailView.swift
│   ├── QuoteView
│   │   ├── QuoteCell.swift
│   │   ├── QuoteListView.swift
│   │   └── QuoteViewModel.swift
│   ├── RandomView
│   │   ├── RandomQuoteView.swift
│   │   └── RandomQuoteViewModel.swift
│   ├── Service
│   │   ├── FontManager.swift
│   │   └── LikesQuoteManager.swift
│   ├── SettingView
│   │   ├── FontView.swift
│   │   ├── MailView.swift
│   │   ├── NoticeView.swift
│   │   ├── SettingView.swift
│   │   └── SettingViewModel.swift
│   └── Utils
│       ├── AppVersion.swift
│       └── Publisher+Utils.swift
├── DailyMotive.xcodeproj
│   ├── project.pbxproj
│   ├── project.xcworkspace
│   │   ├── contents.xcworkspacedata
│   │   ├── xcshareddata
│   │   │   ├── IDEWorkspaceChecks.plist
│   │   │   └── swiftpm
│   │   │       └── configuration
│   │   └── xcuserdata
│   │       └── simgwanhyeok.xcuserdatad
│   │           └── UserInterfaceState.xcuserstate
│   └── xcuserdata
│       └── simgwanhyeok.xcuserdatad
│           └── xcschemes
│               └── xcschememanagement.plist
├── DailyMotiveTests
│   └── DailyMotiveTests.swift
├── DailyMotiveUITests
│   ├── DailyMotiveUITests.swift
│   └── DailyMotiveUITestsLaunchTests.swift
├── README.md
└── quotes.json

46 directories, 113 files
```
