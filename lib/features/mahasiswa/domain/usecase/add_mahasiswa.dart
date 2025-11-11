import 'package:praktikum_5/features/mahasiswa/domain/entities/mahasiswa.dart';
import 'package:praktikum_5/features/mahasiswa/domain/repositories/mahasiswa_repository.dart';

class AddMahasiswa {
  final MahasiswaRepository repository;
  AddMahasiswa(this.repository);

  Future<void> call(Mahasiswa mahasiswa) async {
    return await repository.addMahasiswa(mahasiswa);
  }
}
