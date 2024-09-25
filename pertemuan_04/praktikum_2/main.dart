void main(){
  // var halogens = {'fluorine', 'chlorine', 'bromine', 'iodine', 'astatine'};
  // print(halogens);

  // var names1 = <String>{};
  // Set<String> names2 = {}; // This works, too.
  // var names3 = {}; // Creates a map, not a set.

  // print(names1);
  // print(names2);
  // print(names3);

  var names1 = <String>{};
  Set<String> names2 = {}; // This works, too.
  var names3 = {}; // Creates a map, not a set.

   // menambahkan ke names1 menggunakan .add()
  names1.add('Muhammad Irfan Nur Hakim');
  names1.add('2241720230');

  // menambahkan ke names2 menggunakan .addAll()
  names2.addAll(['Muhammad Irfan N. H.', '2241720230']);  

  print(names1);
  print(names2);
  print(names3);
}