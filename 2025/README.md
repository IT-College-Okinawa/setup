# Ubuntu 24.04 インストール後の環境構築手順

## 準備

1. まずは `ctrl` + `alt` + `T` でターミナルを開きます。
2. 次のコマンドを実行します。

```bash
git clone https://github.com/IT-College-Okinawa/setup.git ~/setup
cd ~/setup/2025
```

## 日本語環境のインストール

3. 次のコマンドを実行(パスワードを聞かれたら入力してください)

```bash
bash ./language-setup.sh
```

4. 自動的に再起動します。

## Google Chrome のインストール

6. `ctrl` + `alt` + `T` でターミナルを開きます。
7. 次のコマンドを実行(パスワードを聞かれたら入力してください)

```bash
cd ~/setup/2025
bash ./install-google-chrome.sh
```

## 仮想環境のインストール

8. 次のコマンドを実行(パスワードを聞かれたら入力してください)

```bash
bash ./install-libvirt.sh
```

9. 自動的に再起動しますので、起動後に再び `ctrl` + `alt` + `T` でターミナルを開きます。
10. 次のコマンドを実行

```bash
cd ~/setup/2025
bash ./install-vagrant.sh
```
