import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:praktikum_5/features/mahasiswa/domain/entities/mahasiswa.dart';
import 'package:praktikum_5/features/mahasiswa/presentation/bloc/mahasiswa_bloc.dart';
import 'package:praktikum_5/features/mahasiswa/presentation/bloc/mahasiswa_event.dart';

class MahasiswaUpdatePage extends StatelessWidget {
  final Mahasiswa mahasiswa;
  const MahasiswaUpdatePage({super.key, required this.mahasiswa});

  @override
  Widget build(BuildContext context) {
    final blocMahasiswa = context.read<MahasiswaBloc>();
    
    TextEditingController nimCtrl = TextEditingController(text: mahasiswa.nim);
    TextEditingController namaCtrl = TextEditingController(
      text: mahasiswa.nama,
    );
    TextEditingController emailCtrl = TextEditingController(
      text: mahasiswa.email,
    );
    TextEditingController prodiCtrl = TextEditingController(
      text: mahasiswa.prodi,
    );
    TextEditingController ipkCtrl = TextEditingController(
      text: mahasiswa.ipk.toString(),
    );
    return Scaffold(
      appBar: AppBar(

        title: Text("Update Mahasiswa"),
      ),
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
              controller: prodiCtrl,
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
                        UpdateMahasiswaEvent(
                          nimCtrl.text,
                          Mahasiswa(
                            nim: nimCtrl.text, 
                            nama: namaCtrl.text, 
                            email: emailCtrl.text, 
                            prodi: prodiCtrl.text, 
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
                      ),
                ],
              ),)
          ],
        ),),
    );
  }
}