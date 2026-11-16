# MyPortfolio Mobile

MyPortfolio Mobile adalah aplikasi portofolio pribadi berbasis Flutter untuk tugas Basic Flutter PBP. Halaman utama menampilkan identitas pemilik portofolio serta kartu aksi yang dapat ditekan.

## Fitur

- Menampilkan kartu informasi NPM, nama lengkap, dan kelas PBP.
- Menampilkan tiga aksi portofolio: **Lihat Proyek**, **Tambah Proyek**, dan **Logout**.
- Memberikan warna, ikon, dan pesan `SnackBar` yang berbeda sesuai aksi yang dipilih.
- Menyesuaikan tata letak untuk ponsel, tablet, dan layar lebar.

## Struktur proyek

```text
lib/
├── main.dart                    # Konfigurasi MaterialApp dan titik masuk aplikasi
├── menu.dart                    # Halaman utama portofolio
├── models/
│   └── item_homepage.dart       # Model data untuk kartu aksi
└── widgets/
    ├── info_card.dart           # Widget kartu informasi profil
    └── item_card.dart           # Widget kartu aksi yang interaktif
```

## Menjalankan aplikasi

1. Pastikan Flutter SDK telah terpasang dan perangkat atau emulator tersedia.
2. Jalankan perintah berikut dari folder root proyek:

   ```bash
   flutter pub get
   flutter devices
   flutter run -d chrome
   ```

   Ganti `chrome` dengan ID perangkat lain jika diperlukan.

## Pemeriksaan kualitas kode

Jalankan perintah berikut sebelum mengumpulkan tugas:

```bash
flutter analyze
```

Target pemeriksaan adalah hasil tanpa error maupun peringatan (`No issues found`).

## Penggunaan AI

OpenAI Codex digunakan sebagai asisten pengembangan untuk menelaah rubrik tugas, menyarankan pemisahan komponen Flutter, serta membantu merapikan struktur dan responsivitas antarmuka. Bantuan AI digunakan pada bagian berikut:

- memisahkan model `ItemHomepage`, `InfoCard`, dan `ItemCard` ke berkas terpisah;
- menyelaraskan label kartu aksi dan pesan `SnackBar` dengan ketentuan tugas;
- menyusun tata letak responsif untuk ukuran layar yang berbeda;
- menyusun dokumentasi proyek ini.

Seluruh hasil ditinjau kembali dan disesuaikan secara manual dengan kebutuhan proyek. AI tidak digunakan untuk menjawab pertanyaan reflektif tugas.

### Log prompting ringkas

1. Analisis rubrik tugas dan buat checklist implementasi Flutter.
2. Rapikan struktur kode aplikasi menjadi model dan widget yang modular.
3. Sesuaikan kartu aksi, pesan `SnackBar`, dan tata letak responsif dengan rubrik.
