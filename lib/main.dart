import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:praktikum_5/features/mahasiswa/data/datas_source/mahasiswa_remote_data_source.dart';
import 'package:praktikum_5/features/mahasiswa/domain/repositories/mahasiswa_repository_impl.dart';
import 'package:praktikum_5/features/mahasiswa/domain/usecase/add_mahasiswa.dart';
import 'package:praktikum_5/features/mahasiswa/domain/usecase/delete_mahasiswa.dart';
import 'package:praktikum_5/features/mahasiswa/domain/usecase/get_all_mahasiswa.dart';
import 'package:praktikum_5/features/mahasiswa/domain/usecase/update_mahasiswa.dart';
import 'package:praktikum_5/features/mahasiswa/presentation/bloc/mahasiswa_bloc.dart';
import 'package:praktikum_5/features/mahasiswa/presentation/bloc/mahasiswa_event.dart';
import 'package:praktikum_5/features/mahasiswa/presentation/pages/mahasiswa_page.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final repository = MahasiswaRepositoryImpl(MahasiswaRemoteDataSource());

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create:
            (context) => MahasiswaBloc(
              getAllMahasiswa: GetAllMahasiswa(repository),
              addMahasiswa: AddMahasiswa(repository),
              updateMahasiswa: UpdateMahasiswa(repository),
              deleteMahasiswa: DeleteMahasiswa(repository),
            )..add(LoadMahasiswaEvent()),
        child: MahasiswaPage(),
      ),
    );
  }
}
