# Rich Text 사용 가이드

이 블로그에서는 **Mermaid**와 **Chart.js** shortcode를 사용해 글 안에 다이어그램·차트를 넣을 수 있습니다.

---

## 사용 방법

글 본문에 **Mermaid shortcode**를 아래처럼 작성하면 됩니다.

```
{{< mermaid >}}
(여기에 Mermaid 문법으로 다이어그램 작성)
{{< /mermaid >}}
```

- Mermaid 스크립트는 **해당 글이 `mermaid` shortcode를 사용할 때만** 로드됩니다.
- [Mermaid 공식 문서](https://mermaid.js.org/intro/)에서 전체 문법을 확인할 수 있습니다.

---

## 예시

### 플로우차트 (graph)

```md
{{< mermaid >}}
graph LR
  A[시작] --> B{조건}
  B -->|예| C[결과 1]
  B -->|아니오| D[결과 2]
{{< /mermaid >}}
```

- `graph LR`: 왼쪽→오른쪽 방향 그래프  
- `graph TD`: 위→아래 방향 그래프

### 시퀀스 다이어그램

```md
{{< mermaid >}}
sequenceDiagram
  participant 사용자
  participant 서버
  사용자->>서버: 요청
  서버->>사용자: 응답
{{< /mermaid >}}
```

### 단순 그래프 (개념도)

```md
{{< mermaid >}}
graph TD
  미국거래시간 --> 프리마켓
  미국거래시간 --> 정규장
  미국거래시간 --> 애프터마켓
{{< /mermaid >}}
```

### 기타 지원 다이어그램

- **flowchart** / **graph**: 플로우차트
- **sequenceDiagram**: 시퀀스 다이어그램
- **classDiagram**: 클래스 다이어그램
- **stateDiagram**: 상태 다이어그램
- **erDiagram**: ER 다이어그램
- **pie**: 파이 차트
- **gantt**: 간트 차트

문법은 [Mermaid 문서](https://mermaid.js.org/syntax/flowchart.html)를 참고하세요.

---

# Chart.js (원형 차트, 24시간 시계)

Chart.js를 사용해 **24시간 원형 일과표**(시계형)나 일반 차트를 만들 수 있습니다.

---

## clock24 (24시간 원형 시계)

초등학생 하루 일과표처럼 **24시간을 원형 시계로** 표현합니다.  
0시가 위쪽(12시 방향)에 위치하고, 시계 방향으로 시간이 흐릅니다.

### 사용 방법

```
{{</* clock24 title="차트 제목" */>}}
시작-끝: 라벨, 색상
시작-끝: 라벨, 색상
...
{{</* /clock24 */>}}
```

- **시작-끝**: 시간 범위 (예: `0-6`, `22-24`)
- **라벨**: 해당 시간대의 활동명
- **색상**: HEX 색상 코드 (예: `#22c55e`)
- `#`으로 시작하는 줄은 주석으로 무시됩니다.

### 예시: 미국 주식 거래시간 (한국시간)

```
{{</* clock24 title="미국 주식 거래시간 (한국시간 기준)" */>}}
# 한국시간 기준 미국 주식 거래시간
0-6: 본장, #22c55e
6-8: 애프터마켓, #f97316
8-22: 휴장, #94a3b8
22-23: 프리마켓, #eab308
23-24: 본장, #22c55e
{{</* /clock24 */>}}
```

### 예시: 초등학생 하루 일과

```
{{</* clock24 title="나의 하루 일과" */>}}
0-7: 수면, #4a5568
7-8: 아침식사, #f6ad55
8-14: 학교, #68d391
14-15: 점심/휴식, #f6ad55
15-18: 학원/숙제, #63b3ed
18-19: 저녁식사, #f6ad55
19-21: 자유시간, #fc8181
21-22: 독서, #b794f4
22-24: 수면, #4a5568
{{</* /clock24 */>}}
```

### 색상 추천

| 용도 | 색상 코드 | 예시 |
|------|-----------|------|
| 수면 | `#4a5568` | 회색 |
| 식사 | `#f6ad55` | 주황 |
| 학교/업무 | `#68d391` | 초록 |
| 자유시간 | `#fc8181` | 빨강 |
| 휴식 | `#94a3b8` | 연회색 |
| 주의(프리마켓 등) | `#eab308` | 노랑 |
| 활성(본장 등) | `#22c55e` | 밝은 초록 |

---

## chart (일반 Chart.js)

Chart.js 설정을 직접 JSON으로 작성해서 다양한 차트를 만들 수 있습니다.

### 사용 방법

```
{{</* chart */>}}
{
  type: 'bar',
  data: {
    labels: ['1월', '2월', '3월'],
    datasets: [{
      label: '매출',
      data: [100, 200, 150],
      backgroundColor: ['#ef4444', '#22c55e', '#3b82f6']
    }]
  }
}
{{</* /chart */>}}
```

- [Chart.js 공식 문서](https://www.chartjs.org/docs/latest/)에서 전체 옵션을 확인할 수 있습니다.
- 지원 차트 타입: `bar`, `line`, `pie`, `doughnut`, `radar`, `polarArea` 등

---

# 기술 참고

## Mermaid

- Shortcode: `layouts/shortcodes/mermaid.html`
- 스크립트 로드: `layouts/partials/mermaid.html` (페이지에 shortcode가 있을 때만 로드)
- Mermaid CDN: jsDelivr (v10), `startOnLoad: true`로 자동 렌더링

## Chart.js

- Shortcode: `layouts/shortcodes/chart.html`, `layouts/shortcodes/clock24.html`
- 스크립트 로드: `layouts/partials/chartjs.html` (페이지에 shortcode가 있을 때만 로드)
- Chart.js CDN: jsDelivr (v4)
