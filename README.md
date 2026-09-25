# SEDEC Documentation

成人向け二次元同人作品制作勉強会「性DEC」の準備・運営・当日運用に関する情報を、DITA XML で体系化するドキュメントプロジェクトです。スタッフ、スピーカー、リスナー向けに DITA マップを分け、同じ情報を必要に応じて再利用しながら HTML5 と PDF を生成します。

## このリポジトリーで作るもの

- スタッフ向け: 準備、運営、当日進行、事後対応の手順
- スピーカー向け: 応募から登壇、当日の案内
- リスナー向け: 参加準備、会場案内、参加ルール
- 共通: イベント概要、用語、連絡方法など、複数ロールで再利用する情報
- 成果物: 役割別の HTML5 および PDF

現在は、各ロールの最小マップと概要トピックを用意した初期段階です。実際の運営情報は、`first_announce.md` などの一次資料を確認しながら DITA トピックへ移していきます。

## リポジトリー間の責務

このリポジトリーは、イベント全体のデザインと運用方針の正本です。実装と配信資産は、次の境界で管理します。

| リポジトリー | 担当 |
| --- | --- |
| `sedec-server` | VPS で動く公開 Web、参加・受講管理、映像配信基盤、OBS ブラウザソース、表示用 API |
| `sedec-live` | 配信端末で使う OBS 設定、配信・録画用メディア、ローカル代替画面、3D アセット |
| `sedec-d11n` | デザイン仕様、配信運用、障害時の切り替え手順 |

OBS は `sedec-server` が公開する安定した URL を参照します。VPS またはネットワークの障害時は、`sedec-live` に含めるローカル代替画面へ切り替えます。詳細はスタッフガイドの「VPS配信とローカル配信資産の責務」に記録します。

## リポジトリー構成

```text
.
├── dita/
│   ├── maps/                # 役割別 DITA マップ
│   ├── topics/
│   │   ├── common/          # 複数ロールで共有するトピック
│   │   ├── staff/
│   │   ├── speaker/
│   │   └── listener/
│   └── resources/img/       # 画像
├── build/                   # 生成物（Git 管理外）
├── style/                   # 執筆・ビジュアル規約
├── tools/                   # 環境確認と DITA-OT ラッパー
├── AGENTS.md                # Codex 向け作業ルール
├── Makefile                 # 日常的に使うコマンド
└── README.md
```

## 必要要件

- macOS または Linux
- Java 17 以降
- DITA Open Toolkit 4.4 系
- GNU Make

macOS + Homebrew の場合は、次のコマンドで導入できます。

```sh
brew install openjdk dita-ot
```

`tools/dita.sh` は、通常の `PATH` に加えて Homebrew の OpenJDK と DITA-OT も自動検出します。そのため、`JAVA_HOME` をシステム全体に設定しなくてもこのリポジトリーをビルドできます。

Python や Node.js の依存関係は、現時点ではありません。

## セットアップと確認

リポジトリーを取得したら、まず環境診断と DITA 検証を実行します。

```sh
make doctor
make validate
```

`make doctor` が DITA-OT のバージョンを表示し、`make validate` がすべての役割別マップを検証できれば準備完了です。

## ビルド

```sh
make html       # 全ロールの HTML5
make pdf        # 全ロールの PDF
make all        # 検証後、HTML5 と PDF の両方
make clean      # 生成物を削除
```

特定のマップだけを直接変換する場合:

```sh
./tools/dita.sh -i dita/maps/staff.ditamap -f html5 -o build/html/staff --outer.control=quiet
./tools/dita.sh -i dita/maps/staff.ditamap -f pdf2 -o build/pdf/staff --outer.control=quiet
```

生成物は `build/html/<role>/` と `build/pdf/<role>/` に出力されます。

## 編集・執筆ガイド

- 1 トピックには、原則として 1 つの概念または 1 つの手順を書く。
- ファイル名と DITA の `id` は、小文字の英語とスネークケースを使う。
- 複数ロールで使う情報は `dita/topics/common/` に置き、マップから参照する。
- ロール固有の情報は、対応する `staff/`、`speaker/`、`listener/` に置く。
- 画像は `dita/resources/img/` に置き、意味のある代替テキストを付ける。
- 文体と表記は [`style/writing-guide.md`](style/writing-guide.md) に従う。
- XML を変更したら、コミット前に `make validate` を実行する。

## 情報アーキテクチャ

各ロールのマップは、情報が増えた段階で次の順序に揃えます。

1. 概要
2. 開催前の準備
3. 当日の行動・運用
4. 終了後の対応
5. FAQ・問い合わせ

共通トピックはマップから直接参照し、同じ説明をコピーしません。短い定型文や値を複数箇所で共有する必要が出た場合に、conref または keyref の導入を検討します。

## 品質保証

現在の最低限の品質ゲートは次のとおりです。

- DITA-OT による全マップの構造検証: `make validate`
- HTML5/PDF の変換成功: `make html` / `make pdf`
- 内容レビュー: 技術的正確性、対象ロールへの適合、文章ガイドへの準拠

リンクチェック、文章 lint、CI、自動リリースは未整備です。コンテンツと公開先が固まり次第追加します。

## 当面の進め方

1. `first_announce.md` を一次資料として、確定事項と未確定事項を分ける。
2. スタッフ、スピーカー、リスナーそれぞれに必要なトピック一覧を作る。
3. 共通トピックから執筆し、各マップへ組み込む。
4. HTML5 と PDF を目視確認し、スタイルを調整する。
5. CI と公開・リリース手順を決める。

## ライセンスと連絡先

ライセンス、メンテナー表記、正式な問い合わせ先は未決定です。公開・外部コントリビューション受け入れ前に決定してください。
