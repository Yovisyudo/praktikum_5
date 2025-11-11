import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:praktikum_5/features/mahasiswa/domain/entities/mahasiswa.dart';
import 'package:praktikum_5/features/mahasiswa/presentation/bloc/mahasiswa_bloc.dart';
import 'package:praktikum_5/features/mahasiswa/presentation/bloc/mahasiswa_event.dart';

class MahasiswaAddPage extends StatelessWidget {
  const MahasiswaAddPage({super.key});

  @override
  Widget build(BuildContext context) {
    final blocMahasiswa = context.read<MahasiswaBloc>();

    TextEditingController nimCtrl = TextEditingController();
    TextEditingController namaCtrl = TextEditingController();
    TextEditingController emailCtrl = TextEditingController();
    TextEditingController proditrl = TextEditingController();
    TextEditingController ipkCtrl = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: Text("Tambah Mahasiswa")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: nimCtrl,
              decoration: InputDecoration(label: Text("NIM")),
            ),
            TextField(
              controller: namaCtrl,
              decoration: InputDecoration(label: Text("Nama")),
            ),
            TextField(
              controller: emailCtrl,
              decoration: InputDecoration(label: Text("Email")),
            ),
            TextField(
              controller: proditrl,
              decoration: InputDecoration(label: Text("Prodi")),
            ),
            TextField(
              controller: ipkCtrl,
              decoration: InputDecoration(label: Text("IPK")),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      blocMahasiswa.add(
                        AddMahasiswaEvent(
                          Mahasiswa(
                            nim: nimCtrl.text,
                            nama: namaCtrl.text,
                            email: emailCtrl.text,
                            prodi: proditrl.text,
                            ipk: double.parse(ipkCtrl.text),
                          ),
                        ),
                      );
                      Navigator.pop(context);
                    }, 
                    child: Text("Simpan"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      }, 
                      child: Text("Batal"),
                      )
                ],
              ),
              ),
          ],
        ),),
    );
  }
}