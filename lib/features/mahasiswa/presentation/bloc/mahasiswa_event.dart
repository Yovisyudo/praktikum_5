import 'package:equatable/equatable.dart';
import 'package:praktikum_5/features/mahasiswa/domain/entities/mahasiswa.dart';

abstract class MahasiswaEvent extends Equatable{
  @override
  List<Object?> get props => [];
}

class LoadMahasiswaEvent extends MahasiswaEvent {}
class AddMahasiswaEvent extends MahasiswaEvent {
  final Mahasiswa mahasiswa;
  AddMahasiswaEvent(this.mahasiswa);

  @override
  List<Object?> get props => [mahasiswa];
}

class UpdateMahasiswaEvent extends MahasiswaEvent{
  final String nim;
  final Mahasiswa mahasiswa;
  UpdateMahasiswaEvent(this.nim, this.mahasiswa);

  @override
  List<Object?> get props => [nim, mahasiswa];
}

class DeleteMahasiswaEvent extends MahasiswaEvent{
  final String nim;
  DeleteMahasiswaEvent(this.nim);

  @override
  List<Object?> get props => [nim];
}