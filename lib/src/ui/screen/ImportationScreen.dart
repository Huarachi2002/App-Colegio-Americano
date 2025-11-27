import 'package:colegio_americano/src/ui/view_model/ImportationScreenViewModel.dart';
import 'package:flutter/material.dart';

class ImportationScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ImportationScreenState();
}

class _ImportationScreenState extends State<ImportationScreen> {
  ImportationScreenViewModel _viewModel = ImportationScreenViewModel();

  @override
  void initState() {
    super.initState();
    _viewModel.importData(context);
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Importación de datos'),
      ),
      body: Container(
        color: Colors.white,
      ),
    );
  }
}
