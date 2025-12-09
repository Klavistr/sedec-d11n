# SEDEC Documentation

成人向け二次元同人作品制作勉強会「性DEC」の準備・運営・当日運用に関する情報を DITA XML で体系化するドキュメントプロジェクト。スタッフ／スピーカー／リスナー向けに DITA マップを分割し、HTML5 と PDF を生成する。

## 目次
- プロジェクト概要
- リポジトリ構成
- 必要要件
- セットアップ
- ビルドと出力
- 編集・執筆ガイド
- スタイルガイド（ビジュアル／文章）
- 情報アーキテクチャ
- 品質保証
- リリース手順
- コントリビューション
- FAQ
- ライセンス
- 連絡先

## プロジェクト概要
- 目的: 性DEC の準備・運営・当日運用に必要な知識と手順を DITA で統一し、役割別に再利用可能な形で提供する。
- 対象: スタッフ／スピーカー／リスナー。
- 成果物: 役割別 DITA マップ、HTML5 出力、PDF 出力、ビジュアル／文章スタイルガイド。

## リポジトリ構成（例）
```
.
├─ dita/                  # DITA トピック群
│  ├─ topics/             # 個別トピック
│  ├─ maps/               # 役割別 DITA マップ（staff, speaker, listener）
│  └─ resources/          # 画像・スニペット等
├─ build/                 # ビルド成果物 (HTML5, PDF) [TODO: パス確定]
├─ tools/                 # ビルドスクリプト・CI 設定
├─ style/                 # ビジュアル/文章スタイルガイド
└─ README.md
```

## 必要要件
- DITA-OT: [TODO: 推奨バージョン]
- Java: [TODO: バージョン]（DITA-OT 用）
- Python/Node など補助ツール: [TODO]
- OS: [TODO: サポート範囲]

## セットアップ
1. リポジトリ取得: `git clone [TODO: repo URL]`
2. DITA-OT インストール: [TODO: 入手元と展開手順]
3. 環境変数設定: `DITA_OT_DIR=[TODO]` を PATH に追加。
4. 依存ツール導入: `npm install` / `pip install -r requirements.txt` など [TODO]。

## ビルドと出力
- HTML5 出力（例）: `./tools/build-html.sh [TODO: ditamap]`
- PDF 出力（例）: `./tools/build-pdf.sh [TODO: ditamap]`
- 役割別マップ:
  - スタッフ: `dita/maps/staff.ditamap`
  - スピーカー: `dita/maps/speaker.ditamap`
  - リスナー: `dita/maps/listener.ditamap`
- 出力先: `build/html/`, `build/pdf/` [TODO: 確定]

## 編集・執筆ガイド
- トピック粒度: 1 トピック = 1 手順 or 1 コンセプト。
- ファイル命名: 英語ベースのスネークケースを推奨 [TODO]。
- 画像配置: `dita/resources/img/` [TODO]。
- 用語集: `dita/topics/glossary.dita` を基準に表記統一 [TODO: 運用方針]。
- 再利用: conref / keyref で共通部品を管理 [TODO: ポリシー]。

## スタイルガイド（ビジュアル／文章）
- ビジュアル: 色／タイポグラフィ／図版トーンの基準 [TODO: 記載位置]。
- 文章: 敬体/常体、表記ゆれ、禁止表現、数字表記など [TODO: 記載位置]。
- リンク・参照: クロスリファレンス・外部リンクの扱い [TODO]。

## 情報アーキテクチャ
- ロール別マップ構成: 準備 → 運営 → 当日 → 事後対応 [TODO: 詳細]。
- 共通トピックの配置と再利用方針: [TODO]。
- 版管理: バージョン付けとタグ命名規則 [TODO]。

## 品質保証
- バリデーション: `dita --input ... --format ...` 前に lint 実行 [TODO: ツール]。
- リンクチェック: [TODO: コマンド]。
- スタイルチェック: [TODO: 自動化方法]。
- CI: GitHub Actions 等で HTML/PDF を自動ビルド [TODO: 設定ファイル]。

## リリース手順
1. ブランチ戦略: main/release/hotfix [TODO]。
2. バージョン付け: セマンティックバージョニング or 日付版 [TODO]。
3. 出力物配布: リリースノート + HTML/PDF アーティファクト [TODO]。
4. チェックリスト: バリデーション済み、主要トピック更新確認 [TODO]。

## コントリビューション
- Issue/Pull Request の流れ: [TODO]。
- レビュー基準: 技術的正確性、スタイルガイド準拠、DITA 構造妥当性 [TODO]。
- コーディング／ライティング規約: [TODO]。

## FAQ
- DITA-OT が動かない: [TODO: トラブルシュート]。
- PDF レイアウト崩れ: [TODO: 調整手順]。
- 用語統一: [TODO: ルール参照先]。

## ライセンス
- [TODO: ライセンス種別]

## 連絡先
- メンテナ: [TODO: 名前/メール/ハンドル]
- コミュニケーション: [TODO: Slack/Discord/メール]
