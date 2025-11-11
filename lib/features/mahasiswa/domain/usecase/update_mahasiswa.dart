import 'package:praktikum_5/features/mahasiswa/domain/entities/mahasiswa.dart';
import 'package:praktikum_5/features/mahasiswa/domain/repositories/mahasiswa_repository.dart';

class UpdateMahasiswa {
  final MahasiswaRepository repository;
  UpdateMahasiswa(this.repository);

  Future<void> call(String nim, Mahasiswa mahasiswa) async {
    await repository.updateMahasiswa(nim, mahasiswa);
  }
}
