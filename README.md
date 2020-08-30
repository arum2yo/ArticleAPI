### **주요기능**
- 네트워크 환경에서 Article받아오기
- WKWebView를 사용한 webPage이동
- TableViewController를 이용한 화면 구성 

### **완성화면**
![ezgif com-video-to-gif](https://user-images.githubusercontent.com/67727048/91660989-350ae080-eb14-11ea-882a-17fb45e4d132.gif)

### **활용한 기술**
- Swift, Alamofire, Codable DataParsing
- Kingfisher, WKWebView
- ProgressHUD를 사용한 네트워킹 인디게이터
[- 사용된 API사이트:  NewsAPI  ](http://newsapi.org)

### **스터디노트**
**1. AlamoFire 사용하여 데이터 파싱 및  네트워킹** 

```
AF.request(request).responseData { (result) in
            if result.error != nil {
                print(result.error?.localizedDescription)
            } else {
                if let data = result.data{
                    do{
                        let decoder = JSONDecoder()
                        let jsonNews = try decoder.decode(NewsAPI.self, from: data)
                        print("3:data Json Decoding")
                        
                        DispatchQueue.main.async {
                            self.delegate?.articleModelRetrieved(articles: jsonNews.articles!)
                            print("5: 네트워킹 데이터 종료.")
                        }
                    }catch{
                        print(error)
                        return }
```

**2. WKWebView으로 웹페이지 전환하기** 
1. 스토리보드에 wkwebview 연결하기. (#webview는 단종될 계획임.)
2. 사용될 WebPageViewController에 코드 작성.

       
```
        super.viewDidLoad()
        super.loadView()
        
        webView = WKWebView(frame: self.view.frame)
        webView.uiDelegate = self
        webView.navigationDelegate = self

        self.view = self.webView
        let url = URL(string: self.url!)
        let request = URLRequest(url: url!)
        self.webView.load(request)
```

