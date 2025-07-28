#!/usr/bin/env bash
set -e
exec > >(tee -a logs/01-setup-env.log) 2>&1

echo ">>> Sistemi güncelliyorum..."
sudo apt-get update -y

echo ">>> pnpm kuruluyor..."
npm install -g pnpm

echo ">>> Proje bağımlılıkları yükleniyor..."
if [ -d ext ]; then cd ext; pnpm install; cd ..; fi
pnpm install
if [ -d app ]; then cd app; pnpm install; cd ..; fi
pnpm install

echo ">>> Ortam hazır!"
