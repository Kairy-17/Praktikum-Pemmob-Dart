# Proyek Flutter: Belajar (Modul 2 Pemrograman Mobile)

Proyek ini dibuat sebagai implementasi dari **Modul 2 Praktikum Pemrograman Mobile: Pengenalan dan Desain Framework Flutter**.

---

## 📑 Daftar Isi
1. [Tentang Proyek](#-tentang-proyek)
2. [Konsep Dasar Flutter](#-konsep-dasar-flutter)
3. [Struktur Folder](#-struktur-folder)
4. [Penjelasan Lengkap Kode Sumber](#-penjelasan-lengkap-kode-sumber)
   - [1. Hello World (`hello_world.dart`)](#1-hello-world-dart)
   - [2. Column Widget (`column_widget.dart`)](#2-column-widget-dart)
   - [3. Row Widget (`row_widget.dart`)](#3-row-widget-dart)
   - [4. Form Produk (`ui/produk_form.dart`)](#4-form-produk-uiproduk_formdart)
   - [5. Detail Produk (`ui/produk_detail.dart`)](#5-detail-produk-uiproduk_detaildart)
   - [6. List Data Produk (`ui/produk_page.dart`)](#6-list-data-produk-uiproduk_pagedart)
   - [7. Main Entry Point (`main.dart`)](#7-main-entry-point-maindart)
5. [Tangkapan Layar Tampilan Aplikasi](#-tangkapan-layar-tampilan-aplikasi)
6. [Cara Menjalankan Aplikasi](#-cara-menjalankan-aplikasi)
7. [Panduan Mengganti / Memasukkan Screenshot Manual](#-panduan-mengganti--memasukkan-screenshot-manual)

---

## 📱 Tentang Proyek
Proyek Flutter ini mengeksplorasi pembuatan aplikasi mobile multiplatform dengan fokus pada:
- Pembuatan antarmuka pengguna (*UI*) menggunakan widget dasar Flutter.
- Pemahaman perbedaan **StatelessWidget** dan **StatefulWidget**.
- Penyusunan tata letak linier menggunakan **Column** (vertikal) dan **Row** (horizontal).
- Penanganan input data form dengan **TextEditingController** dan validasi numerik.
- Navigasi antar halaman (*routing*) dengan pengiriman parameter (*data passing*) via `Navigator.push`.
- Penyajian data kolektif dalam bentuk daftar memanfaatkan **ListView**, **Card**, dan **ListTile**.

---

## 🧠 Konsep Dasar Flutter
Flutter mengadopsi paradigma *declarative UI* di mana tampilan aplikasi dibangun dari pohon widget (*widget tree*):
- **StatelessWidget**: Widget statis tanpa status internal (*state*) yang dapat berubah setelah dirender. Sangat ideal untuk halaman presentasi atau komponen teks tetap.
- **StatefulWidget**: Widget dinamis yang memiliki objek `State`. Ketika `setState()` dipanggil, framework akan merender ulang (*re-render*) widget tersebut sesuai perubahan data terkini.
- **Scaffold**: Kerangka dasar tata letak material design yang menyediakan slot standar seperti `appBar`, `body`, `floatingActionButton`, dan `drawer`.

---

## 📂 Struktur Folder
```text
belajar/
├── android/            # Kode native dan konfigurasi platform Android
├── ios/                # Kode native dan konfigurasi platform iOS
├── lib/                # Kode utama aplikasi Flutter (Dart)
│   ├── ui/
│   │   ├── produk_detail.dart # Halaman tampilan detail produk
│   │   ├── produk_form.dart   # Halaman formulir input data produk
│   │   └── produk_page.dart   # Halaman daftar produk (ListView)
│   ├── column_widget.dart     # Contoh implementasi widget Column
│   ├── hello_world.dart       # Contoh widget Hello World dasar
│   ├── main.dart              # Entry point utama aplikasi Flutter
│   └── row_widget.dart        # Contoh implementasi widget Row
├── docs/
│   └── screenshots/           # Tangkapan layar hasil eksekusi tiap latihan
├── test/                      # Pengujian unit & widget
└── pubspec.yaml               # Manajemen dependensi dan metadata proyek
```

---

## 🔍 Penjelasan Lengkap Kode Sumber

### 1. Hello World (`lib/hello_world.dart`)
```dart
import 'package:flutter/material.dart';

class HelloWorld extends StatelessWidget {
  const HelloWorld({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Belajar Flutter'),
      ),
      body: const Center(
        child: Text('Hello World'),
      ),
    );
  }
}
```
- **`StatelessWidget`**: `HelloWorld` merupakan widget statis yang tidak menyimpan state dinamis.
- **`Scaffold`**: Membentuk struktur halaman material.
- **`AppBar`**: Menampilkan bilah navigasi atas bertuliskan *"Belajar Flutter"*.
- **`Center`**: Menempatkan widget anak (`child`) tepat di tengah-tengah ruang layar yang tersedia.
- **`Text`**: Menampilkan string *"Hello World"*.

---

### 2. Column Widget (`lib/column_widget.dart`)
```dart
import 'package:flutter/material.dart';

class ColumnWidget extends StatelessWidget {
  const ColumnWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Widget Column'),
      ),
      body: const Column(
        children: [
          Text('Kolom 1'),
          Text('Kolom 2'),
          Text('Kolom 3'),
          Text('Kolom 4'),
        ],
      ),
    );
  }
}
```
- **`Column`**: Widget tata letak (*layout*) multi-anak yang menyusun elemen secara **vertikal** (dari atas ke bawah).
- Properti **`children`**: Menerima list widget berupa deretan `Text` yang tersusun berurutan ke bawah.

---

### 3. Row Widget (`lib/row_widget.dart`)
```dart
import 'package:flutter/material.dart';

class RowWidget extends StatelessWidget {
  const RowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Widget Row'),
      ),
      body: const Row(
        children: [
          Text('Row 1'),
          Text('Row 2'),
          Text('Row 3'),
          Text('Row 4'),
        ],
      ),
    );
  }
}
```
- **`Row`**: Widget tata letak multi-anak yang menyusun elemen secara **horizontal** (dari kiri ke kanan).
- Berlawanan dengan `Column`, `Row` memanfaatkan sumbu horizontal sebagai sumbu utamanya (*main axis*).

---

### 4. Form Produk (`lib/ui/produk_form.dart`)
```dart
import 'package:flutter/material.dart';
import 'produk_detail.dart';

class ProdukForm extends StatefulWidget {
  const ProdukForm({super.key});

  @override
  State<ProdukForm> createState() => _ProdukFormState();
}

class _ProdukFormState extends State<ProdukForm> {
  final _kodeProdukController = TextEditingController();
  final _namaProdukController = TextEditingController();
  final _hargaProdukController = TextEditingController();

  @override
  void dispose() {
    _kodeProdukController.dispose();
    _namaProdukController.dispose();
    _hargaProdukController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Produk'),
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            _textboxKodeProduk(),
            _textboxNamaProduk(),
            _textboxHarga(),
            const SizedBox(height: 10),
            _tombolSimpan(),
          ],
        ),
      ),
    );
  }

  Widget _textboxKodeProduk() {
    return TextField(
      decoration: const InputDecoration(labelText: "Kode Produk"),
      controller: _kodeProdukController,
    );
  }

  Widget _textboxNamaProduk() {
    return TextField(
      decoration: const InputDecoration(labelText: "Nama Produk"),
      controller: _namaProdukController,
    );
  }

  Widget _textboxHarga() {
    return TextField(
      decoration: const InputDecoration(labelText: "Harga"),
      controller: _hargaProdukController,
      keyboardType: TextInputType.number,
    );
  }

  Widget _tombolSimpan() {
    return ElevatedButton(
      onPressed: () {
        String kodeProduk = _kodeProdukController.text;
        String namaProduk = _namaProdukController.text;
        int harga = int.tryParse(_hargaProdukController.text) ?? 0;
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ProdukDetail(
              kodeProduk: kodeProduk,
              namaProduk: namaProduk,
              harga: harga,
            ),
          ),
        );
      },
      child: const Text('Simpan'),
    );
  }
}
```
- **`StatefulWidget`**: Digunakan karena formulir menampung masukan interaktif dari pengguna.
- **`TextEditingController`**: Mengontrol teks di dalam masing-masing `TextField` (`_kodeProdukController`, `_namaProdukController`, `_hargaProdukController`) serta mengosongkan memori di method `dispose()`.
- **`TextField`**: Kolom input pengguna lengkap dengan `InputDecoration` untuk label.
- **`ElevatedButton` & `Navigator.push`**: Ketika tombol simpan ditekan:
  1. Mengambil teks dari controller.
  2. Mengonversi harga teks menjadi integer dengan `int.tryParse()`.
  3. Berpindah halaman ke `ProdukDetail` melalui `MaterialPageRoute` sembari mengirimkan nilai parameter (*arguments passing*).

---

### 5. Detail Produk (`lib/ui/produk_detail.dart`)
```dart
import 'package:flutter/material.dart';

class ProdukDetail extends StatelessWidget {
  final String? kodeProduk;
  final String? namaProduk;
  final int? harga;

  const ProdukDetail({
    super.key,
    this.kodeProduk,
    this.namaProduk,
    this.harga,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Produk"),
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Kode Produk : $kodeProduk"),
            Text("Nama Produk : $namaProduk"),
            Text("Harga Produk : $harga"),
          ],
        ),
      ),
    );
  }
}
```
- Menerima parameter `kodeProduk`, `namaProduk`, dan `harga` melalui konstruktor kelas.
- Nilai-nilai tersebut ditampilkan kembali secara rapi menggunakan string interpolation (`$kodeProduk`, `$namaProduk`, `$harga`).

---

### 6. List Data Produk (`lib/ui/produk_page.dart`)
```dart
import 'package:flutter/material.dart';

class ProdukPage extends StatefulWidget {
  const ProdukPage({super.key});

  @override
  State<ProdukPage> createState() => _ProdukPageState();
}

class _ProdukPageState extends State<ProdukPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Data Produk'),
      ),
      body: ListView(
        children: const [
          Card(
            child: ListTile(
              title: Text('Kulkas'),
              subtitle: Text('30000'),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('Playstation'),
              subtitle: Text('30000'),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('Radio'),
              subtitle: Text('30000'),
            ),
          ),
        ],
      ),
    );
  }
}
```
- **`ListView`**: Komponen daftar yang dapat digulir (*scrollable*) untuk menampung banyak item.
- **`Card`**: Menghasilkan kartu dengan efek bayangan dan elevasi modern.
- **`ListTile`**: Format item baris standar dengan judul (`title`) dan keterangan tambahan (`subtitle`).

---

### 7. Main Entry Point (`lib/main.dart`)
```dart
import 'package:flutter/material.dart';
import 'ui/produk_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Flutter Pertama',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: false,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
      ),
      home: const ProdukPage(),
    );
  }
}
```
- **`main()`**: Titik awal eksekusi program Flutter dengan memanggil `runApp()`.
- **`MaterialApp`**: Widget pembungkus aplikasi yang menyediakan navigasi, tema warna Material, dan konfigurasi judul aplikasi.
- Bagian **`home`**: Diatur ke `ProdukPage()` sesuai instruksi penutup di Modul 2.

---

## 📸 Tangkapan Layar Tampilan Aplikasi

Berikut adalah hasil tangkapan layar langsung (*actual screen captures*) dari setiap latihan pada emulator Android:

| Latihan | Tangkapan Layar |
| :--- | :---: |
| **1. Hello World** (`hello_world.dart`) | <img src="docs/screenshots/01_hello_world.png" width="300"/> |
| **2. Widget Column** (`column_widget.dart`) | <img src="docs/screenshots/02_column_widget.png" width="300"/> |
| **3. Widget Row** (`row_widget.dart`) | <img src="docs/screenshots/03_row_widget.png" width="300"/> |
| **4. Form Input Produk** (`ui/produk_form.dart`) | <img src="docs/screenshots/04_produk_form.png" width="300"/> |
| **5. Detail Produk (Hasil Submit)** (`ui/produk_detail.dart`) | <img src="docs/screenshots/05_produk_detail.png" width="300"/> |
| **6. List Data Produk (ListView)** (`ui/produk_page.dart`) | <img src="docs/screenshots/06_produk_page.png" width="300"/> |

---

## 🚀 Cara Menjalankan Aplikasi

1. **Pastikan Emulator atau Handphone Terhubung**:
   ```bash
   flutter devices
   ```

2. **Jalankan Aplikasi Melalui Terminal**:
   ```bash
   cd "d:/belajar"
   flutter run
   ```

3. **Untuk Mengganti Halaman yang Ditampilkan**:
   Buka file [lib/main.dart](lib/main.dart) dan ubah properti `home:` pada `MaterialApp`:
   - Menampilkan Hello World: `home: const HelloWorld()` (import `hello_world.dart`)
   - Menampilkan Column: `home: const ColumnWidget()` (import `column_widget.dart`)
   - Menampilkan Row: `home: const RowWidget()` (import `row_widget.dart`)
   - Menampilkan Form Produk: `home: const ProdukForm()` (import `ui/produk_form.dart`)
   - Menampilkan List Produk: `home: const ProdukPage()` (import `ui/produk_page.dart`)

---

## 🛠️ Panduan Mengganti / Memasukkan Screenshot Manual

Jika Anda ingin mengambil tangkapan layar sendiri dari emulator atau handphone secara manual, ikuti langkah mudah berikut:

### Opsi A: Melalui Android Studio Emulator
1. Jalankan aplikasi di emulator.
2. Pada panel kontrol emulator (toolbar di sisi kanan emulator), klik ikon **Kamera** (*Take Screenshot*).
3. Simpan file gambar ke folder `docs/screenshots/`.
4. Beri nama file sesuai dengan nama yang dirujuk di README:
   - `01_hello_world.png`
   - `02_column_widget.png`
   - `03_row_widget.png`
   - `04_produk_form.png`
   - `05_produk_detail.png`
   - `06_produk_page.png`

### Opsi B: Melalui Terminal (ADB)
Jika Anda menggunakan terminal dengan perangkat fisik atau emulator yang aktif:
```bash
# Contoh mengambil screenshot langsung dan menyimpannya:
adb exec-out screencap -p > docs/screenshots/06_produk_page.png
```

### Opsi C: Menampilkan Screenshot di Markdown
Gunakan format markdown gambar berikut:
```markdown
![Deskripsi Tampilan](docs/screenshots/nama_file.png)
```
atau menggunakan HTML untuk mengatur lebar gambar:
```html
<img src="docs/screenshots/nama_file.png" width="300"/>
```
