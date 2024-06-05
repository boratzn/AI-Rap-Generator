part of 'beats_bloc.dart';

@immutable
sealed class BeatsEvent {}

class FetchBeats extends BeatsEvent {}
