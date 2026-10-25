class Queue {
  List<int> data = [];

  // Menambahkan elemen ke dalam antrian
  void enqueue(int nilai) {
    data.add(nilai);
    print('$nilai berhasil ditambahkan ke antrian');
  }

  // Menghapus elemen paling depan
  int? pop() {
    if (data.isEmpty) {
      print('Antrian kosong');
      return null;
    }
    int nilai = data.removeAt(0);
    print('$nilai dihapus dari antrian');
    return nilai;
  }

  // Menampilkan isi antrian
  void tampilkan() {
    print('Isi antrian: $data');
  }
}

void main() {
  Queue antrian = Queue();

  antrian.enqueue(10);
  antrian.enqueue(20);
  antrian.enqueue(30);
  antrian.tampilkan();

  antrian.pop();
  antrian.tampilkan();
}
