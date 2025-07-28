#!/usr/bin/env bash
set -e
exec > >(tee -a logs/01-setup-env.log) 2>&1

echo ">>> Sistemi güncelliyorum..."
sudo apt-get update -y

echo ">>> pnpm kuruluyor..."
npm install -g pnpm

echo ">>> Proje bağımlılıkları yükleniyor..."
if [ -d ext ]; then
  echo ">>> ext/ bağımlılıkları yükleniyor..."
  cd ext
  pnpm install
  cd ..
fi

if [ -d app ]; then
  echo ">>> app/ bağımlılıkları yükleniyor..."
  cd app
  pnpm install
  cd ..
fi

echo ">>> Ortam hazır!"
