#!/usr/bin/env bash
set -e
exec > >(tee -a logs/01-setup-env.log) 2>&1

echo ">>> Sistemi güncelliyorum..."
sudo apt-get update -y

echo ">>> pnpm kuruluyor..."
npm install -g pnpm

echo ">>> Proje bağımlılıkları yükleniyor..."
cd ext
pnpm install
cd app
pnpm install

echo ">>> Ortam hazır!"
