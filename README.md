# C-memo

## オリジナルプロダクトのURL
[C-memo](https://c-memo.com/)
## 画面キャプチャ
### ホーム（サインイン前）
![home-before-signin 2023-09-30 232414](https://github.com/Kinchela/c-memo/assets/125888194/38260428-f17c-45ad-827c-415fae87751b)

### サインイン
![signin 2023-09-30 232721](https://github.com/Kinchela/c-memo/assets/125888194/55eccd3e-3374-48a8-951e-f80c65cfc124)

### サインアップ
![signup 2023-09-30 232614](https://github.com/Kinchela/c-memo/assets/125888194/6955103d-a948-4342-ac5b-dcc69eaf7e32)

### ホーム＋日記作成・表示（サインイン後）
![home-after-signin 2023-09-30 232836](https://github.com/Kinchela/c-memo/assets/125888194/2abcd825-9ff8-45cc-b595-f47292665d59)

### 測定記録（身長・体重記録を表示）
![measurement-input-form 2023-09-30 233023](https://github.com/Kinchela/c-memo/assets/125888194/186235d8-790a-4355-8e12-908e3f53775a)
![measurement-record 2023-09-30 233154](https://github.com/Kinchela/c-memo/assets/125888194/68e1a46d-0529-416d-8aac-a28976bdb8e9)

### 欲しい物リスト（リスト一覧）
![wishlists 2023-09-30 233402](https://github.com/Kinchela/c-memo/assets/125888194/a80f9ea9-9cca-409e-a109-fce3f843716c)

### 欲しい物リスト（リスト作成）
![wishlists-input 2023-10-01 231748](https://github.com/Kinchela/c-memo/assets/125888194/da278580-1890-4171-a5d0-8d06d7bafa5f)

### Settings（パスワード変更・アカウント削除）
![settings 2023-09-30 233517](https://github.com/Kinchela/c-memo/assets/125888194/b3947e8f-b72a-43ed-b4e7-6c4ffec048aa)
## 概要
子供の成長記録サービス『C-memo』<br>
子供の成長記録を日記・グラフで作成できるサービス。<br>
このサービスにより、以下の課題を解決する：
* 手書きでの成長記録作成にかかる時間
* 思い出・記録を探す手間
* 必要・欲しい物の管理

その他に、共有機能が無い為家族以外に見られたくない心情等を安心して記録に残せる。<br>
また、保育園・小学校等で提出を求められる事が予想される名前の由来や幼少時代の写真・様子等を記録に残していれば、簡単に探し出せる。
## 使用技術一覧
### フロントエンド
* **Language**: HTML/CSS/JavaScript
### バックエンド
* **Language**: Ruby(3.2.2)
* **Framework**: Ruby on Rails(7.0.4.3)
* **Database**: MySQL(8.0.33)
### インフラ
* **Cloud Services**: AWS(VPC, IGW, RDS, Route53, S3, EC2)
* **Server**: Puma
### Linter/Formatter
* RuboCop
### テスト
* Rspec + FactoryBot
### バージョン管理
* Git/GitHub
### 開発環境
* **Editor**: Visual Studio Code
* **Containerization**: Docker
## ER図
![ER図 2023-10-01 230003](https://github.com/Kinchela/c-memo/assets/125888194/8bcabc69-9fdd-45c2-8aaf-ac082586c728)
## インフラ構成図
![インフラ構成図 2023-10-01 235005](https://github.com/Kinchela/c-memo/assets/125888194/56d41d04-39a7-4929-aa3b-830e1c5e804b)
## 機能一覧
* ユーザー新規登録
* サインイン
* サインアウト
* パスワード変更
* アカウント削除
* 日記投稿、一覧、削除
* 測定記録登録、グラフ表示
* リスト作成、一覧、削除
