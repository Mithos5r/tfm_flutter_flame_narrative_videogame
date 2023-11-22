import "../l10n/l10n.dart";
import "package:collection/collection.dart";

enum Episodes {
  unDiaEnElBanco(1),
  elGeriatrico(2),
  unaManyanaCualquiera(3),
  ejercitandoElCuerpo(4),
  deliriosDeLaMente(5),
  ejercitandoLaMente(6),
  unDiaMas(7),
  navidad(8),
  alheizemer(9),
  negociacion(10),
  negacion(11),
  olvido(12),
  dorianExpress(13),
  elPerro(14),
  ;

  const Episodes(
    this.chapterEpisodeIndex,
  );
  final int chapterEpisodeIndex;

  static Episodes fromChapterEpisodeIndex({required int episode}) {
    return values.firstWhereOrNull(
          (element) => element.chapterEpisodeIndex == episode,
        ) ??
        unDiaEnElBanco;
  }

  static String localizations({
    required AppLocalizations l10n,
    required int episode,
  }) {
    final chapter = Episodes.fromChapterEpisodeIndex(
      episode: episode,
    );
    return chapter.resolve<String>(
      onChapter1: () => l10n.chapter1,
      onChapter2: () => l10n.chapter2,
      onChapter3: () => l10n.chapter3,
      onChapter4: () => l10n.chapter4,
      onChapter5: () => l10n.chapter5,
      onChapter6: () => l10n.chapter6,
      onChapter7: () => l10n.chapter7,
      onChapter8: () => l10n.chapter8,
      onChapter9: () => l10n.chapter9,
      onChapter10: () => l10n.chapter10,
      onChapter11: () => l10n.chapter11,
      onChapter12: () => l10n.chapter12,
      onChapter13: () => l10n.chapter13,
      onChapter14: () => l10n.chapter14,
    );
  }

  T resolve<T>({
    required T Function() onChapter1,
    required T Function() onChapter2,
    required T Function() onChapter3,
    required T Function() onChapter4,
    required T Function() onChapter5,
    required T Function() onChapter6,
    required T Function() onChapter7,
    required T Function() onChapter8,
    required T Function() onChapter9,
    required T Function() onChapter10,
    required T Function() onChapter11,
    required T Function() onChapter12,
    required T Function() onChapter13,
    required T Function() onChapter14,
  }) {
    final chapter = switch (this) {
      Episodes.unDiaEnElBanco => onChapter1,
      Episodes.elGeriatrico => onChapter2,
      Episodes.unaManyanaCualquiera => onChapter3,
      Episodes.ejercitandoElCuerpo => onChapter4,
      Episodes.deliriosDeLaMente => onChapter5,
      Episodes.ejercitandoLaMente => onChapter6,
      Episodes.unDiaMas => onChapter7,
      Episodes.navidad => onChapter8,
      Episodes.alheizemer => onChapter9,
      Episodes.negociacion => onChapter10,
      Episodes.negacion => onChapter11,
      Episodes.olvido => onChapter12,
      Episodes.dorianExpress => onChapter13,
      Episodes.elPerro => onChapter14,
    };
    return chapter.call();
  }
}
