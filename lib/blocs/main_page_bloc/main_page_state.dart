part of 'main_page_bloc.dart';

class MainPageState extends Equatable {
  const MainPageState();

  @override
  List<Object?> get props => [];
}

class InitialState extends MainPageState {}

class DataSavedSuccessfully extends MainPageState {}

class ValidationErrorState extends MainPageState {}

class PickImageState extends MainPageState {
  final File? imageFile;

  const PickImageState(this.imageFile);

  @override
  List<Object?> get props => [imageFile];
}

class TextChangeState extends MainPageState {
  final String? cropType,
      variety,
      quantity,
      quantityUnit,
      price,
      note,
      image1,
      image2;

  const TextChangeState({
    this.cropType,
    this.variety,
    this.quantity,
    this.quantityUnit,
    this.price,
    this.note,
    this.image1,
    this.image2,
  });

  @override
  List<Object?> get props => [
        cropType,
        variety,
        quantity,
        quantityUnit,
        note,
        price,
        image1,
        image2,
      ];
}
