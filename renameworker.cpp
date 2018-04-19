#include "renameworker.h"
#include <QFileInfo>
#include <QDir>
#include <QFuture>
#include <QtConcurrent>
#include <functional>

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
    return f.rename(RenameWorker::getNewName(f));
  };

  QFuture<bool> res = QtConcurrent::mapped(sourcePaths, rename_it);
  res.waitForFinished();
  emit resultReady(res.results());
}

QString RenameWorker::getNewName(const QFile &f)
{
  QFileInfo info(f);

  QString middle = info.dir().dirName();
  if (middle.isEmpty())
    middle = "EMPTY";

  QString completeNewName = middle + "_" + info.baseName() + "." + info.completeSuffix();

  auto absDirPath = info.dir().absolutePath();

//  auto result = oldAbsPath.replace(info.baseName());
  return absDirPath + QDir::separator() + completeNewName;
}
