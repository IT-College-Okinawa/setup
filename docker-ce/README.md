# Ubuntu 24.04 に Docker CE (Docker Engine) をインストールする手順

**rootless モードでのインストール手順です。**

1. 既に古いバージョンがインストールされていると競合するので、次のコマンドでアンインストールします。

    ```bash
    sudo apt remove --auto-remove --purge docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc
    ```

2. Docker を apt コマンドでインストールできるよう、リポジトリ情報を追加します。

    ```bash
    sudo apt update
    sudo apt install ca-certificates curl
    sudo install -m 0755 -d /etc/apt/keyrings
    sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
    sudo chmod a+r /etc/apt/keyrings/docker.asc
    cat << EOF | sudo tee /etc/apt/sources.list.d/docker.sources
    Types: deb
    URIs: https://download.docker.com/linux/ubuntu
    Suites: noble
    Components: stable
    Signed-By: /etc/apt/keyrings/docker.asc
    EOF
    sudo apt update
    ```

3. Docker 関連のパッケージをインストールします。
    ```bash
    sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin docker-ce-rootless-extras uidmap slirp4netns
    sudo apt install dbus-user-session
    sudo apt install systemd-container
    dockerd-rootless-setuptool.sh install
    ```

4. システム設定を変更します。
   ```bash
   sudo mkdir -p /etc/systemd/system/user@.service.d
   cat << EOF | sudo tee /etc/systemd/system/user@.service.d/delegate.conf
   [Service]
   Delegate=cpu cpuset io memory pids
   EOF
   sudo systemctl daemon-reload
   systemctl --user restart docker
   ```

5. Docker の起動確認をします。
    ```bash
    docker run --rm hello-world
    ```
