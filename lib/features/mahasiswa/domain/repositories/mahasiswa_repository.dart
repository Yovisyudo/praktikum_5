import 'package:praktikum_5/features/mahasiswa/domain/entities/mahasiswa.dart';

abstract class MahasiswaRepository {
  Future<List<Mahasiswa>> getAllMahasiswa();
  Future<void> addMahasiswa(Mahasiswa mahasiswa);
  Future<void> updateMahasiswa(String nim, Mahasiswa mahasiswa);
  Future<void> deleteMahasiswa(String nim);
}
