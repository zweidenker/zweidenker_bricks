# ZWEIDENKER Bricks 🧱

Collection of [mason](https://github.com/felangel/mason) bricks used at [ZWEIDENKER](https://zweidenker.de)

## 🧱 Bricks

| Brick                | Description                                                                                             |
|----------------------|---------------------------------------------------------------------------------------------------------|
| [iid_base_app](iid_base_app) | Creates a BaseApp with basic App Setup and a Repository |
| [iid_fastlane_android](iid_fastlane_android) | Adds basic Fastlane Setup for Android Apps |
| [iid_fastlane_ios](iid_fastlane_ios) | Adds basic Fastlane Setup for iOS Apps |
| [iid_goldens](iid_goldens) | Adds support for golden tests to a Flutter Packages using [alchemist](https://github.com/betterment/alchemist) |
| [iid_l10n](iid_l10n) | Adds support for Flutter Localisation using [POEditor](https://poeditor.com) |
| [iid_melos](iid_melos) | Adds basic [melos](https://github.com/invertase/melos) setup |
| [iid_theme](iid_theme) | Creates a basic Theme Package |
| [iid_workflow](iid_workflow) | Creates a github Workflow based on [flutter_workflows](https://github.com/zweidenker/flutter_workflows) |


## Setup

Activate melos

```
dart pub global activate mason_cli
```


Add `iid_mason_setup` as a global brick
```
mason add iid_mason_setup --git-url https://github.com/zweidenker/zweidenker_bricks --git-path bricks/iid_mason_setup
```

If you want you can also add the `iid_screen` brick globally as that should be created from the directory of the app
```
mason add iid_screen --git-url https://github.com/zweidenker/zweidenker_bricks --git-path bricks/iid_screen
```

Navigate to the folder where you want to create the mason bricks and run
```
mason make iid_mason_setup
```

This will create the mason file with the above mentioned iid_bricks and run `mason get` from there you can use the `mason make` with any of these bricks