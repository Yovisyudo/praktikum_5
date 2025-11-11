import 'package:praktikum_5/features/mahasiswa/data/datas_source/mahasiswa_remote_data_source.dart';
import 'package:praktikum_5/features/mahasiswa/domain/entities/mahasiswa.dart';
import 'package:praktikum_5/features/mahasiswa/domain/repositories/mahasiswa_repository.dart';

class MahasiswaRepositoryImpl extends MahasiswaRepository {
  final MahasiswaRemoteDataSource remoteDataSource;

  MahasiswaRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<Mahasiswa>> getAllMahasiswa() async {
    return await remoteDataSource.getAllMahasiswa();
  }

  @override
  Future<void> addMahasiswa(Mahasiswa mahasiswa) async {
    await remoteDataSource.addMahasiswa(mahasiswa);
  }

  @override
  Future<void> updateMahasiswa(String nim, Mahasiswa mahasiswa) async {
    await remoteDataSource.updateMahasiswa(nim, mahasiswa);
  }

  @override
  Future<void> deleteMahasiswa(String nim) async {
    await remoteDataSource.deleteMahasiswa(nim);
  }
}
