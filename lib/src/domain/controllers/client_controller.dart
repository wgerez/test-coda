import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/src/data/models/client_model.dart';
import 'package:test/src/data/repository/client_repository_impl.dart';

class ClientController extends GetxController {
  final ClientRepositoryImpl clientRepository;

  ClientController({required this.clientRepository});

  final listClients = <ClientModel>[].obs;
  RxBool loading = false.obs;

  String idClientUpdate = '';
  String addressClientUpdate = '';

  String get getIdClientUpdate => idClientUpdate;
  set setIdClientUpdate(String id) {
    idClientUpdate = id;
  }

  set setAddressClientUpdate(String address) {
    addressClientUpdate = address;
  }

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  getAll() async {
    loading(true);
    final clients = await clientRepository.getAll();
    listClients.assignAll(clients);
    listClients.refresh();
    loading(false);
    update();
  }

  Future<bool> updateClient() async {
    final client = ClientRequestModel(
      id: idClientUpdate.toString(),
      firstname: firstNameController.text,
      lastname: lastNameController.text,
      email: emailController.text,
      address: addressClientUpdate,
      photo: '',
      caption: '',
    );
    return await clientRepository.update(client);
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
