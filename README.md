# Praktikum Pemrograman Mobile - Struktur Data Queue (Dart)

Repositori ini berisi implementasi struktur data **Queue (Antrian)** menggunakan bahasa pemrograman **Dart**.

---

## 📌 Konsep Queue (Antrian)

**Queue** adalah struktur data linier yang mengikuti prinsip **FIFO (First-In, First-Out)**, yang berarti elemen yang pertama kali dimasukkan akan menjadi elemen yang pertama kali dikeluarkan.

Operasi dasar pada Queue meliputi:
1. **Enqueue**: Menambahkan elemen ke posisi paling belakang antrian.
2. **Dequeue / Pop**: Menghapus dan mengambil elemen dari posisi paling depan antrian.
3. **Display / Tampilkan**: Melihat seluruh elemen yang berada di dalam antrian.

---

## 📂 Penjelasan Kode (`queue.dart`)

Berikut adalah rincian komponen dan method dalam kode [queue.dart](queue.dart):

### 1. Deklarasi Class & Properti
```dart
class Queue {
  List<int> data = [];
```
- Mendefinisikan class `Queue`.
- Properti `data` bertipe `List<int>` digunakan sebagai wadah penampung elemen-elemen antrian berupa bilangan bulat (*integer*).

---

### 2. Method `enqueue(int nilai)`
```dart
void enqueue(int nilai) {
  data.add(nilai);
  print('$nilai berhasil ditambahkan ke antrian');
}
```
- **Fungsi**: Menambahkan elemen baru ke antrian.
- Menggunakan `data.add(nilai)` yang secara otomatis meletakkan elemen di akhir list (sesuai konsep antrian di mana anggota baru masuk dari belakang).
- Mencetak konfirmasi bahwa nilai berhasil ditambahkan.

---

### 3. Method `pop()` (Dequeue)
```dart
int? pop() {
  if (data.isEmpty) {
    print('Antrian kosong');
    return null;
  }
  int nilai = data.removeAt(0);
  print('$nilai dihapus dari antrian');
  return nilai;
}
```
- **Fungsi**: Mengeluarkan elemen paling depan dari antrian.
- **Validasi Underflow**: Mengecek apakah antrian kosong (`data.isEmpty`). Jika kosong, mencetak pesan peringatan dan mengembalikan `null`. Tipe kembalian `int?` mendukung *null-safety*.
- **Pengambilan Elemen**: Menggunakan `data.removeAt(0)` untuk mengambil dan menghapus elemen indeks ke-0 (elemen yang paling pertama masuk).
- Mengembalikan nilai yang dihapus.

---

### 4. Method `tampilkan()`
```dart
void tampilkan() {
  print('Isi antrian: $data');
}
```
- **Fungsi**: Menampilkan seluruh data antrian saat ini ke terminal/konsol.

---

### 5. Fungsi Utama (`main()`)
```dart
void main() {
  Queue antrian = Queue();

  antrian.enqueue(10);
  antrian.enqueue(20);
  antrian.enqueue(30);
  antrian.tampilkan();

  antrian.pop();
  antrian.tampilkan();
}
```
- Membuat objek `antrian` dari class `Queue`.
- Menambahkan 3 nilai: `10`, `20`, dan `30`.
- Menampilkan isi antrian (`[10, 20, 30]`).
- Memanggil `pop()`, yang akan menghapus elemen pertama yaitu `10`.
- Menampilkan kembali isi antrian (`[20, 30]`).

---

## 🚀 Cara Menjalankan Program

Pastikan Anda telah menginstal [Dart SDK](https://dart.dev/get-dart).

1. Buka terminal atau command prompt di direktori proyek ini:
   ```bash
   cd "d:/Praktikum Flutter Dart"
   ```

2. Jalankan file Dart:
   ```bash
   dart run queue.dart
   ```
   *(atau `dart queue.dart`)*

---

## 🖥️ Output Program

```text
10 berhasil ditambahkan ke antrian
20 berhasil ditambahkan ke antrian
30 berhasil ditambahkan ke antrian
Isi antrian: [10, 20, 30]
10 dihapus dari antrian
Isi antrian: [20, 30]
```
