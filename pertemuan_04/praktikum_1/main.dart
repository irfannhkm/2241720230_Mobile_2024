// langkah 1
// void main() {
//   final List<String?> list = List.filled(5, null);
//   list[1] = 'Muhammad Irfan Nur Hakim';
//   list[2] = '2241720230';
//   assert(list.length == 3);
//   assert(list[1] == 2);
//   print(list.length);
//   print(list[1]);

//   list[1] = '1';
//   assert(list[1] == 1);
//   print(list[2]);
// }

// langkah 3
// void main(){
//   final List<String?> list = List.filled(5, null);

//   list[1] = 'Muhammad Irfan Nur Hakim';
//   list[2] = '2241720230';
//   assert(list.length == 3);
//   assert(list[1] == 2);
//   print(list.length);
//   print(list[1]);

//   list[1] = '1';
//   assert(list[1] == 1);
//   print(list[1]);
// }

// langkah 3 revisi
void main() {
  final List<String?> list = List.filled(5, null);

  list[1] = 'Muhammad Irfan Nur Hakim';
  list[2] = '2241720230';

  print(list.length);
  assert(list.length == 5);
  print(list[1]);
  print(list[2]);
}
