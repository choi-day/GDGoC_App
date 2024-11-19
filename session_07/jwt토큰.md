# 🎰 JWT  
## 1. JWT란 ?

> 클라이언트와 서버 간에 정보를 안전하게 교환하기 위한 **토큰 기반 인증 방식**
> 
- JSON Web Token의 약자
- Header, Payload, Signature로 이루어져있다.
- Base64로 인코딩 되어있다. ( Binary to Text)
- 클라이언트가 서버에 요청할 때, 토큰을 함께 보내면 **추가 인증 절차 없이 사용자를 확인**할 수 있다.

**Header**

- 토큰의 종류와 암호화 알고리즘 같은 토큰에 대한 정보가 들어있다.

**Payload** 

- 발행일, 만료일, 사용자 ID 등 사용자 검증에 필요한 정보가 들어있다.

**Signature**

- Base64 인코딩된 Header와 합친 뒤, 비밀 키를 사용해 서명한 값
- 이 값을 기반으로 토큰이 발급된 뒤 조작되었는지 확인할 수 있다.

```json
eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVC // Header
J9.eyJzdWIiOiIxMjM0NTY3ODkwIiwib  // Payload
mFtZSI6IkNvZGUgRmFjdG9yeSIsImlh
dCI6MTUxNjIzOTAyMiwibGV2ZWwiOiJ
hZG1pbiJ9.3P9bvTbIAvnktNFmQUYM // Signature
UzsCOq3UiS2wQ423hIcbHjY

// .을 기준으로 나뉜다. 
```

## 2. JWT 예제

아래 사이트에서 JWT를 인코딩해볼 수 있다. 

[JWT.IO](https://jwt.io/)

```json
eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkNvZGUgRmFjdG9yeSIsImlhdCI6MTUxNjIzOTAyMiwibGV2ZWwiOiJhZG1pbiJ9.3P9bvTbIAvnktNFmQUYMUzsCOq3UiS2wQ423hIcbHjY
```

## 3. JWT to JSON
![](https://velog.velcdn.com/images/hyeminililo/post/71dd3771-c8fc-47a1-a342-77f770fc721c/image.png)


- Secret 값을 통해 Token이 조작 됐는지 알 수 있다.

### **4. JWT 사용 사례 (클라이언트 관점)**

1. **웹(Web)에서의 사용 사례**
    - **인증(Authentication)**:
        - 사용자가 로그인 시 서버에서 JWT(Access Token)를 발급받고, 클라이언트는 이 토큰을 Local Storage 또는 쿠키에 저장합니다.
        - 이후 API 요청 시 `Authorization` 헤더에 JWT를 포함하여 서버에 인증 요청을 보냅니다.
        - 예: 쇼핑몰에서 로그인한 사용자의 장바구니 데이터를 불러오기.
    - **권한 관리(Role-Based Authorization)**:
        - Payload에 사용자 역할(Role)을 포함하여 사용자가 특정 페이지나 기능에 접근할 수 있는지 판단.
        - 예: 관리자 페이지는 관리자 계정(Role=admin)만 접근 가능하도록 설정.
    - **로그아웃 및 토큰 무효화**:
        - 클라이언트가 로그아웃 버튼을 누르면 저장된 JWT를 삭제하여 사용자가 더 이상 인증되지 않도록 처리.
2. **애플리케이션(App)에서의 사용 사례**
    - **오프라인 모드 지원**:
        - JWT는 발급된 뒤 서버 상태와 무관하게 작동하기 때문에, 네트워크 연결이 없어도 애플리케이션에서 기본적인 인증 기능을 사용할 수 있음.
        - 예: 사용자가 이전에 인증받은 JWT를 사용해 제한된 기능(예: 저장된 데이터 확인)을 사용할 수 있음.
    - **푸시 알림 인증**:
        - 모바일 앱이 푸시 알림 서버와 통신할 때 JWT를 사용해 인증.
        - 예: 사용자별 알림 설정을 저장하거나 전송 시 사용.
    - **데이터 동기화**:
        - 앱이 서버와 동기화 작업(예: 파일 업로드, 채팅 메시지)을 할 때 JWT를 활용하여 사용자를 인증.

---

### **5. JWT 보안 주의사항 (클라이언트 관점)**

1. **웹(Web)에서의 보안 주의사항**
    - **HTTPS 필수 사용**:
        - JWT는 기본적으로 암호화되지 않으므로, HTTPS를 통해 전송해야 데이터 탈취를 방지할 수 있음.
        - 예: `http://example.com` 대신 `https://example.com` 사용.
    - **Local Storage 대신 쿠키 사용 고려**:
        - Local Storage에 저장된 JWT는 XSS(Cross-Site Scripting) 공격에 취약할 수 있음.
        - 쿠키에 `HttpOnly`와 `Secure` 플래그를 설정하면, 클라이언트 측 스크립트가 토큰에 접근할 수 없도록 보호 가능.
    - **토큰 만료 시간 설정**:
        - Access Token의 만료 시간을 짧게 설정하여 탈취된 토큰의 유효성을 최소화.
        - 예: "Access Token은 15분 유효, Refresh Token은 7일 유효."
2. **애플리케이션(App)에서의 보안 주의사항**
    - **Secure Storage 사용**:
        - JWT를 앱의 일반적인 스토리지(SharedPreferences, AsyncStorage 등)에 저장하지 않고, OS에서 제공하는 보안 스토리지(Keychain, Keystore 등)에 저장.
        - 예: iOS는 Keychain, Android는 EncryptedSharedPreferences 사용.
    - **네트워크 상태 확인 및 자동 재로그인 처리**:
        - 만료된 Access Token을 감지하여 Refresh Token을 자동으로 사용해 갱신.
        - 예: API 호출 시 응답 상태 코드 `401 Unauthorized`를 감지하면 갱신 프로세스를 트리거.
    - **JWT 서명 검증**:
        - 클라이언트는 토큰의 유효성을 검증하지 않으며, 검증은 항상 서버에서 이루어져야 함.

---

### **6. Refresh Token 활용 방법 (클라이언트 관점)**

1. **웹(Web)에서 Refresh Token 사용**
    - **토큰 갱신 프로세스**:
        - Access Token이 만료되면, 클라이언트는 Refresh Token을 서버로 전송하여 새로운 Access Token을 요청.
        - Refresh Token은 더 긴 유효 기간을 가지며, 브라우저 쿠키에 저장하는 것이 일반적.
    - **보안 처리**:
        - Refresh Token은 반드시 `HttpOnly` 쿠키로 저장하여 클라이언트 스크립트에서 접근하지 못하도록 함.
        - Refresh Token 요청을 정해진 도메인에서만 처리할 수 있도록 서버에서 제한 설정.
            - 예: `https://auth.example.com/token`으로만 Refresh Token 요청 가능.
2. **애플리케이션(App)에서 Refresh Token 사용**
    - **앱 내 자동 갱신**:
        - 앱은 만료된 Access Token을 감지하면, Refresh Token을 사용해 새로운 Access Token을 자동으로 요청.
        - 사용자는 이 과정을 인지하지 않고 앱을 계속 사용할 수 있음.
    - **갱신 주기 관리**:
        - Access Token의 만료 시간과 Refresh Token의 만료 시간을 서버에서 설정하고, 앱이 이를 기준으로 갱신 주기를 관리.
        - 예: Access Token은 10분, Refresh Token은 30일.
    - **갱신 실패 처리**:
        - Refresh Token이 만료되었거나 유효하지 않으면 앱에서 사용자에게 재로그인을 요청.