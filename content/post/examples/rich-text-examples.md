---
title: "리치 텍스트 예제 — Shortcodes 사용법"
description: "이 글은 프로젝트에 포함된 shortcodes(`affiliate`, `mermaid`, `chart`, `clock24`)과 리치 텍스트 요소 사용 예제를 보여줍니다."
date: 2018-04-17
categories:
  - "Examples"
tags:
  - "rich-text"
  - "shortcodes"
menu:
  main:
    name: Rich Text Examples
    weight: 5
draft: true
---

이 글은 Hugo 테마에 포함된 몇 가지 `shortcode` 사용 예제와 함께, 리치 텍스트(테이블, 코드 블록, 인용 등) 표현을 보여줍니다.

<!--more-->

## 제휴 공지 (affiliate)

간단한 제휴 공지 예제입니다. 테마에 정의된 `affiliate` shortcode를 사용하면 일관된 제휴 안내 문구를 삽입할 수 있습니다.

{{< affiliate >}}

다음은 본문 내에 제휴 링크를 함께 쓸 때의 예시입니다.

- 예시 상품: [샘플 제품 링크](https://example.com)

## Mermaid 다이어그램 예제

아래는 `mermaid` shortcode를 사용한 간단한 흐름도입니다.

{{< mermaid >}}
graph LR
  A[시작] --> B{유용한가요?}
  B -->|예| C[사용하세요]
  B -->|아니요| D[건너뜁니다]
  C --> E[배포]
  D --> E
{{< /mermaid >}}

## 차트 예제 (`chart` shortcode)

`chart` shortcode는 내부에 Chart.js 구성 객체를 직접 넣어 렌더링합니다. 아래는 샘플 바 차트 구성입니다.

{{< chart >}}
{
  type: 'bar',
  data: {
    labels: ['빨강','파랑','초록','노랑'],
    datasets: [{
      label: '샘플 데이터',
      data: [12, 19, 3, 5],
      backgroundColor: ['#ef4444','#3b82f6','#10b981','#f59e0b']
    }]
  },
  options: { responsive: true, plugins: { legend: { display: false } } }
}
{{< /chart >}}

### Chart.js 숏코드 (`chartjs`) 사용법

새로 추가된 `chartjs` 숏코드는 두 가지 방식으로 사용할 수 있습니다:

- **직접 초기화 (현재 형태)**: 숏코드 안에 Chart.js 초기화 코드를 넣어 사용합니다. 기존 `rawhtml` 블록을 대체하는 용도로 적합합니다.

```
{{< chartjs id="monthlyChart" width="700" height="320" >}}
(function() {
  const years = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20];
  const costA = [401,404,408,411,415,418,422,427,431,436,441,446,451,457,463,469,476,483,490,498];
  const costB = [149,153,158,163,168,173,178,183,189,194,200,206,212,219,225,232,239,246,254,261];
  new Chart(document.getElementById('monthlyChart'), {
    type: 'line',
    data: {
      labels: years.map(y => y + '년'),
      datasets: [ /* ... */ ]
    }
  });
})();
{{< /chartjs >}}
```

- **파라미터형 자동 초기화 (발전된 형태)**: `config` 파라미터에 Chart.js 구성(JSON)을 전달하면 숏코드가 자동으로 초기화합니다. JSON은 홑따옴표로 감싸 전달하세요.

```
{{< chartjs id="netWorthChart" width="700" height="380" config='{"type":"line","data":{"labels":["1","2","3"],"datasets":[{"label":"샘플","data":[1,2,3]}]}}' >}}{{< /chartjs >}}
```

이 방식의 장점:

- 게시물에서 반복되는 차트를 간단한 JSON 파라미터로 삽입할 수 있습니다.
- `chartjs` 숏코드는 추가 파라미터를 모두 `data-<name>` 속성으로 캔버스에 전달하므로, 필요 시 사용자 스크립트에서 `dataset`을 통해 접근할 수 있습니다.

참고: JSON을 직접 숏코드 인자로 넣을 때는 작은따옴표로 전체를 감싸고 내부에는 큰따옴표를 사용하세요.

## 24시간 일과표 예제 (`clock24` shortcode)

아래는 `clock24` shortcode 사용 예제입니다. 각 줄은 `시작-종료: 라벨, 색상` 형식을 따릅니다.

{{< clock24 title="샘플 일과표" >}}
06-09: 아침, #f59e0b
09-12: 업무, #3b82f6
12-13: 점심, #10b981
13-18: 업무, #3b82f6
18-22: 개인시간, #8b5cf6
22-06: 수면, #64748b
{{< /clock24 >}}

## 코드 블록, 표, 인용

다음은 코드 블록과 표, 그리고 인용문 예제입니다.

```js
// 간단한 자바스크립트 예제
function greet(name) {
  return `Hello, ${name}!`;
}
console.log(greet('Hugo'));
```

| 항목 | 설명 |
| ---- | ---- |
| Mermaid | 다이어그램 렌더링 |
| Chart | Chart.js 기반 차트 |
| Clock24 | 24시간 도넛형 시각화 |

> 참고: shortcodes는 테마의 `layouts/shortcodes`에 정의되어 있으므로, 필요 시 포맷을 수정하거나 파라미터를 추가해 사용하세요.

## Alert (알림) 예제 — `alert` shortcode

아래는 상황에 맞는 메시지를 보여주는 `alert` shortcode 예제입니다. `type`은 `info`(기본), `success`, `warning`, `danger` 중 하나를 사용하세요. `close="true"`를 주면 닫기 버튼이 표시됩니다.

{{< alert type="info" title="정보" >}}
이것은 정보성 알림입니다. 짧은 참고나 공지에 적절합니다.
{{< /alert >}}

{{< alert type="warning" title="경고" >}}
이 작업은 주의가 필요합니다. 변경 전에 백업을 권장합니다.
{{< /alert >}}

{{< alert type="success" title="성공" >}}
작업이 성공적으로 완료되었습니다.
{{< /alert >}}

{{< alert type="danger" title="오류" close="true" >}}
치명적인 오류가 발생했습니다. 즉시 조치하세요.
{{< /alert >}}

## Cloudinary 이미지 최적화 예제 — `cldimg` shortcode

Cloudinary의 URL 기반 트랜스포밍을 활용해 `srcset`과 `sizes`를 자동 생성하는 `cldimg` shortcode를 추가했습니다. 사용 예 (public id + cloud 이름):

```html
{{< cldimg public_id="samples/landscape.jpg" cloud="your-cloud-name" alt="샘플 이미지" widths="320,640,960" sizes="100vw" caption="샘플 캡션" >}}
```

또는 이미 전체 URL이 있을 때:

```html
{{< cldimg src="https://res.cloudinary.com/your-cloud-name/image/upload/v1670000000/samples/landscape.jpg" >}}
```

주요 옵션:

- `public_id` (또는 `src`): Cloudinary에 업로드된 이미지 식별자 또는 전체 URL
- `cloud`: Cloudinary cloud name (public_id 사용 시 필요)
- `alt`: 대체 텍스트
- `widths`: 콤마 구분 해상도 목록 (기본 `320,640,960,1280`)
- `sizes`: HTML `sizes` 속성값 (기본 `100vw`)
- `placeholderW`: 흐릿한 플레이스홀더 너비(기본 `40`)
- `lazy`: `true`/`false` (기본 `true`)
- `caption`: 캡션 텍스트

동작 방식: shortcode는 `/upload/` 뒤에 `w_<n>,c_scale,f_auto,q_auto/` 같은 변환을 삽입해 각 해상도 URL을 만들고 `srcset`을 구성합니다. 먼저 저해상도 placeholder를 표시하고, 뷰포트 진입 시 IntersectionObserver로 전체 해상도 URL과 `srcset`을 적용해 blur→선명 전환을 수행합니다.
