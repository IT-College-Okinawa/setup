# 環境構築用スクリプト

## 日本語環境のインストールスクリプト
1. 次のコマンドを実行
```bash
bash ./language-setup.sh
```

## Google Chrome のインストール
1. 次のコマンドを実行
```bash
bash ./install-google-chrome.sh
```

## 仮想環境のインストールスクリプト
1. 次のコマンドを実行
 ```bash
bash ./install-libvirt.sh
```
2. パスワードを聞かれた入力
3. 一度PCを再起動
4. 次のコマンドを実行
```bash
bash ./install-vagrant.sh
```
5. 次のコマンドを実行
```bash
bash ./modify-vagrant-templates.sh
```