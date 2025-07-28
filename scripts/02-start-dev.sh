#!/usr/bin/env bash
set -e
exec > >(tee -a logs/02-start-dev.log) 2>&1

echo ">>> Uzantı geliştirme sunucusu başlatılıyor..."
cd ext && pnpm run dev &

echo ">>> Panel geliştirme sunucusu başlatılıyor..."
cd ../app && pnpm run dev
