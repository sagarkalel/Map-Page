import 'dart:developer';
import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:map_page/models/field_data.dart';

part 'main_page_event.dart';
part 'main_page_state.dart';

class MainPageBloc extends Bloc<MainPageEvent, MainPageState> {
  String? typeOfCrop;
  String quantityUnit = 'kg';
  String image1 = '';
  String image2 = '';
  File? image1File;
  File? image2File;
  final TextEditingController varietyOfProductController =
      TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController noteController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  /// errors
  String? cropTypeError, image1Error, image2Error;

  /// dropdown values

  final List<String> cropTypes =
      List.generate(10, (index) => 'Crop Type ${index + 1}');
  final List<String> quantityUnits = ['kg', 'gm'];

  MainPageBloc() : super(InitialState()) {
    /// just change state of bloc
    on<JustChangeState>((event, emit) => emit(InitialState()));

    /// pick image1 event
    on<PickImage1>((event, emit) async {
      final result = await _pickImage();
      if (result == null) return;

      /// else
      image1File = File(result.path);
      emit(PickImageState(image1File));

      /// storing name to print in console
      image1Error = null;
      image1 = result.name;
      add(TextChange(image1: image1));
    });

    /// pick image2 event
    on<PickImage2>((event, emit) async {
      final result = await _pickImage();
      if (result == null) return;

      /// else
      image2File = File(result.path);
      emit(PickImageState(image2File));

      /// storing name to print in console
      image2Error = null;
      image2 = result.name;
      add(TextChange(image1: image2));
    });

    /// on field value change event
    on<TextChange>(
      (event, emit) {
        _onTypeChange(event.cropType, emit);
        _onVarietyChange(event.variety, emit);
        _onQuantityChange(event.quantity, emit);
        _onQuantityUnitChange(event.quantityUnit, emit);
        _onNoteChange(event.note, emit);
        _onPriceChange(event.price, emit);
        _onImage1Change(event.image1, emit);
        _onImage2Change(event.image2, emit);
      },
    );

    /// on field data save event
    on<SaveFieldData>((event, emit) {
      final isFormValidated = formKey.currentState!.validate();
      if (image1.isEmpty) {
        image1Error = "Please select Image1";
      }
      if (image2.isEmpty) {
        image2Error = "Please select Image2";
      }
      if (typeOfCrop == null) {
        cropTypeError = "Please select Crop Type";
      }

      /// if something is not validated then returning here
      if (!isFormValidated ||
          image1.isEmpty ||
          image2.isEmpty ||
          typeOfCrop == null) {
        emit(ValidationErrorState());
        Future.delayed(const Duration(milliseconds: 10))
            .then((value) => formKey.currentState!.validate());
        return;
      }

      final data = FieldData(
        cropType: typeOfCrop ?? '',
        variety: varietyOfProductController.text,
        quantity: double.parse(quantityController.text),
        quantityUnit: quantityUnit,
        price: double.parse(priceController.text),
        note: noteController.text,
        image1: image1,
        image2: image2,
      );

      /// printing data in console
      log("Data: ${data.toMap()}");
      emit(DataSavedSuccessfully());
    });
  }

  /// pick image
  Future<XFile?> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    return await picker.pickImage(source: ImageSource.camera);
  }

  _onTypeChange(val, Emitter<MainPageState> emit) {
    if (val == null) return;
    typeOfCrop = val;
    cropTypeError = null;
    emit(TextChangeState(cropType: val));
  }

  _onVarietyChange(val, Emitter<MainPageState> emit) {
    if (val == null) return;
    // typeOfCrop = val;
    emit(TextChangeState(cropType: val));
  }

  _onQuantityChange(val, Emitter<MainPageState> emit) {
    if (val == null) return;
    // typeOfCrop = val;
    emit(TextChangeState(cropType: val));
  }

  _onQuantityUnitChange(val, Emitter<MainPageState> emit) {
    if (val == null) return;
    quantityUnit = val;
    emit(TextChangeState(cropType: val));
  }

  _onPriceChange(val, Emitter<MainPageState> emit) {
    if (val == null) return;
    // typeOfCrop = val;
    emit(TextChangeState(cropType: val));
  }

  _onNoteChange(val, Emitter<MainPageState> emit) {
    if (val == null) return;
    // typeOfCrop = val;
    emit(TextChangeState(cropType: val));
  }

  _onImage1Change(val, Emitter<MainPageState> emit) {
    if (val == null) return;
    image1 = val;
    emit(TextChangeState(cropType: val));
  }

  _onImage2Change(val, Emitter<MainPageState> emit) {
    if (val == null) return;
    image2 = val;
    emit(TextChangeState(cropType: val));
  }
}
