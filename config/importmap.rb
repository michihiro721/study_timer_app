# npmパッケージをピン留めするには、./bin/importmap を実行します

# アプリケーションのメインエントリーポイントをピン留め
pin "application"

# app/javascript/packs ディレクトリ内のすべてのファイルをピン留め
pin_all_from "app/javascript/packs", under: "packs"