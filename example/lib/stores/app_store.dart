import 'package:baguette/baguette.dart';
import 'package:example/model/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_store.freezed.dart';


@freezed
class RemoteData with _$RemoteData {
  const factory RemoteData.notAsked() = NotAsked;

  const factory RemoteData.loading() = Loading;

  const factory RemoteData.failure() = Failure;

  const factory RemoteData.success() = Success;
}

@freezed
class AppState extends BState with _$AppState {
  const factory AppState({
    @Default(RemoteData.notAsked()) RemoteData remoteData,
    @Default(User()) User user,
  }) = _AppState;
}

class AppStore extends Store<AppState> {
  AppStore() : super(const AppState());
}
