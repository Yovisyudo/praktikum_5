import 'package:praktikum_5/features/mahasiswa/domain/repositories/mahasiswa_repository.dart';

class DeleteMahasiswa {
  final MahasiswaRepository repository;
  DeleteMahasiswa(this.repository);

  Future<void> call(String nim) async {
    await repository.deleteMahasiswa(nim);
  }
}
