### Chapter 4: 데이터 응답 및 클라이언트 처리 (Flutter)

1. **서버의 응답이 클라이언트로 도달하는 과정**
    - **네트워크를 통한 데이터 전송**: 서버로부터 데이터를 받아오는 과정에서는 `http` 또는 `dio`와 같은 패키지를 사용하여 비동기 방식으로 요청을 처리한다.
    - **클라이언트에서의 응답 수신**: Flutter에서는 비동기 프로그래밍을 통해 네트워크 응답을 기다리고 처리한다.
        - `Future`와 `async-await`를 이용해 서버 응답을 기다린다.
        - 응답은 일반적으로 JSON 형식으로 반환되며, 이를 Flutter 객체로 변환하여 사용한다.

2. **응답 데이터 처리**
    - **비동기 처리**:
        - Flutter에서는 비동기 처리를 위해 `Future`, `async`, `await` 키워드를 사용한다.
        - 서버로부터 데이터를 받을 때, 예를 들어 API 요청 후 데이터 수신 시 `await` 키워드를 사용하여 결과가 반환될 때까지 기다린다.
    - **수신 데이터를 객체로 변환**:
        - 서버에서 받은 JSON 데이터를 처리하기 위해 Dart 객체로 변환하는 작업이 필요하다.
        - 예를 들어, `jsonDecode` 함수를 사용하거나 데이터 모델 클래스에 `fromJson` 메서드를 정의하여 JSON 데이터를 객체로 변환한다.
        - Flutter에서는 `json_serializable` 같은 패키지를 사용해 자동으로 JSON을 객체로 변환할 수 있다.

---

### Chapter 6: JSON 데이터 교환 (Flutter)

1. **JSON의 기본 개념**
    - **JSON 구조와 사용 이유**:
        - JSON은 키-값 쌍으로 이루어진 가볍고 읽기 쉬운 데이터 구조로, 서버와 클라이언트 간 데이터 교환에 자주 사용된다.
        - REST API에서 응답을 보낼 때 주로 사용되는 표준 포맷이다.
    - **JSON과 XML의 비교**:
        - JSON은 XML보다 간결하고 가독성이 좋으며, 데이터 크기도 작아 네트워크 효율성이 좋다. Flutter 앱에서는 주로 JSON이 사용된다.

2. **JSON 데이터 처리**
    - **JSON 데이터를 객체로 변환 (`fromJson`)**:
        - 서버에서 JSON 데이터를 받은 후, 이를 앱에서 다루기 위해 Dart 객체로 변환한다.
        - 예를 들어, `jsonDecode()` 함수를 사용하여 JSON을 해석하고, 클래스의 `fromJson()` 메서드를 호출해 데이터 모델로 변환한다.
        - Flutter에서는 `json_serializable`을 사용하면 코드 생성으로 모델 클래스를 쉽게 생성할 수 있어 객체 변환이 편리하다.
    - **객체를 JSON 데이터로 변환 (`toJson`)**:
        - 데이터를 서버에 전송하거나 로컬에 저장하기 위해 Dart 객체를 다시 JSON 형식으로 변환해야 할 때 `toJson()` 메서드를 사용한다.
        - 예를 들어, 사용자 입력 데이터를 서버로 전송할 때 객체를 JSON으로 변환하여 전송한다.

3. **JSON 처리 라이브러리**
    - **Flutter에서 사용하는 JSON 처리 라이브러리**:
        - `dart:convert` 패키지를 사용하여 `jsonDecode()`와 `jsonEncode()` 메서드로 JSON 데이터를 변환할 수 있다.
        - `json_serializable` 패키지를 사용하면, JSON 데이터를 모델 클래스로 쉽게 변환할 수 있도록 자동화된 코드 생성을 지원한다.
        - 네트워크 라이브러리인 `Dio`를 사용하여 REST API와 통신할 때도 JSON 데이터를 쉽게 처리할 수 있다.

---

### Chapter 7: 구현 예제 (Flutter와 웹 비교)

1. **앱과 웹에서의 통합 예제**
    - 동일한 API를 사용하는 Flutter 앱과 웹 페이지를 구현하는 경우, 사용자의 입력 데이터를 서버로 전송하고 응답을 화면에 표시하는 방식이 비슷하다.
    - Flutter에서는 `Dio`나 `http` 라이브러리를 사용해 API 요청을 보내며, JSON 응답을 받아 상태 관리를 통해 UI를 업데이트한다.

2. **코드 비교**
    - **앱 (Flutter)**: `Dio` 또는 `http`를 사용하여 네트워크 요청을 보내고, `FutureBuilder`나 `Provider`와 같은 상태 관리 도구를 사용해 UI를 업데이트한다.
    - **웹**: `Fetch API`를 사용해 요청을 보내고, 결과를 DOM 요소를 통해 표시한다.

3. **실제 시나리오**
    - **제품 리스트 가져오기**: Flutter에서는 제품 리스트를 서버에서 받아와 `ListView.builder()`를 사용해 화면에 표시한다.
    - **사용자 로그인 및 JWT 인증 적용**: 사용자가 로그인하면 서버로부터 JWT 토큰을 받아 `SharedPreferences`에 저장하고, 이후 모든 요청에 이 토큰을 포함하여 인증된 요청을 보낼 수 있다.
