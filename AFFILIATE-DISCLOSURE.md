## 제휴(어필리에이트) 공지 가이드

목적: 방문자가 제휴 링크 존재를 인지할 수 있도록 간결하게 안내하는 방법과 현재 레포에 적용한 설정을 정리합니다.

설치된 항목(프로젝트 내):
- [layouts/partials/affiliate_notice.html](layouts/partials/affiliate_notice.html)
- [layouts/shortcodes/affiliate.html](layouts/shortcodes/affiliate.html)
- [layouts/_default/baseof.html](layouts/_default/baseof.html) (본문 하단에 partial 포함)
- [archetypes/default.md](archetypes/default.md) (새 글 기본값: `affiliate = false`)
- [static/css/affiliate.css](static/css/affiliate.css)

동작 요약
- 공지는 오직 개별 포스트의 front matter에 `affiliate = true`가 있을 때만 표시됩니다.
- 수동으로 본문에 삽입하려면 단축콜을 사용하세요: `{{< affiliate >}}`.

권장 문구 (현재 적용된 문구)

> 본 글에는 제휴 링크가 포함되어 있으며, 해당 링크를 통해 구매가 이루어질 경우 일정 수수료를 제공받을 수 있습니다.

사용법

1) 글 하단에 자동 표시(권장): 해당 포스트의 front matter에 `affiliate = true`를 추가하세요. 예:

```toml
title = "여기에 제목"
date = 2026-01-04
affiliate = true
```

2) 본문에 수동 삽입: 필요한 위치에 아래를 넣습니다.

```text
{{< affiliate >}}
```

스타일/위치 변경
- 공지 스타일은 [static/css/affiliate.css](static/css/affiliate.css)에서 관리됩니다. 원하시면 색상·간격 조정해 드립니다.
- 현재 위치는 본문 바로 아래(하단)로, [layouts/_default/baseof.html](layouts/_default/baseof.html)에 partial을 포함한 상태입니다. 다른 위치(예: 본문 상단 또는 footer)로 이동하려면 해당 레이아웃 파일의 적절한 블록에 `{{ partial "affiliate_notice.html" . }}`를 옮기면 됩니다.

로컬 미리보기

```bash
cd /Users/ultimate/Workspace/personal/blog/blog-general-hugo-mainroad
hugo server -D
```

변경/문구 수정 원하면 알려주세요. 특정 포스트(content/post/.../index.md)에 예시로 `affiliate = true`를 넣어 보여드릴 수 있습니다.
