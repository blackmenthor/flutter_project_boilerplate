import 'package:flutter/material.dart';
import 'package:flutter_project_boilerplate/core/redux/action_mapper.dart';
import 'package:flutter_project_boilerplate/core/redux/actions/authentication/authentication_actions.dart';
import 'package:redux/redux.dart';


class RegisterPageActionMapper extends ActionMapper {
    RegisterPageActionMapper(Store store) : super(store);

    submitRegister({
       @required
       String phoneNumber,
        @required
        String password,
        @required
        String name,
        @required
        String email,
    }) {
        List<String> names = name.split(" ");
        String firstName = names.first;
        String lastName;

        try {
            lastName = names.sublist(1, names.length).fold(
                "", (previousValue, element) => previousValue + " " + element);
        } catch (ex) {
            print(ex);
        }

        dispatch(
            RegisterAction(
                phoneNumber: phoneNumber,
                firstName: firstName,
                lastName: lastName,
                password: password,
                email: email
            )
        );
    }
}
