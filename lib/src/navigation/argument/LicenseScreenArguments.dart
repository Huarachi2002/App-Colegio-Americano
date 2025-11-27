import 'package:colegio_americano/src/data/remote/response/LicenseListResponse.dart';
import 'package:colegio_americano/src/data/remote/response/LicenseResponse.dart';

class LicenseScreenArguments {
  final int studentId;
  final String erpCode;
  final String name;
  final String grade;
  final String parallel;
  final LicenseListResponse? license;

  LicenseScreenArguments(
      {required this.studentId,
      required this.erpCode,
      required this.name,
      required this.grade,
      required this.parallel,
      this.license});

  @override
  String toString() {
    return 'LicenseScreenArguments{studentId: $studentId, erpCode: $erpCode, name: $name, grade: $grade, parallel: $parallel, license: $license}';
  }
}
