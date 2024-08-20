import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../data/model/courier.dart';
import '../../../widgets/card_info_courier.dart';
import '../../../widgets/loading_spinner.dart';
import '../viewmodel/detail_view_model.dart';

class DetailScreen extends StatefulWidget {
  final Courier courier;

  const DetailScreen({super.key, required this.courier});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController resiController = TextEditingController();
  String? _errorMsgResi;

  @override
  void initState() {
    super.initState();
  }

  void _validateResi(String resi) {
    setState(() {
      _errorMsgResi = resi.isEmpty ? 'Nomor Resi tidak boleh kosong' : null;
    });
  }

  // void _cekResi(DetailViewModel viewModel) {
  //   if (_formKey.currentState!.validate()) {
  //     viewModel.getResi(widget.courier.code, resiController.text);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<DetailViewModel>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pelacakan Resi'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CardInfoCourier(courier: widget.courier),
            const SizedBox(height: 16),
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Nomor Resi tidak boleh kosong';
                        }
                        return null;
                      },
                      onChanged: _validateResi,
                      controller: resiController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: 'Nomor Resi',
                        hintText: 'Masukkan Nomor Resi',
                        errorText: _errorMsgResi,
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                      ),
                    ),
                    const SizedBox(height: 32),
                    SizedBox(
                      width: 200,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            viewModel.getResi(
                                widget.courier.code, resiController.text);
                          }
                        },
                        child: const Text('Cari'),
                      ),
                    ),
                  ],
                )),
            viewModel.loading
                ? loadingSpinner()
                : (viewModel.resi != null)
                    ? Text('Resi: ${viewModel.resi!.data.summary.awb}')
                    : Container(),
          ],
        ),
      ),
    );
  }
}
