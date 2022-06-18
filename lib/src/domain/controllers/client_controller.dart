import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/src/core/system_logger.dart';
import 'package:test/src/data/models/client_model.dart';
import 'package:test/src/data/repository/client_repository_impl.dart';

class ClientController extends GetxController {
  final ClientRepositoryImpl clientRepository;

  ClientController({required this.clientRepository});

  final listClients = <ClientModel>[].obs;
  RxBool loading = false.obs;

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  getAll() async {
    loading(true);
    listClients.value = await clientRepository.getAll();
    SystemLogger.verbose(this, listClients.toString());
    loading(false);
  }

  @override
  void onReady() {
    getAll();
    super.onReady();
  }

  @override
  void onInit() {
    super.onInit();
    getAll();
  }
}
