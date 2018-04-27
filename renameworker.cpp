#include "renameworker.h"
#include <QFileInfo>
#include <QDir>
#include <QFuture>
#include <QtConcurrent>
#include <functional>

RenameWorker::RenameWorker(bool _usePrefix, bool _prefixHead, const QString &_prefix, bool _useSuffix, bool _suffixLast, const QString &_suffix, QObject *parent)
  : QObject(parent), usePrefix(_usePrefix), prefixAtHead(_prefixHead), prefixStr(_prefix),
    useSuffix(_useSuffix), suffixAtLast(_suffixLast), suffixStr(_suffix) {}

RenameWorker::RenameWorker(QObject *parent)
  : QObject(parent) {}

void RenameWorker::doWork(const QStringList &sourcePaths)
{
  /*
  //  emit totalCountChanged(sourcePaths.length());
  //  int currentCount = 0;
  //  emit currentCountChanged(currentCount);

  for (QString p : sourcePaths) {
    emit messageChanged(p);

          QFile curFile(p);
    auto done = curFile.rename(RenameWorker::getNewName(curFile));
    if (! done)
      emit errorDetected(p);

  //    currentCount ++;

  //    emit currentCountChanged(currentCount);*/

  std::function<bool(QString)> rename_it = [ = ](QString path) {
    QFile f(path);
    return f.rename(getNewName(f));
  };

  QFuture<bool> res = QtConcurrent::mapped(sourcePaths, rename_it);
  res.waitForFinished();
  emit resultReady(res.results());
}

QString RenameWorker::getNewName(const QFile &f)
{
  QFileInfo info(f);

  QString head = info.dir().dirName().isEmpty() ? "EMPTY_" : (info.dir().dirName() + "_");
  if (usePrefix) {
    head = prefixAtHead ? (prefixStr + head) : (head + prefixStr);
  }

  QString tail = info.completeSuffix().isEmpty() ? "" : ( "." + info.completeSuffix());
  if (useSuffix) {
    tail = suffixAtLast ? (tail + suffixStr) : (suffixStr + tail);
  }

  QString completeNewName = head + info.baseName() + tail;

  auto absDirPath = info.dir().absolutePath();

//  auto result = oldAbsPath.replace(info.baseName());
  return absDirPath + QDir::separator() + completeNewName;
}
