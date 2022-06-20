import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/src/data/models/client_model.dart';
import 'package:test/src/data/repository/client_repository_impl.dart';

class ClientController extends GetxController {
  final ClientRepositoryImpl clientRepository;

  ClientController({required this.clientRepository});

  final formUpdateKey = GlobalKey<FormState>();
  final formNewKey = GlobalKey<FormState>();
  final listClients = <ClientModel>[].obs;
  RxBool loading = false.obs;
  RxBool loadingUpdate = false.obs;

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

  TextEditingController newFirstNameController = TextEditingController();
  TextEditingController newLastNameController = TextEditingController();
  TextEditingController newEmailController = TextEditingController();

  getAll() async {
    loading(true);
    final clients = await clientRepository.getAll();
    listClients.assignAll(clients);
    listClients.refresh();
    loading(false);
  }

  Future<bool> newClient() async {
    if (formNewKey.currentState!.validate()) {
      final client = NewClientRequestModel(
        firstname: newFirstNameController.text,
        lastname: newLastNameController.text,
        email: newEmailController.text,
        address: '',
        photo: '',
        caption: '',
      );
      return await clientRepository.create(client);
    }
    return false;
  }

  Future<bool> removeClient(int id) async {
    return await clientRepository.remove(id);
  }

  Future<bool> updateClient() async {
    if (formUpdateKey.currentState!.validate()) {
      loadingUpdate.value = true;
      update();
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
    return false;
  }

  String? validateFirstName(String? firstName) {
    if (firstName != null && firstName.isEmpty) {
      return 'First name is required';
    }
    return null;
  }

  String? validateLastName(String? firstName) {
    if (firstName != null && firstName.isEmpty) {
      return 'Last name is required';
    }
    return null;
  }

  String? validateEmail(String? mail) {
    if (mail != null && !GetUtils.isEmail(mail)) {
      return 'Mail is required';
    }
    return null;
  }

  @override
  void onInit() {
    super.onInit();
    getAll();
  }
}
