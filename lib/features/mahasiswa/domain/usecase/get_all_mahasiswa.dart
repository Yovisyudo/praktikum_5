import 'package:praktikum_5/features/mahasiswa/domain/entities/mahasiswa.dart';
import 'package:praktikum_5/features/mahasiswa/domain/repositories/mahasiswa_repository.dart';

class GetAllMahasiswa {
  final MahasiswaRepository repository;
  GetAllMahasiswa(this.repository);
  
  Future<List<Mahasiswa>> call() async {
    return await repository.getAllMahasiswa();
  }
}
