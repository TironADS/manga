part of 'manga_bloc.dart';

@immutable
abstract class MangaState {}

class MangaInitial extends MangaState {}
class MangaBlocLoading extends MangaState {}
class MangaBlocLoaded extends MangaState {}
class MangaBlocError extends MangaState {}