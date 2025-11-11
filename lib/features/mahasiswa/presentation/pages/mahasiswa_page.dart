import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:praktikum_5/features/mahasiswa/presentation/bloc/mahasiswa_bloc.dart';
import 'package:praktikum_5/features/mahasiswa/presentation/bloc/mahasiswa_event.dart';
import 'package:praktikum_5/features/mahasiswa/presentation/bloc/mahasiswa_state.dart';
import 'package:praktikum_5/features/mahasiswa/presentation/pages/mahasiswa_add_page.dart';
import 'package:praktikum_5/features/mahasiswa/presentation/pages/mahasiswa_update_page.dart';

class MahasiswaPage extends StatelessWidget {
  const MahasiswaPage({super.key});

  @override
  Widget build(BuildContext context) {
    final blocMahasiswa = context.read<MahasiswaBloc>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Latihan Clean Architecture"),
      ),
      body: BlocBuilder<MahasiswaBloc, MahasiswaState>(
        builder: (context, state) {
          if (state is MahasiswaInit || state is MahasiswaLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is MahasiswaLoaded) {
            final mhs = state.mahasiswaList;
            if (mhs.isEmpty) {
              return const Center(child: Text("Belum Ada Data"));
            } else {
              return ListView.builder(
                itemCount: mhs.length,
                itemBuilder: (context, index) => Card(
                  color: const Color.fromARGB(255, 90, 133, 228),
                  margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                  child: ListTile(
                    title: Text(mhs[index].nim,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(mhs[index].nama),
                          Text(mhs[index].email),
                          Text(mhs[index].prodi),
                          Text(mhs[index].ipk.toString()),
                        ],
                      ),
                    ),
                    trailing: Wrap(
                      spacing: 4,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BlocProvider.value(
                                  value: blocMahasiswa,
                                  child: MahasiswaUpdatePage(
                                    mahasiswa: mhs[index],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            blocMahasiswa.add(
                              DeleteMahasiswaEvent(mhs[index].nim),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }
          } else if (state is MahasiswaError) {
            return Center(child: Text(state.message));
          } else {
            return const SizedBox();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BlocProvider.value(
                value: blocMahasiswa,
                child: const MahasiswaAddPage(),
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
