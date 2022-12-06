import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../exceptions/form_exceptions.dart';
import '../../../models/user.dart';
import '../../../services/auth_service.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterFormState()) {
    on<RegisterRequestEvent>((event, emit) async {
      emit(RegisterLoadingState());
      try {
        final user = await AuthService.register(
            email: event.email, password: event.password, name: event.name);
        emit(RegisterSuccessState(
          user,
        ));
      } on FormGeneralException catch (e) {
        emit(RegisterErrorState(e));
      } on FormFieldsException catch (e) {
        emit(RegisterErrorState(e));
      } catch (e) {
        emit(RegisterErrorState(
          FormGeneralException(message: 'Ocorreu um erro :/'),
        ));
      }
    });
  }
}
