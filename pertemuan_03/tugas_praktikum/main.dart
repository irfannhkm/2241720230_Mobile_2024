void main() {
  String nama = "Muhammad Irfan Nur Hakim";
  String nim = "2241720230";

  print("Bilangan prima dari 0 hingga 201:");
  print("==================================");

  for (int i = 2; i <= 201; i++) {
    bool is_bilPrima = true;

    // Melakukan cek apakah bilangan tersebut prima
    for (int j = 2; j * j <= i; j++) {
      if (i % j == 0) {
        is_bilPrima = false;
        break;
      }
    }

    if (is_bilPrima) {
      print(i);
      print("Bilangan Prima ditemukan oleh: $nama, NIM: $nim");
    }
  }
}