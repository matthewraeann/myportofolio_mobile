# Log AI Tugas 8 - Claude Code

Transkrip percakapan dengan Claude Code (Sonnet 5.5) saat mengerjakan Tugas 8.
Pemanggilan tool (baca file, edit file, perintah shell) diringkas menjadi catatan dalam tanda kurung siku; isi PDF soal tidak disalin ulang.

---

## Pengguna

(Melampirkan `tugas-8.pdf` dan `tutorial-9.pdf`)

Tutorial 9 sudah selesai dikerjakan. Sekarang bantu saya mengerjakan tugas 8.

## Claude Code

Hasil baca PDF tugas-8 tadi tidak menampilkan isinya, jadi saya baca ulang dengan rentang halaman.

[Membaca `tugas-8.pdf` (4 halaman) dan mendaftar berkas `.dart` di proyek.]
[Membaca `project_form.dart`, `left_drawer.dart`, `menu.dart`, `item_homepage.dart`, `info_card.dart`, `README.md`, `project_card.dart`, dan `main.dart`.]

[Mode perencanaan: menulis rencana "Formulir Pengalaman" dengan isi:
- model `Experience`;
- halaman `ExperienceFormPage` dengan >= 3 input tervalidasi, `showDatePicker()`, dan `AlertDialog` ringkasan;
- opsi "Add Experience" di drawer;
- kartu "Tambah Pengalaman" di halaman utama memakai `Navigator.push`, dengan field `pageBuilder` pada `ItemHomepage`;
- pembaruan README;
- commit bertahap lalu push.]

## Pengguna

Kamu boleh commit dan push menggunakan akun saya tanpa nama anda. Pertanyaan reflektif lewatkan dulu (biar saya yang mengisinya nanti). Lanjutkan

## Claude Code

[Rencana diperbarui: jawaban reflektif dikosongkan (placeholder), commit tanpa atribusi Claude. Rencana disetujui.]

[Implementasi:
- membuat `lib/models/experience.dart`;
- membuat `lib/screens/experience_form.dart`;
- menambah opsi "Add Experience" pada `lib/widgets/left_drawer.dart`;
- menambah field `pageBuilder` pada `lib/models/item_homepage.dart`;
- memperbarui `lib/widgets/project_card.dart` agar memakai `pageBuilder`;
- menambah kartu "Tambah Pengalaman" di `lib/screens/menu.dart`;
- mengubah label tombol di `lib/screens/project_form.dart` dari "Save" menjadi "Simpan".]

[Menjalankan `flutter analyze`: *No issues found!*]

[Memperbarui `README.md`: fitur, struktur proyek, tabel progres, AI disclosure, log prompting, dan heading `### Tugas 8` dengan placeholder `1. ... 4. ...`.]

[Commit (tanpa atribusi Claude) dan push ke `origin/main`:
- `feat: add experience model`
- `feat: add experience form page with validation and summary dialog`
- `feat: add experience card and drawer entry`
- `docs: add tugas 8 section and update AI disclosure`]

Ringkasan akhir yang disampaikan:

- Form Pengalaman berisi posisi, organisasi, tanggal mulai, tanggal selesai (`showDatePicker()`, selesai tidak boleh sebelum mulai), deskripsi, dan tautan opsional (validasi URL http/https).
- Tombol **Simpan** memanggil `validate()` lalu menampilkan `AlertDialog` ringkasan dengan tombol **OK**.
- Kartu "Tambah Pengalaman" dan opsi drawer "Add Experience" membuka form; **Home** dan **Add Project** tetap ada.
- `flutter analyze` bersih. Aplikasi belum dijalankan di Chrome.
- Yang tersisa untuk pengguna: mengisi jawaban reflektif, menambahkan link log, menguji manual, dan mengumpulkan tautan commit di SCELE sebelum Senin, 23 November 2026, 23.59 WIB.

## Pengguna

Claude Code tidak ada fitur share chat link. Buatkan saja folder log ai, kemudian masukkan transcript chat ini ke dalam bentuk file ke folder tersebut

## Claude Code

[Membuat folder `ai-log/` dan berkas ini.]
