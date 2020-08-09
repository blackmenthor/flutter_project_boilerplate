import 'package:flutter/material.dart';
import 'package:injector/injector.dart';

typedef T InjectableBuilder<T>(Injector injector);

abstract class Graph<T extends InjectableWidget> {
  final Injector _appInjector;
  String _depNamePrefix;

  Graph([Injector appInjector])
      : _appInjector = appInjector ?? Injector.appInstance {
    _depNamePrefix = runtimeType.toString();
    register();
  }

  DT getDependency<DT>({String dependencyName = ""}) {
    // If there's not a global dependency with this type and name, use the local name (with prefix):
    String depName = dependencyName;
    if (!_appInjector.exists<DT>(dependencyName: dependencyName)) {
      depName = _depName(dependencyName);
    }

    // Return the global or local dependency accordingly
    return _appInjector.getDependency<DT>(
      dependencyName: depName,
    );
  }

  void registerDependency<DT>(InjectableBuilder<DT> dependency,
      {String dependencyName}) {
    String depName = _depName(dependencyName);
    if (!_appInjector.exists<DT>(dependencyName: depName))
      _appInjector.registerDependency<DT>(
        dependency,
        dependencyName: depName,
      );
  }

  void registerSingleton<DT>(InjectableBuilder<DT> dependency, {String dependencyName}) {
    String depName = _depName(dependencyName);
    if (!_appInjector.exists<DT>(dependencyName: depName))
      _appInjector.registerSingleton<DT>(
        dependency,
        dependencyName: depName,
      );
  }

  // In order to define local dependencies, we prefix their name with a unique prefix for this graph:
  String _depName(String name) => (name ?? "") == "" ? _depNamePrefix : "$_depNamePrefix.$name";

  // Abstract methods, to be defined by the actual implementation:
  void register();
  void inject(T subject);
}

mixin InjectableWidget on Widget {
  Graph graph();

  void setup() {
    graph().inject(this);
  }
}
