# ext dizini varsa bağımlılıkları yükle
if [ -d "$(pwd)/ext" ]; then
  echo ">>> ext/ bağımlılıkları yükleniyor..."
  cd ext
  pnpm install
  cd ..
fi

<<<<<<< HEAD
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
=======
# app dizini varsa bağımlılıkları yükle
if [ -d "$(pwd)/app" ]; then
  echo ">>> app/ bağımlılıkları yükleniyor..."
  cd app
  pnpm install
  cd ..
fi
>>>>>>> 26f9ffd (Scaffold app & fix setup-env script)
