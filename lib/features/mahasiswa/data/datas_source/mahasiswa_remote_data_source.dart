import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:praktikum_5/features/mahasiswa/domain/entities/mahasiswa.dart';

class MahasiswaRemoteDataSource {
  final String baseUrl = "http://localhost:3000/api/mahasiswa";

  Future<List<Mahasiswa>> getAllMahasiswa() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      return data
          .map(
            (item) => Mahasiswa(
              nim: item['nim'],
              nama: item['nama'],
              email: item['email'],
              prodi: item['prodi'],
              ipk: double.parse(item['ipk'].toString()),
            ),
          )
          .toList();
    } else {
      throw Exception("Gagal memuat data mahasiswa");
    }
  }

  Future<void> addMahasiswa(Mahasiswa mhs) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "nim": mhs.nim,
        "nama": mhs.nama,
        "email": mhs.email,
        "prodi": mhs.prodi,
        "ipk": mhs.ipk,
      }),
    );
    if (response.statusCode != 200 && response.statusCode != 201) {
      throw Exception("Gagal menambahkan Mahasiswa");
    }
  }

  Future<void> updateMahasiswa(String nim, Mahasiswa mhs) async {
    final response = await http.put(
      Uri.parse("$baseUrl/$nim"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "nim": mhs.nim,
        "nama": mhs.nama,
        "email": mhs.email,
        "prodi": mhs.prodi,
        "ipk": mhs.ipk,
      }),
    );
    if (response.statusCode != 200 && response.statusCode != 201) {
      throw Exception("Gagal memperbarui data Mahasiswa");
    }
  }

  Future<String> deleteMahasiswa(String nim) async {
    final response = await http.delete(Uri.parse("$baseUrl/$nim"));
    if (response.statusCode == 200 || response.statusCode == 204) {
      try {
        final data = jsonDecode(response.body);
        return data['messages'] ?? "Data berhasil dihapus";
      } catch (_) {
        return "Data berhasil dihapus";
      }
    } else {
      throw Exception("Gagal menghapus mahasiswa (${response.statusCode})");
    }
  }
}
