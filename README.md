# MyPortfolio Mobile

MyPortfolio Mobile adalah aplikasi portofolio pribadi berbasis Flutter untuk tugas Basic Flutter PBP. Halaman utama menampilkan identitas pemilik portofolio serta kartu aksi yang dapat ditekan.

## Fitur

- Menampilkan kartu informasi NPM, nama lengkap, dan kelas PBP.
- Menampilkan tiga aksi portofolio: **Lihat Proyek**, **Tambah Proyek**, dan **Logout**.
- Memberikan warna, ikon, dan pesan `SnackBar` yang berbeda sesuai aksi yang dipilih.
- Menyesuaikan tata letak untuk ponsel, tablet, dan layar lebar.
- Menyediakan drawer navigasi (**Home**, **Add Project**, **Add Experience**) yang dipakai di semua halaman.
- Menyediakan form **Tambah Proyek** dan **Tambah Pengalaman** dengan validasi dan dialog ringkasan.
- Form pengalaman memakai `showDatePicker()` untuk tanggal mulai/selesai (selesai tidak boleh sebelum mulai), batas panjang teks, dan validasi URL opsional.

## Struktur proyek

```text
lib/
├── main.dart                    # Konfigurasi MaterialApp dan titik masuk aplikasi
├── models/
│   ├── experience.dart          # Model data pengalaman
│   └── item_homepage.dart       # Model data untuk kartu aksi
├── screens/
│   ├── experience_form.dart     # Form tambah pengalaman
│   ├── menu.dart                # Halaman utama portofolio
│   └── project_form.dart        # Form tambah proyek
└── widgets/
    ├── info_card.dart           # Widget kartu informasi profil
    ├── left_drawer.dart         # Drawer navigasi
    └── project_card.dart        # Widget kartu aksi yang interaktif
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

Pada Tugas 8, Claude Code digunakan untuk membaca soal tugas, merancang dan menulis `Experience`, `ExperienceFormPage`, opsi drawer, serta kartu aksi dengan `pageBuilder` pada `ItemHomepage`, menjalankan `flutter analyze`, dan memperbarui dokumentasi ini.

Seluruh hasil ditinjau kembali dan disesuaikan secara manual dengan kebutuhan proyek. AI tidak digunakan untuk menjawab pertanyaan reflektif tugas.

### Log prompting ringkas

1. Analisis rubrik tugas dan buat checklist implementasi Flutter.
2. Rapikan struktur kode aplikasi menjadi model dan widget yang modular.
3. Sesuaikan kartu aksi, pesan `SnackBar`, dan tata letak responsif dengan rubrik.
Link: https://chatgpt.com/s/cx_6afaede060b08191b247f39639ce2b5f

Tugas 8 (Claude Code tidak menyediakan tautan berbagi chat, sehingga transkripnya disimpan di [`ai-log/tugas-8-claude-code-transcript.md`](ai-log/tugas-8-claude-code-transcript.md)):

4. Baca rubrik Tugas 8 dan rencanakan form baru (Pengalaman) beserta navigasinya.
5. Implementasikan model, halaman form dengan validasi, opsi drawer, dan kartu aksi.

### Evaluasi bantuan AI dan perbaikan manual

AI dapat menghasilkan saran kode atau dokumentasi yang tampak benar tetapi belum tentu sesuai dengan rubrik, data pribadi, atau perilaku aplikasi. Karena itu, hasil bantuan AI ditinjau dan disesuaikan secara manual: identitas pemilik diganti dengan data proyek, nama aksi disesuaikan dengan kebutuhan portofolio, pesan `SnackBar` dicocokkan dengan format tugas, dan jawaban reflektif ditulis serta diperiksa terpisah dari bantuan AI. Pemeriksaan akhir aplikasi dan `flutter analyze` tetap perlu dilakukan sebelum pengumpulan.

## Progres pengerjaan

| Tahap | Hasil |
| --- | --- |
| Tutorial 08 | Menyiapkan proyek Flutter dasar dan halaman portofolio. |
| Tugas 7 - Struktur | Memisahkan halaman utama, model data, `InfoCard`, dan `ItemCard`. |
| Tugas 7 - Interaksi | Menambahkan tiga aksi, warna berbeda, dan `SnackBar`. |
| Tugas 7 - UI/UX | Menambahkan tata letak responsif untuk ponsel, tablet, dan layar lebar. |
| Tugas 7 - Dokumentasi | Menambahkan setup, AI disclosure, dan jawaban reflektif. |
| Tutorial 09 | Menambahkan drawer navigasi dan form Tambah Proyek. |
| Tugas 8 - Form | Menambahkan model `Experience` dan form Tambah Pengalaman dengan validasi serta dialog ringkasan. |
| Tugas 8 - Navigasi | Menambahkan kartu aksi (`Navigator.push`) dan opsi drawer untuk form pengalaman. |

### Tugas 7

1\. Widget tree adalah struktur hierarkis widget yang membentuk antarmuka Flutter. Widget induk menyediakan konteks atau tata letak bagi widget anak; misalnya `Scaffold` menjadi induk untuk `AppBar` dan `body`, lalu `body` memuat `Column`, `Wrap`, serta kartu-kartu di dalamnya. Perubahan pada induk dapat memengaruhi cara anak disusun atau ditampilkan.

2\. Proyek ini menggunakan `MaterialApp` sebagai root aplikasi, `Scaffold` dan `AppBar` sebagai kerangka halaman, serta `SafeArea` dan `SingleChildScrollView` agar konten aman dan dapat digulir. `LayoutBuilder`, `Column`, `Wrap`, dan `GridView.count` menyusun tampilan secara responsif. `InfoCard` memakai `Card`, `Padding`, `SizedBox`, dan `Text` untuk identitas; `ItemCard` memakai `Material`, `InkWell`, `Icon`, dan `Text` untuk kartu aksi. `ScaffoldMessenger` dan `SnackBar` menampilkan pesan ketika kartu ditekan.

3\. `MaterialApp` menyediakan fondasi aplikasi berbasis Material Design, seperti tema, navigasi, lokalitas, dan halaman awal. Widget ini biasanya menjadi root karena konfigurasi tersebut dapat digunakan secara konsisten oleh seluruh widget di bawahnya. Pada proyek ini, `MaterialApp` mengatur tema dan menjadikan `MyHomePage` sebagai halaman awal.

4\. `StatelessWidget` tidak menyimpan state yang berubah, sehingga cocok untuk tampilan tetap seperti `InfoCard` dan `ItemCard` pada proyek ini. `StatefulWidget` memiliki objek `State` yang dapat berubah dan membangun ulang tampilan melalui `setState()`. Saya memilih `StatefulWidget` ketika antarmuka harus berubah selama aplikasi berjalan, misalnya untuk input formulir, status memuat, atau data proyek yang diperbarui.

5\. `BuildContext` adalah posisi sebuah widget di dalam widget tree. Context penting untuk mengakses fasilitas dari widget induk, misalnya `Theme.of(context)` untuk tema dan `ScaffoldMessenger.of(context)` untuk menampilkan `SnackBar`. Context diterima oleh metode `build`, lalu digunakan saat widget membangun tampilannya.

6\. Hot reload memasukkan perubahan kode ke aplikasi yang masih berjalan dan mempertahankan state, sehingga cocok untuk perubahan UI atau logika di dalam `build`. Hot restart membangun ulang aplikasi dan menghapus state saat ini. Saya perlu melakukan hot restart ketika mengubah inisialisasi aplikasi atau state awal yang tidak diterapkan oleh hot reload; full restart diperlukan jika aplikasi atau proses Flutter harus dijalankan ulang sepenuhnya, misalnya setelah perubahan konfigurasi native atau dependensi.

### Tugas 8

1. ...
2. ...
3. ...
4. ...
