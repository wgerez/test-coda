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
  final _listClients = <ClientModel>[].obs;
  RxBool loading = false.obs;
  RxBool loadingUpdate = false.obs;

  String idClientUpdate = '';
  String addressClientUpdate = '';
  int idRemove = 0;

  String get getIdClientUpdate => idClientUpdate;
  set setIdClientUpdate(String id) {
    idClientUpdate = id;
  }

  int get idToRemove => idRemove;
  set idToRemove(int id) {
    idRemove = id;
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

  void searchClient(String search) {
    final clients = _listClients.where((client) {
      return client.firstname!.toLowerCase().contains(search.toLowerCase()) ||
          client.lastname!.toLowerCase().contains(search.toLowerCase()) ||
          client.email!.toLowerCase().contains(search.toLowerCase());
    }).toList();
    listClients.value =
        clients.isEmpty && search.isEmpty ? _listClients : clients;
    listClients.refresh();
  }

  Future<void> getAll() async {
    loading(true);
    final clients = await clientRepository.getAll();
    listClients.assignAll(clients);
    _listClients.assignAll(clients);
    listClients.refresh();
    loading(false);
  }

  Future<bool> newClient() async {
    if (formNewKey.currentState!.validate()) {
      final client = NewClientRequestModel(
        firstname: newFirstNameController.text.capitalize!,
        lastname: newLastNameController.text.capitalize!,
        email: newEmailController.text.toLowerCase(),
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
        firstname: firstNameController.text.capitalize!,
        lastname: lastNameController.text.capitalize!,
        email: emailController.text.toLowerCase(),
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
