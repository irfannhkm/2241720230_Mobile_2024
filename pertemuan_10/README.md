# Laporan Pertemuan 10: Dasar State Management
---

|||
|-|-|
|Nama|Muhammad Irfan Nur Hakim|
|Kelas|TI-3F|
|NIM|2241720230|
|Absen|15|
|||

## Daftar Isi:
---
```js
Pertemuan 10: Dasar State Management
├── assets (Hasil Gambar Kode Program)
|
├── Praktikum 1: Dasar State dengan Model-View
│   └── Tugas Praktikum 1
|
├── Praktikum 2: InheritedWidget dan InheritedNotifier
│   └── Tugas Praktikum 2
|
├── Praktikum 3: Membuat State di Multiple Screens
│   └── Tugas Praktikum 3
|
└── README.md (Laporan Jobsheet)
```

## Praktikum 1: Dasar State dengan Model-View
---
### Langkah 1: Buat Project Baru
Buatlah sebuah project flutter baru dengan nama master_plan di folder src week-10 repository GitHub Anda atau sesuai style laporan praktikum yang telah disepakati. 

![Hasil Program](./assets/image0.png)

### Langkah 2: Membuat model task.dart
Di folder model, buat file bernama task.dart dan buat class Task.
```dart
class Task {
  final String description;
  final bool complete;
  
  const Task({
    this.complete = false,
    this.description = '',
  });
}
```

### Langkah 3: Buat file plan.dart
Buat file plan.dart di dalam folder models dan isi kode seperti berikut.
```dart
import './task.dart';

class Plan {
  final String name;
  final List<Task> tasks;
  
  const Plan({this.name = '', this.tasks = const []});
}
```

### Langkah 4: Buat file data_layer.dart
Buat file bernama data_layer.dart di folder models. Kodenya hanya berisi export seperti berikut.
```dart
export 'plan.dart';
export 'task.dart';
```

### Langkah 5: Pindah ke file main.dart
```dart
import 'package:flutter/material.dart';
import './views/plan_screen.dart';

void main() => runApp(MasterPlanApp());

class MasterPlanApp extends StatelessWidget {
  const MasterPlanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     theme: ThemeData(primarySwatch: Colors.purple),
     home: PlanScreen(),
    );
  }
}
```

### Langkah 6: buat plan_screen.dart
```dart
import '../models/data_layer.dart';
import 'package:flutter/material.dart';

class PlanScreen extends StatefulWidget {
  const PlanScreen({super.key});

  @override
  State createState() => _PlanScreenState();
}

class _PlanScreenState extends State<PlanScreen> {
  Plan plan = const Plan();

  @override
  Widget build(BuildContext context) {
   return Scaffold(
    // ganti ‘Namaku' dengan Nama panggilan Anda
    appBar: AppBar(title: const Text('Master Plan - Muhammad Irfan Nur Hakim')),
    body: _buildList(),
    floatingActionButton: _buildAddTaskButton(),
   );
  }
}
```

### Langkah 7: buat method _buildAddTaskButton()
```dart
Widget _buildAddTaskButton() {
  return FloatingActionButton(
   child: const Icon(Icons.add),
   onPressed: () {
     setState(() {
      plan = Plan(
       name: plan.name,
       tasks: List<Task>.from(plan.tasks)
       ..add(const Task()),
     );
    });
   },
  );
}
```

### Langkah 8: buat widget _buildList()
```dart
Widget _buildList() {
  return ListView.builder(
   itemCount: plan.tasks.length,
   itemBuilder: (context, index) =>
   _buildTaskTile(plan.tasks[index], index),
  );
}
```

### Langkah 9: buat widget _buildTaskTile
```dart
Widget _buildTaskTile(Task task, int index) {
    return ListTile(
      leading: Checkbox(
          value: task.complete,
          onChanged: (selected) {
            setState(() {
              plan = Plan(
                name: plan.name,
                tasks: List<Task>.from(plan.tasks)
                  ..[index] = Task(
                    description: task.description,
                    complete: selected ?? false,
                  ),
              );
            });
          }),
      title: TextFormField(
        initialValue: task.description,
        onChanged: (text) {
          setState(() {
            plan = Plan(
              name: plan.name,
              tasks: List<Task>.from(plan.tasks)
                ..[index] = Task(
                  description: text,
                  complete: task.complete,
                ),
            );
          });
        },
      ),
    );
  }
```
### Langkah 10: Tambah Scroll Controller
```dart
late ScrollController scrollController;
```

### Langkah 11: Tambah Scroll Listener
```dart
@override
void initState() {
  super.initState();
  scrollController = ScrollController()
    ..addListener(() {
      FocusScope.of(context).requestFocus(FocusNode());
    });
}
```

### Langkah 12: Tambah controller dan keyboard behavior
```dart
  Widget _buildList() {
    return ListView.builder(
      itemCount: plan.tasks.length,
      itemBuilder: (context, index) => _buildTaskTile(plan.tasks[index], index),
      controller: scrollController,
      keyboardDismissBehavior: Theme.of(context).platform == TargetPlatform.iOS
          ? ScrollViewKeyboardDismissBehavior.onDrag
          : ScrollViewKeyboardDismissBehavior.manual,
    );
  }
```

### Langkah 13: Terakhir, tambah method dispose()
```dart
@override
void dispose() {
  scrollController.dispose();
  super.dispose();
}
```

### Langkah 14: Hasil

![Hasil Program](./assets/image1.png)


### Tugas Praktikum 1: Dasar State dengan Model-View
---
1. Selesaikan langkah-langkah praktikum tersebut, lalu dokumentasikan berupa GIF hasil akhir praktikum beserta penjelasannya di file README.md! Jika Anda menemukan ada yang error atau tidak berjalan dengan baik, silakan diperbaiki.
2. Jelaskan maksud dari langkah 4 pada praktikum tersebut! Mengapa dilakukan demikian?
    > Jadi, Fungsi dari kode data_layer.dart adalah untuk membungkus beberapa data layer atau mengekspor kedua model Plan dan Task sehingga dapat diimpor dengan lebih mudah dan ringkas di bagian lain dari aplikasi, daripada harus mengimpor kedua model tersebut secara terpisah
3. Mengapa perlu variabel plan di langkah 6 pada praktikum tersebut? Mengapa dibuat konstanta ?
    > Variabel plan digunakan untuk menyimpan instance (plan) dari model Plan. Konstanta Plan() membuat instance plan dengan nilai default, sehingga dapat mengakses dan memanipulasi data pada model Plan di dalam widget PlanScreen. Dengan menggunakan konstanta ini, kita dapat menghindari kesalahan ketika kita belum mengisi data pada model Plan.
4. Lakukan capture hasil dari Langkah 9 berupa GIF, kemudian jelaskan apa yang telah Anda buat!
    > ![Hasil Program](./assets/praktikum1.gif)
5. Apa kegunaan method pada Langkah 11 dan 13 dalam lifecyle state ?
    > * Method initState() pada Langkah 11 digunakan untuk inisialisasi widget ketika pertama kali dibuat. Lalu membuat instance ScrollController dan menambahkan listener untuk menghilangkan fokus keyboard ketika pengguna scroll.
    > * Method dispose() pada Langkah 13 digunakan untuk membersihkan sumber daya yang digunakan oleh widget ketika widget sudah tidak digunakan lagi.

