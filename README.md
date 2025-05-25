# Fifty-Fifty

- [Storybook](https://main--6831d0afff22901b3efe12e2.chromatic.com/)

## 📦 開発環境構成

### 🛠 使用技術スタック

- **フレームワーク**: React-router v7(Remix)
- **UIライブラリ**: React
- **言語**: TypeScript
- **ビルドツール**: Vite
- **テストツール**: Vitest
- **コンポーネントライブラリ**: shadcn/ui
- **スタイリング**: Tailwind CSS
- **リンター / フォーマッター**: Biome
- **パッケージマネージャー**: pnpm
- **インフラ / 実行環境**: Google Cloud Run

### 📁 ディレクトリ構成

```
fifty-fifty
├── app # ページ、レイアウト、ルート定義など「画面構成」に関するコード
├── public # ビルド時に成果物にそのままコピーされる静的ファイル置き場
└── src # アプリケーション全体の機能ロジックやUIパーツなど「汎用機能・実装ロジック」に関するコード
    ├── components # アプリケーション全体で使用される共有コンポーネント
    ├── features # # 機能ベースのモジュール
    ├── lib # アプリケーション用に事前に設定された異なるライブラリを再エクスポートする
    └── types # アプリケーション全体で使用される基本型
```

## 開発方法

### インストール

```bash
pnpm install
```

### 開発サーバー起動

```bash
pnpm run dev
# Application will be available at `http://localhost:5173`.
```

### 本番ビルド

```bash
pnpm run build
```

### デプロイ

```bash
docker build -t fifty-fifty .

# Run the container
docker run -p 3000:3000 fifty-fifty
```