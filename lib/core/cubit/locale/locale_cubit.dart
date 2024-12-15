import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'locale_state.dart';

class LocaleCubit  extends Cubit<LocaleState>{
  LocaleCubit() : super(const LocaleState(Locale('tr')));
  void toEnglish(){
    emit(const LocaleState(Locale('en')));
  }
  void toTurkish(){
    emit(const LocaleState(Locale('tr')));
  }
  void toPortuguese(){
    emit(const LocaleState(Locale('pt')));
  }
}

