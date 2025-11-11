import 'package:equatable/equatable.dart';
import 'package:praktikum_5/features/mahasiswa/domain/entities/mahasiswa.dart';

abstract class MahasiswaState extends Equatable {
  @override
  List<Object?> get props => [];
}

class MahasiswaInit extends MahasiswaState{}

class MahasiswaLoading extends MahasiswaState{}

class MahasiswaLoaded extends MahasiswaState{
  final List<Mahasiswa>mahasiswaList;
  MahasiswaLoaded(this.mahasiswaList);

  @override
  List<Object?> get props => [mahasiswaList];
}

class MahasiswaError extends MahasiswaState {
  final String message;
  MahasiswaError(this.message);

  @override
  List<Object?> get props => [message]; 
}