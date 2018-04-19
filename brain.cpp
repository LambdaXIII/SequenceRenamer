#include "brain.h"
#include <QDir>
#include <QFuture>
#include <QtConcurrent>
#include <functional>
#include "renameworker.h"

Brain::Brain(QObject *parent) : QObject(parent)
{
  workThread = new QThread(this);
}

Brain::~Brain()
{
  workThread->quit();
  workThread->wait();
}

bool Brain::isImportable(const QList<QUrl> &urls)
{
  for (QUrl x : urls) {
    if (! x.isLocalFile())
      return false;
  }
  return true;
}

void Brain::doIt(const QList<QUrl> &urls)
{

  std::function<QString(QUrl)> u_to_s = [ = ](QUrl x) {
    return x.toLocalFile();
  };
  QFuture<QString> strFuture = QtConcurrent::mapped(urls, u_to_s);
  QStringList strList = strFuture.results();

  auto pathList = Brain::expandFolders(strList);
  if (pathList.isEmpty())
    return;

  RenameWorker *worker = new RenameWorker;
  worker->moveToThread(workThread);
  connect(workThread, &QThread::finished, worker, &RenameWorker::deleteLater);
  connect(worker, &RenameWorker::resultReady, this, &Brain::renameFinished);
  connect(this, &Brain::startTheWork, worker, &RenameWorker::doWork);

  emit renameStarted();
  workThread->start();

  emit startTheWork(pathList);
}

bool Brain::actual_rename_function(const QString &path)
{
  QFile file(path);
  auto new_name = Brain::get_new_name(file);
  return file.rename(new_name);
}

QStringList Brain::expandFolders(const QStringList &list)
{
  QStringList result;
  for (QString current : list) {
    /*
    if (! current.startsWith(".")) {
    QFileInfo currentInfo(current);
    if (currentInfo.isDir()) {
      QDir currentDir(current);
      auto entries = currentDir.entryList();
      result << Brain::expandFolders(entries);
    } else if (currentInfo.isFile()) {
      result << current;
    }
    }
    */
    QFileInfo curInfo(current);
    if (curInfo.isFile())
      result << current;
    else if (curInfo.isDir()) {
      QDir curDir(current);
      QDirIterator dirIter(curDir.absolutePath(),  QDir::Files | QDir::NoDotAndDotDot | QDir::NoSymLinks, QDirIterator::Subdirectories);
      while (dirIter.hasNext()) {
        dirIter.next();
        result << dirIter.filePath();
//        QFileInfo iterInfo = dirIter.fileInfo();
//        if (iterInfo.isFile())
//          result << iterInfo.absolutePath();
      }
    }
  }
  return result;
}

QString Brain::get_new_name(const QFile &file)
{
  QFileInfo info(file);

  QString middle = info.dir().dirName();
  if (middle.isEmpty())
    middle = "EMPTY";

  QString completeNewName = middle + "_" + info.baseName() + "." + info.completeSuffix();

  auto absDirPath = info.dir().absolutePath();

//  auto result = oldAbsPath.replace(info.baseName());
  return absDirPath + QDir::separator() + completeNewName;

}

QString Brain::tryIt(const QUrl &url)
{
  auto res = get_new_name(QFile(url.toLocalFile()));
  return res;
}



