# Rover Control Dashboard
The Rover Control Dashboard is a graphical desktop application the Binghamton University Rover Team will use to operate and monitor the rover. It is a vital part of our remote command station.

We are redesigning and rebuilding our remote operating interfaces using more modern toolkits to promote rapid development and deployment. Visit [BinghamtonRover/BurtOS-2](https://github.com/BinghamtonRover/BurtOS-2) for command software from the 2022 competition year.

## Structure 

Every folder in this project has a purpose, but you’ll mostly need the `lib` folder. 

- `.github`: Contains GitHub specific files, like Actions workflow files
- `lib`: Contains all the cross-platform Flutter code for the front and back ends
- `linux`: Contains Linux-specific code generated by `flutter create`
- `macos`: Contains Mac-specific code generated by `flutter create`
- `test`: Contains unit and integration tests for the project
- `windows`: Contains Windows-specific code generated by `flutter create`

It’s worth noting that the platform-specific directories **do not** contain the compiled executables. Those would be under the `build` directory, which is in the `.gitignore` file. These directories simply hold platform-specific configuration that was automatically generated by the `flutter create` command and may have since been customized by us. 

`lib` is the main entry point for the project – `flutter run` really just runs `lib/main.dart`. The interesting code is in five libraries organized under `lib/src`.

- `data`: Defines data classes needed for the app. See `lib/data.dart`
- `services`: Defines and manages out-of-app resources. See `lib/services.dart`
- `models`: Hosts app-wide logic involving data models and services. See `lib/models.dart`
- `widgets`: Defines small chunks of UI across the app. See `lib/widgets`
- `pages`: Hosts UI code for individual pages, made of widgets. See `lib/pages.dart`

As explained in the files listed above, these libraries are organized hierarchically, starting with `data` and ending with `pages` (and ultimately being imported by `main.dart`). Each library can only import libraries before it to avoid cyclic dependencies. Each library can get quite complex and contain several smaller libraries – this is only the high-level overview of the project’s structure. 

A Dart library is technically just a file. To add more complexity, classes and functions are split into other files, and they are all collected into one main file that `export`s them all. For example, all the data classes are under `lib/src/data`, but you can import them by importing from `lib/data.dart` (using a package import: `import package:rover_control_dashboard/data.dart`). Specific documentation on individual libraries can be found in their corresponding library file. 

 ## Compiling

To run a debug build, run the appropriate command for your computer:

```
flutter run -d windows
flutter run -d linux
flutter run -d macos
```

To compile a release build, run the appropriate command for your computer: 

```
flutter build windows
flutter build linux
flutter build macos
```

Note that Flutter is not cross-platform, which means you can only output executables for the platform you compile on. The location of the executable differs by platform: 

- Windows: `build\windows\runner\Release`
- Linux: `build/linux/x64/release/bundle`
- Mac: `build/linux/x64/release/bundle`

To analyze your code, run: 

```
flutter analyze --dartdocs
```

This ensures that your code passes all the lint options defined in `analysis_options.yaml`.

## Dependencies

Dependencies are managed in `pubspec.yaml` and refer to packages and plugins on https://pub.dev. Follow instructions there for adding packages to the project. When running any of the above compilation commands, Dart may detect updated dependencies and try to update them for you. When this happens, Git will indicate that `pubspec.lock` has changed. 

While this is nice, we can avoid dependency-caused issues by ensuring we’re all using the same versions – that’s what `pubspec.lock` is for. Instead of giving a minimum version of a specific dependency, it lists the _exact_ version for _all_ dependencies, both our own dependencies and dependencies of our dependencies. Changes to this file should be tracked by version control. Practically, it is cumbersome to open a pull request virtually every time you compile your code. Instead, only submit your updated `pubspec.lock` as part of your other changes, which indicates that the new dependencies have been tested along with your changes. 
