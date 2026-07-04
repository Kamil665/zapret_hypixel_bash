# Hypixel Bypass Tool

Инструмент для автоматического подбора рабочего прокси-сервера и запуска Minecraft с обходом ограничений Hypixel.

## ⚠️ Важное предупреждение

**Данный инструмент создан исключительно в образовательных целях!**

Использование прокси-серверов для обхода античита или региональных ограничений может нарушать:
- Пользовательское соглашение Hypixel
- Правила использования Minecraft
- Законы о кибербезопасности в вашей стране

**Автор не несет ответственности за любые последствия использования данного ПО.**

## 🚀 Возможности

- Автоматическая проверка списка прокси (SOCKS5/HTTP)
- Поддержка прокси с авторизацией (логин:пароль)
- Запуск Minecraft через `proxychains`
- Простота настройки и использования

## 📋 Требования

- **OS**: Linux / macOS / WSL2 (Windows)
- **Зависимости**:
  - `curl` – для проверки прокси
  - `proxychains` – для туннелирования трафика
  - `bash` 4.0+
- **Minecraft Launcher** (официальный, MultiMC, Lunar Client и др.)

## 🔧 Установка

```bash
# 1. Клонируйте репозиторий
git clone https://github.com/yourusername/hypixel-bypass.git
cd hypixel-bypass

# 2. Установите зависимости
sudo apt-get install proxychains curl   # Debian/Ubuntu
brew install proxychains-ng curl        # macOS

# 3. Настройте proxychains
sudo nano /etc/proxychains.conf
# Установите:
# dynamic_chain
# [ProxyList] - оставьте пустым

# 4. Сделайте скрипт исполняемым
chmod +x hypixel_bypass.sh
