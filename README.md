# MyPortfolio Mobile

Aplikasi portofolio pribadi berbasis Flutter. Pada Tugas 7, aplikasi menampilkan identitas pemilik dan menu aksi untuk bagian Experience.

## Identitas

- **Nama:** Rheza Abdilla
- **NPM:** 2506612184
- **Kelas:** PBP F

## Struktur Kode

```text
lib/
├── main.dart
└── menu.dart
```

### Tugas 7

1. **Apa yang dimaksud dengan widget tree dan bagaimana hubungan parent–child bekerja?**

   Widget tree adalah struktur hierarkis widget yang membentuk antarmuka Flutter. Sebuah widget dapat memiliki widget anak melalui properti seperti `child` atau `children`.

   Parent memberikan konfigurasi dan batasan layout kepada child. Child menentukan ukurannya berdasarkan batasan tersebut, kemudian parent menentukan posisi child. Karena widget tersusun dalam pohon, perubahan pada suatu bagian dapat menyebabkan Flutter membangun ulang bagian terkait.

2. **Widget apa saja yang digunakan dan apa fungsinya?**

   Widget yang digunakan secara eksplisit dalam kode aplikasi:

   | Widget | Fungsi |
   | --- | --- |
   | `MyApp` | Widget buatan sendiri yang mengatur aplikasi dan tema. |
   | `MaterialApp` | Menyediakan konfigurasi aplikasi berbasis Material Design. |
   | `MyHomePage` | Widget buatan sendiri yang menyusun halaman utama. |
   | `Scaffold` | Menyediakan struktur halaman, termasuk app bar dan body. |
   | `AppBar` | Menampilkan judul pada bagian atas halaman. |
   | `SingleChildScrollView` | Memungkinkan isi halaman digulir secara vertikal. |
   | `Center` | Memusatkan child dalam ruang yang tersedia. |
   | `ConstrainedBox` | Membatasi lebar konten utama hingga 960 piksel logis. |
   | `Column` | Menyusun beberapa widget secara vertikal. |
   | `Text` | Menampilkan judul, identitas, label, dan pesan. |
   | `SizedBox` | Memberikan jarak atau menentukan lebar kartu. |
   | `LayoutBuilder` | Membuat layout berdasarkan batasan ukuran dari parent. |
   | `Wrap` | Menyusun kartu dengan jarak antaritem dan antarbaris. |
   | `InfoCard` | Widget reusable untuk menampilkan judul dan nilai identitas. |
   | `Card` | Memberikan tampilan kartu pada informasi identitas. |
   | `Padding` | Memberikan ruang di sekitar konten. |
   | `ItemCard` | Widget reusable untuk menampilkan menu interaktif. |
   | `Material` | Menyediakan permukaan berwarna untuk kartu dan efek tinta. |
   | `InkWell` | Menangani tap serta efek hover dan sentuh. |
   | `Icon` | Menampilkan ikon setiap menu. |
   | `SnackBar` | Menampilkan umpan balik singkat setelah kartu ditekan. |

    Semua widget buatan sendiri pada aplikasi ini menggunakan `StatelessWidget`.

   `ItemHomepage` bukan widget, melainkan model data. `ThemeData`, `ColorScheme`, `TextStyle`, dan `BoxConstraints` merupakan objek konfigurasi, bukan widget. `ScaffoldMessenger.of(context)` digunakan untuk mengakses pengelola SnackBar yang tersedia pada pohon widget aplikasi.

3. **Apa fungsi MaterialApp dan mengapa umum digunakan sebagai root widget?**

   `MaterialApp` menyediakan konfigurasi utama untuk aplikasi yang menggunakan Material Design, seperti tema, halaman awal, navigasi, dan dukungan lokalisasi. Widget ini juga menyediakan infrastruktur yang dibutuhkan berbagai komponen Material.

   Pada aplikasi ini, `MaterialApp` menentukan judul aplikasi, menyembunyikan banner debug, mengatur tema warna, dan menjadikan `MyHomePage` sebagai halaman awal melalui properti `home`.

   `MaterialApp` umum diletakkan dekat akar widget tree agar konfigurasi tersebut dapat digunakan oleh halaman-halaman di bawahnya. Pada kode saya, widget yang diberikan kepada `runApp()` adalah `MyApp`, lalu `MyApp` mengembalikan `MaterialApp`.

4. **Apa perbedaan StatelessWidget dan StatefulWidget?**

   `StatelessWidget` tidak memiliki objek State untuk menyimpan perubahan state lokal. Tampilannya ditentukan oleh konfigurasi yang diterima dan informasi dari widget di atasnya. StatelessWidget tetap dapat dibangun ulang ketika konfigurasi atau dependensinya berubah.

   `StatefulWidget` memiliki objek `State` yang dapat menyimpan data selama widget tersebut berada pada widget tree. Ketika data lokal berubah dan memengaruhi tampilan, `setState()` dapat digunakan untuk meminta pembaruan tampilan.

   StatelessWidget cocok untuk kartu informasi, label, atau halaman dengan konfigurasi tetap. StatefulWidget cocok untuk penghitung, pilihan checkbox, form dengan state lokal, atau tampilan yang berubah berdasarkan interaksi pengguna.

   `MyHomePage`, `InfoCard`, dan `ItemCard` menggunakan StatelessWidget karena tidak menyimpan state lokal yang berubah. Menampilkan SnackBar tidak mengharuskan ItemCard menjadi StatefulWidget, karena SnackBar dikelola melalui ScaffoldMessenger.

5. **Apa itu BuildContext dan bagaimana penggunaannya dalam build?**

   `BuildContext` merupakan antarmuka yang menunjukkan lokasi sebuah widget dalam widget tree. Context memungkinkan widget mencari informasi atau layanan dari ancestor yang sesuai.

   Parameter `context` pada `build(BuildContext context)` dapat digunakan saat menyusun widget anak. Pada aplikasi ini:

   - `Theme.of(context)` mengambil tema untuk menentukan warna AppBar.
   - `ScaffoldMessenger.of(context)` mengambil pengelola SnackBar untuk menampilkan pesan ketika kartu ditekan.

   Posisi context penting. Sebuah context hanya dapat menemukan ancestor yang berada di atas lokasinya, sehingga pemanggilan seperti `Theme.of(context)` dan `ScaffoldMessenger.of(context)` harus dilakukan dari lokasi yang sesuai dalam widget tree.

   Pada LayoutBuilder, ukuran ruang diperoleh melalui parameter `constraints`. Parameter ini digunakan untuk menentukan apakah kartu ditampilkan dalam tiga kolom atau satu kolom.

6. **Apa perbedaan hot reload, hot restart, dan full restart?**

   Hot reload memasukkan perubahan kode Dart ke aplikasi yang sedang berjalan dan membangun ulang widget tree sambil mempertahankan state yang ada. Cara ini cocok untuk perubahan tampilan seperti teks, warna, padding, dan susunan widget. Hot reload tidak menjalankan ulang `main()` atau `initState()`.

   Hot restart memulai ulang aplikasi Dart dan menghapus state sebelumnya. Proses ini menjalankan ulang `main()` dan inisialisasi state. Hot restart diperlukan ketika perubahan perlu diterapkan sejak inisialisasi atau perubahan struktur tertentu tidak dapat diterapkan melalui hot reload, misalnya mengubah widget antara StatelessWidget dan StatefulWidget.

   Full restart berarti menghentikan lalu menjalankan aplikasi kembali. Cara ini diperlukan untuk perubahan yang membutuhkan proses build atau inisialisasi platform, seperti perubahan kode native Android/iOS atau konfigurasi plugin tertentu.

   Pada terminal Flutter:

   - `r`: hot reload.
   - `R`: hot restart.
   - `q`: menghentikan aplikasi.

   Setelah aplikasi dihentikan, `flutter run -d chrome` dapat digunakan untuk menjalankannya kembali.

## AI Disclosure

Saya menggunakan ChatGPT sebagai alat bantu untuk memahami instruksi, merencanakan tampilan, memperoleh contoh kode, dan melakukan debugging.

Bantuan AI mencakup:

- Penjelasan pemisahan `main.dart` dan `menu.dart`.
- Contoh kode halaman utama, model ItemHomepage, InfoCard, dan ItemCard.
- Saran layout responsif serta warna tombol yang berbeda.
- Penjelasan error akibat deklarasi kelas yang terduplikasi.
- Panduan pengecekan aplikasi dan penyusunan draf README.

Saya mengetik dan menerapkan kode pada proyek lokal, mengirimkan kode ketika mengalami kebingungan, serta menjalankan aplikasi untuk memeriksa hasilnya.

### Ringkasan Proses Prompting

1. Meminta penjelasan checklist Tugas 7 dan ide tampilan yang relevan.
2. Meminta contoh kode beserta lokasi file yang perlu diganti, dengan implementasi dilakukan sendiri.
3. Mengirimkan kode untuk memeriksa penyebab error dan memahami alasan penghapusan kode lama.
4. Meminta panduan pengujian serta dokumentasi.

### Evaluasi dan Keterbatasan

Contoh kode dari AI tetap perlu disesuaikan dengan keadaan proyek. Saat menggabungkan kode, deklarasi kelas lama sempat tertinggal sehingga terjadi duplikasi. Setelah ditinjau, bagian lama dihapus dan struktur file dirapikan.

AI tidak menjalankan proyek Flutter lokal dalam proses pendampingan ini. Karena itu, pemeriksaan melalui `flutter analyze` dan percobaan langsung di Chrome tetap diperlukan. Pengujian manual tersebut juga belum menggantikan pengujian otomatis untuk seluruh kemungkinan ukuran layar dan interaksi.