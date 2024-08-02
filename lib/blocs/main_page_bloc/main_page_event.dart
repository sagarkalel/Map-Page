part of 'main_page_bloc.dart';

abstract class MainPageEvent extends Equatable {
  const MainPageEvent();

  @override
  List<Object?> get props => [];
}

class TextChange extends MainPageEvent {
  final String? cropType;
  final String? variety;
  final String? quantity;
  final String? quantityUnit;
  final String? price;
  final String? note;
  final String? image1;
  final String? image2;

  const TextChange({
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

class SaveFieldData extends MainPageEvent {}

class JustChangeState extends MainPageEvent {}

class PickImage1 extends MainPageEvent {}

class PickImage2 extends MainPageEvent {}
