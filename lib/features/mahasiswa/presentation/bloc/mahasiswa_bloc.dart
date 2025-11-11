import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:praktikum_5/features/mahasiswa/domain/usecase/add_mahasiswa.dart';
import 'package:praktikum_5/features/mahasiswa/domain/usecase/delete_mahasiswa.dart';
import 'package:praktikum_5/features/mahasiswa/domain/usecase/get_all_mahasiswa.dart';
import 'package:praktikum_5/features/mahasiswa/domain/usecase/update_mahasiswa.dart';
import 'package:praktikum_5/features/mahasiswa/presentation/bloc/mahasiswa_event.dart';
import 'package:praktikum_5/features/mahasiswa/presentation/bloc/mahasiswa_state.dart';

class MahasiswaBloc extends Bloc<MahasiswaEvent, MahasiswaState> {
  final GetAllMahasiswa getAllMahasiswa;
  final AddMahasiswa addMahasiswa;
  final UpdateMahasiswa updateMahasiswa;
  final DeleteMahasiswa deleteMahasiswa;

  MahasiswaBloc({
    required this.getAllMahasiswa,
    required this.addMahasiswa,
    required this.updateMahasiswa,
    required this.deleteMahasiswa,
  }) : super(MahasiswaInit()) {
    on<LoadMahasiswaEvent>((event, emit) async {
      emit(MahasiswaLoading());
      try {
        final data = await getAllMahasiswa();
        emit(MahasiswaLoaded(data));
      } catch (e) {
        emit(MahasiswaError(e.toString()));
      }
    });
    on<AddMahasiswaEvent>((event, emit) async {
      await addMahasiswa(event.mahasiswa);
      final data = await getAllMahasiswa();
      emit(MahasiswaLoaded(data));
    });
    on<UpdateMahasiswaEvent>((event, emit) async {
      await updateMahasiswa(event.nim, event.mahasiswa);
      final data = await getAllMahasiswa();
      emit(MahasiswaLoaded(data));
    });
    on<DeleteMahasiswaEvent>((event, emit) async {
      await deleteMahasiswa(event.nim);
      final data = await getAllMahasiswa();
      emit(MahasiswaLoaded(data));
    });
  }
}
